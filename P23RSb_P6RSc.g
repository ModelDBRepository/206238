// genesis

// Setting the axonal propagation velocity
float CABLE_VEL = 1	// scale factor = 1/(cable velocity) sec/meter

float destlim = {P23RSb_P6RSc_destlim}

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

echo Making connections from the P23RSb cells to the P6RSc cells.


//P23RSb - P6RSc AMPA

str s

//Load synapse location array

str locations = "apdend3 apdend4 apdend5 apdend6 apdend7 apdend8 apdend9 apdend10"

foreach s ({arglist {locations}})

    rvolumeconnect /P23RSbnet/P23RSb[]/soma/spk2  \
	      /P6RScnet/P6RSc[]/{s}/Ex_ch13P23RSAMPA@all	    \
	      -relative			    \
	      -sourcemask box -1 -1  -1  1  1  1   \
	      -destmask   box -{destlim} -{destlim}  -1  {destlim}  {destlim}  1   \
          -probability 0.12500*{P23RSb_P6RSc_prob}

end

//P23RSb - P6RSc NMDA

str s

//Load synapse location array

str locations = "apdend3 apdend4 apdend5 apdend6 apdend7 apdend8 apdend9 apdend10"

foreach s ({arglist {locations}})

    rvolumeconnect /P23RSbnet/P23RSb[]/soma/spk2  \
	      /P6RScnet/P6RSc[]/{s}/Ex_ch13P23RSNMDA@all	    \
	      -relative			    \
	      -sourcemask box -1 -1  -1  1  1  1   \
	      -destmask   box -{destlim} -{destlim}  -1  {destlim}  {destlim}  1   \
          -probability 0.12500*{P23RSb_P6RSc_prob}

end

echo Setting weights and delays for P23RSb->P6RSc connections.

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

rvolumedelay /P23RSbnet/P23RSb[]/soma/spk2 -radial  {P23RSb_P6RSc_axdelayCV} -add -gaussian {P23RSb_P6RSc_axdelaystdev} {P23RSb_P6RSc_axdelaymaxdev}

//P23RSb - P6RSc AMPA

str s

//Load synapse location array

str locations = "apdend3 apdend4 apdend5 apdend6 apdend7 apdend8 apdend9 apdend10"

foreach s ({arglist {locations}})

    syndelay    /P6RScnet/P6RSc[]/{s}/Ex_ch13P23RSAMPA {P23RSb_P6RSc_syndelay} -add -gaussian {P23RSb_P6RSc_syndelaystdev} {P23RSb_P6RSc_syndelaymaxdev}

end

//P23RSb - P6RSc NMDA

str s

//Load synapse location array

str locations = "apdend3 apdend4 apdend5 apdend6 apdend7 apdend8 apdend9 apdend10"

foreach s ({arglist {locations}})

    syndelay    /P6RScnet/P6RSc[]/{s}/Ex_ch13P23RSNMDA {P23RSb_P6RSc_syndelay} -add -gaussian {P23RSb_P6RSc_syndelaystdev} {P23RSb_P6RSc_syndelaymaxdev}

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

rvolumeweight /P23RSbnet/P23RSb[]/soma/spk2 -decay {P23RSdecayrate} {P23RSmaxwgt} {P23RSminwgt}




