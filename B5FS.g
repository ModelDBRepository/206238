// genesis

// Arranging the B5FS cells in space.

echo Creating B5FS network

float originxmin
float originymin

int ydex
float placer

int i,j,istartdex
int k = 0
float randzpos

placer = {mynode}/{sqrtNnodes}

//echo placer= {placer}

ydex = { round {placer} }

//echo ydex= {ydex}

originxmin = ({mynode}-{ydex}*sqrtNnodes)*B5FS_NX*B5FS_SEPX

//echo originxmin= {originxmin}

originymin = {ydex}*B5FS_NY*B5FS_SEPY

//echo originymin= {originymin}

create neutral /B5FSnet

if ({columntype == 0})

     for (j = 0; j < B5FS_NY; j = j+1)
          for (i = 0; i < B5FS_NX; i = i+1)

               randzpos = { rand 550e-6 1262e-6 }

               copy /B5FS /B5FSnet/B5FS[{k}]
               position /B5FSnet/B5FS[{k}] \
                 {originxmin + B5FS_SEPX*i} {originymin + B5FS_SEPY*j} {randzpos}
               k=k+1

          end
     end

end

if ({columntype == 1})

echo Traub B5FS!

     for (j = 0; j < B5FS_NY; j = j+1)

          istartdex = {trunc {j/2}}*2-j+1

          for (i = istartdex; i < B5FS_NX; i = i+2)
              
               randzpos = { rand 550e-6 1262e-6 }

               copy /B5FS /B5FSnet/B5FS[{k}]
               position /B5FSnet/B5FS[{k}] \
                 {originxmin + B5FS_SEPX*i} {originymin + B5FS_SEPY*j} {randzpos}
               k=k+1

          end
     end

end
