// genesis

// Arranging the P5IBd cells in space.

echo Creating P5IBd network

//float	P5IBd_SEPX = 25e-6
//float	P5IBd_SEPY = 25e-6
//float	P5IBd_NX = 5
//float	P5IBd_NY = 5

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

originxmin = ({mynode}-{ydex}*sqrtNnodes)*P5IBd_NX*P5IBd_SEPX

//echo originxmin= {originxmin}

originymin = {ydex}*P5IBd_NY*P5IBd_SEPY

//echo originymin= {originymin}

create neutral /P5IBdnet

// CREATING THE PLANE OF P5IBd cells
//createmap /P5IBd /P5IBdnet  \
//	{P5IBd_NX} {P5IBd_NY} \
//	-delta {P5IBd_SEPX} {P5IBd_SEPY} \
//	-origin {originxmin} {originymin}

// Note that these cells' positions overlap.  This doesn't cause any
// problems since we can refer to them as separate groups.

for (j = 0; j < P5IBd_NY; j = j+1)
     for (i = 0; i < P5IBd_NX; i = i+1)

          randzpos = { rand 550e-6 1262e-6 }

          copy /P5IBd /P5IBdnet/P5IBd[{k}]
          position /P5IBdnet/P5IBd[{k}] \
            {originxmin + P5IBd_SEPX*i} {originymin + P5IBd_SEPY*j} {randzpos}
          k=k+1

     end
end
