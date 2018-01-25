// genesis

// Setting the axonal propagation velocity
float CABLE_VEL = 1	// scale factor = 1/(cable velocity) sec/meter

float destlim = {P6RSd_P23FRBa_destlim}

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

echo Making connections from the P6RSd cells to the P23FRBa cells.

//P6RSd - P23FRBa AMPA

str s

//Load synapse location array

str locations = "apdend4aL apdend4bL apdend4aR apdend4bR"

foreach s ({arglist {locations}})

    rvolumeconnect /P6RSdnet/P6RSd[]/soma/spk14  \
	      /P23FRBanet/P23FRBa[]/{s}/Ex_ch22P6RSAMPA@all	    \
	      -relative			    \
	      -sourcemask box -1 -1  -1  1  1  1  \
	      -destmask   box -{destlim} -{destlim}  -1 {destlim}  {destlim}  1   \
          -probability 0.25000*{P6RSd_P23FRBa_prob}

end

//P6RSd - P23FRBa NMDA

str s

//Load synapse location array

str locations = "apdend4aL apdend4bL apdend4aR apdend4bR"

foreach s ({arglist {locations}})

    rvolumeconnect /P6RSdnet/P6RSd[]/soma/spk14  \
	      /P23FRBanet/P23FRBa[]/{s}/Ex_ch22P6RSNMDA@all	    \
	      -relative			    \
	      -sourcemask box -1 -1  -1  1  1  1  \
	      -destmask   box -{destlim} -{destlim}  -1 {destlim}  {destlim}  1   \
          -probability 0.25000*{P6RSd_P23FRBa_prob}

end

echo Setting weights and delays for P6RSd->P23FRBa connections.
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

rvolumedelay /P6RSdnet/P6RSd[]/soma/spk14 -radial  {P6RSd_P23FRBa_axdelayCV} -add -gaussian {P6RSd_P23FRBa_axdelaystdev} {P6RSd_P23FRBa_axdelaymaxdev}

//P6RSd - P23FRBa AMPA

str s

//Load synapse location array

str locations = "apdend4aL apdend4bL apdend4aR apdend4bR"

foreach s ({arglist {locations}})

    syndelay    /P23FRBanet/P23FRBa[]/{s}/Ex_ch22P6RSAMPA {P6RSd_P23FRBa_syndelay} -add -gaussian {P6RSd_P23FRBa_syndelaystdev} {P6RSd_P23FRBa_syndelaymaxdev}

end

//P6RSd - P23FRBa NMDA

str s

//Load synapse location array

str locations = "apdend4aL apdend4bL apdend4aR apdend4bR"

foreach s ({arglist {locations}})

    syndelay    /P23FRBanet/P23FRBa[]/{s}/Ex_ch22P6RSNMDA {P6RSd_P23FRBa_syndelay} -add -gaussian {P6RSd_P23FRBa_syndelaystdev} {P6RSd_P23FRBa_syndelaymaxdev}

end

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

rvolumeweight /P6RSdnet/P6RSd[]/soma/spk14 -decay {P6RSdecayrate} {P6RSmaxwgt} {P6RSminwgt}




