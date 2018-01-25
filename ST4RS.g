// genesis

// Arranging the ST4RS cells in space.

echo Creating ST4RS network

//float	ST4RS_SEPX = 25e-6
//float	ST4RS_SEPY = 25e-6
//float	ST4RS_NX = 5
//float	ST4RS_NY = 5

float originxmin
float originymin

int ydex
float placer

float randzpos
int i,j
int k = 0

placer = {mynode}/{sqrtNnodes}

//echo placer= {placer}

ydex = { round {placer} }

//echo ydex= {ydex}

originxmin = ({mynode}-{ydex}*sqrtNnodes)*ST4RS_NX*ST4RS_SEPX

//echo originxmin= {originxmin}

originymin = {ydex}*ST4RS_NY*ST4RS_SEPY

//echo originymin= {originymin}

create neutral /ST4RSnet

// CREATING THE PLANE OF ST4RS cells
//createmap /ST4RS /ST4RSnet  \
//	{ST4RS_NX} {ST4RS_NY} \
//	-delta {ST4RS_SEPX} {ST4RS_SEPY} \
//	-origin {originxmin} {originymin}

// Note that these cells' positions overlap.  This doesn't cause any
// problems since we can refer to them as separate groups.

for (j = 0; j < ST4RS_NY; j = j+1)
     for (i = 0; i < ST4RS_NX; i = i+1)

          randzpos = { rand 1262e-6 1602e-6 }

          copy /ST4RS /ST4RSnet/ST4RS[{k}]
          position /ST4RSnet/ST4RS[{k}] \
            {originxmin + ST4RS_SEPX*i} {originymin + ST4RS_SEPY*j} {randzpos}
          k=k+1

     end
end
