// genesis

// Arranging the P6RSc cells in space.

echo Creating P6RSc network

//float	P6RSc_SEPX = 25e-6
//float	P6RSc_SEPY = 25e-6
//float	P6RSc_NX = 5
//float	P6RSc_NY = 5

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

originxmin = ({mynode}-{ydex}*sqrtNnodes)*P6RSc_NX*P6RSc_SEPX

//echo originxmin= {originxmin}

originymin = {ydex}*P6RSc_NY*P6RSc_SEPY

//echo originymin= {originymin}

create neutral /P6RScnet

// CREATING THE PLANE OF P6RSc cells
//createmap /P6RSc /P6RScnet  \
//	{P6RSc_NX} {P6RSc_NY} \
//	-delta {P6RSc_SEPX} {P6RSc_SEPY} \
//	-origin {originxmin} {originymin}

// Note that these cells' positions overlap.  This doesn't cause any
// problems since we can refer to them as separate groups.

for (j = 0; j < P6RSc_NY; j = j+1)
     for (i = 0; i < P6RSc_NX; i = i+1)

          randzpos = { rand 0 550e-6 }

          copy /P6RSc /P6RScnet/P6RSc[{k}]
          position /P6RScnet/P6RSc[{k}] \
            {originxmin + P6RSc_SEPX*i} {originymin + P6RSc_SEPY*j} {randzpos}
          k=k+1

     end
end
