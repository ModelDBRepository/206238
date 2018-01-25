// genesis

// Arranging the C23FS cells in space.

echo Creating C23FS network

// Note that these cells' positions overlap.  This doesn't cause any
// problems since we can refer to them as separate groups.

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

originxmin = ({mynode}-{ydex}*sqrtNnodes)*C23FS_NX*C23FS_SEPX

//echo originxmin= {originxmin}

originymin = {ydex}*C23FS_NY*C23FS_SEPY

//echo originymin= {originymin}

create neutral /C23FSnet

if ({columntype == 0})

     for (j = 0; j < C23FS_NY; j = j+1)
          for (i = 0; i < C23FS_NX; i = i+1)

               randzpos = { rand 1602e-6 2871e-6 }

               copy /C23FS /C23FSnet/C23FS[{k}]
               position /C23FSnet/C23FS[{k}] \
                 {originxmin + C23FS_SEPX*i} {originymin + C23FS_SEPY*j} {randzpos}
               k=k+1

          end
     end

end

if ({columntype == 1})

echo Traub C23FS!

     for (j = 0; j < C23FS_NY; j = j+1)

          istartdex = j-{trunc {j/2}}*2

          for (i = istartdex; i < C23FS_NX; i = i+2)
              
               randzpos = { rand 1602e-6 2871e-6 }

               copy /C23FS /C23FSnet/C23FS[{k}]
               position /C23FSnet/C23FS[{k}] \
                 {originxmin + C23FS_SEPX*i} {originymin + C23FS_SEPY*j} {randzpos}
               k=k+1

          end
     end

end
