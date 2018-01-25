// genesis

// Arranging the P23RSd cells in space.

echo Creating P23RSd network

//float	P23RSd_SEPX = 25e-6
//float	P23RSd_SEPY = 25e-6
//float	P23RSd_NX = 5
//float	P23RSd_NY = 5

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

originxmin = ({mynode}-{ydex}*sqrtNnodes)*P23RSd_NX*P23RSd_SEPX

//echo originxmin= {originxmin}

originymin = {ydex}*P23RSd_NY*P23RSd_SEPY

//echo originymin= {originymin}

create neutral /P23RSdnet

// CREATING THE PLANE OF P23RSd cells
//createmap /P23RSd /P23RSdnet  \
//	{P23RSd_NX} {P23RSd_NY} \
//	-delta {P23RSd_SEPX} {P23RSd_SEPY} \
//	-origin {originxmin} {originymin}

// Note that these cells' positions overlap.  This doesn't cause any
// problems since we can refer to them as separate groups.

for (j = 0; j < P23RSd_NY; j = j+1)
     for (i = 0; i < P23RSd_NX; i = i+1)

          randzpos = { rand 1602e-6 2871e-6 }

          copy /P23RSd /P23RSdnet/P23RSd[{k}]
          position /P23RSdnet/P23RSd[{k}] \
            {originxmin + P23RSd_SEPX*i} {originymin + P23RSd_SEPY*j} {randzpos}
          k=k+1

     end
end
