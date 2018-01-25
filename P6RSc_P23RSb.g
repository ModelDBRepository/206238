// genesis

// Setting the axonal propagation velocity
float CABLE_VEL = 1	// scale factor = 1/(cable velocity) sec/meter

float destlim = {P6RSc_P23RSb_destlim}

/*
 * Usage :
 * volumeconnect source-path destination-path
 *		 [-relative]
 *		 [-sourcemask {box,ellipse} x1 y1 x2 y2]
 *		 [-sourcehole {box,ellipse} x1 y1 x2 y2]
 *		 [-destmask   {box,ellipse} x1 y1 x2 y2]
 *		 [-desthole   {box,ellipse} x1 y1 x2 y2]
 *		 [-probability p]
 */

echo Making connections from the P6RSc cells to the P23RSb cells.

//P6RSc - P23RSb AMPA

str s

//Load synapse location array

str locations = "apdend4aL apdend4bL apdend4aR apdend4bR"

foreach s ({arglist {locations}})

    rvolumeconnect /P6RScnet/P6RSc[]/soma/spk13  \
	      /P23RSbnet/P23RSb[]/{s}/Ex_ch2P6RSAMPA@all	    \
	      -relative			    \
	      -sourcemask box -1 -1  -1  1  1  1  \
	      -destmask   box -{destlim} -{destlim}  -1 {destlim}  {destlim}  1   \
          -probability 0.25000*{P6RSc_P23RSb_prob}

end

//P6RSc - P23RSb NMDA

str s

//Load synapse location array

str locations = "apdend4aL apdend4bL apdend4aR apdend4bR"

foreach s ({arglist {locations}})

    rvolumeconnect /P6RScnet/P6RSc[]/soma/spk13  \
	      /P23RSbnet/P23RSb[]/{s}/Ex_ch2P6RSNMDA@all	    \
	      -relative			    \
	      -sourcemask box -1 -1  -1  1  1  1  \
	      -destmask   box -{destlim} -{destlim}  -1 {destlim}  {destlim}  1   \
          -probability 0.25000*{P6RSc_P23RSb_prob}

end

echo Setting weights and delays for P6RSc->P23RSb connections.
// assigning delays using the volumedelay function

/* 
 * Usage :
 * volumedelay path 
 * [-fixed delay]
 * [-radial propagation_velocity] 
 * [-uniform range]   (not used here)
 * [-gaussian sd max] (not used here)
 * [-exp mid max]     (not used here)
 * [-absoluterandom]  (not used here)
 */

rvolumedelay /P6RScnet/P6RSc[]/soma/spk13 -radial  {P6RSc_P23RSb_axdelayCV} -add -gaussian {P6RSc_P23RSb_axdelaystdev} {P6RSc_P23RSb_axdelaymaxdev}

//P6RSc - P23RSb AMPA

str s

//Load synapse location array

str locations = "apdend4aL apdend4bL apdend4aR apdend4bR"

foreach s ({arglist {locations}})

    syndelay    /P23RSbnet/P23RSb[]/{s}/Ex_ch2P6RSAMPA {P6RSc_P23RSb_syndelay} -add -gaussian {P6RSc_P23RSb_syndelaystdev} {P6RSc_P23RSb_syndelaymaxdev}

end

//P6RSc - P23RSb NMDA

str s

//Load synapse location array

str locations = "apdend4aL apdend4bL apdend4aR apdend4bR"

foreach s ({arglist {locations}})

    syndelay    /P23RSbnet/P23RSb[]/{s}/Ex_ch2P6RSNMDA {P6RSc_P23RSb_syndelay} -add -gaussian {P6RSc_P23RSb_syndelaystdev} {P6RSc_P23RSb_syndelaymaxdev}

end

// assigning weights using the volumeweight function

/* 
 * Usage :
 *  volumeweight sourcepath 
 *          [-fixed weight]
 *          [-decay decay_rate max_weight min_weight]
 *          [-uniform range] 
 *          [-gaussian sd max] 
 *          [-exponential mid max]
 *          [-absoluterandom]
 */

rvolumeweight /P6RScnet/P6RSc[]/soma/spk13 -decay {P6RSdecayrate} {P6RSmaxwgt} {P6RSminwgt}



