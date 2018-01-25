// genesis

// Setting the axonal propagation velocity
float CABLE_VEL = 1	// scale factor = 1/(cable velocity) sec/meter

float destlim = {C23FS_P5RSa_destlim}

/*
 * Usage :
 * planarconnect source-path destination-path
 *		 [-relative]
 *		 [-sourcemask {box,ellipse} x1 y1 x2 y2]
 *		 [-sourcehole {box,ellipse} x1 y1 x2 y2]
 *		 [-destmask   {box,ellipse} x1 y1 x2 y2]
 *		 [-desthole   {box,ellipse} x1 y1 x2 y2]
 *		 [-probability p]
 */

echo Making connections from the C23FS cells to the P5RSa cells.

// C23FS - P5RSa GABAa

rvolumeconnect /C23FSnet/C23FS[]/soma/spk15  \
	      /P5RSanet/P5RSa[]/axona/Inh_ch23C23FSGABAa@all	    \
	      -relative			    \
	      -sourcemask box -1 -1  -1  1  1  1   \
	      -destmask   box -{destlim} -{destlim}  -1 {destlim}  {destlim}  1   \
          -probability 1.0*{C23FS_P5RSa_prob}

echo Setting weights and delays for C23FS->P5RSa connections.
// assigning delays using the planardelay function

/* 
 * Usage :
 * planardelay path 
 * [-fixed delay]
 * [-radial propagation_velocity] 
 * [-uniform range]   (not used here)
 * [-gaussian sd max] (not used here)
 * [-exp mid max]     (not used here)
 * [-absoluterandom]  (not used here)
 */

rvolumedelay /C23FSnet/C23FS[]/soma/spk15 -radial  {C23FS_P5RSa_axdelayCV} -add -gaussian {C23FS_P5RSa_axdelaystdev} {C23FS_P5RSa_axdelaymaxdev}

//C23FS - P5RSa GABAa

syndelay    /P5RSanet/P5RSa[]/axona/Inh_ch23C23FSGABAa {C23FS_P5RSa_syndelay} -add -gaussian {C23FS_P5RSa_syndelaystdev} {C23FS_P5RSa_syndelaymaxdev}

// assigning weights using the planarweight function

/* 
 * Usage :
 *  planarweight sourcepath 
 *          [-fixed weight]
 *          [-decay decay_rate max_weight min_weight]
 *          [-uniform range] 
 *          [-gaussian sd max] 
 *          [-exponential mid max]
 *          [-absoluterandom]
 */

rvolumeweight /C23FSnet/C23FS[]/soma/spk15 -decay {C23FSdecayrate} {C23FSmaxwgt} {C23FSminwgt}




