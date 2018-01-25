// genesis

// Setting the axonal propagation velocity
float CABLE_VEL = 1	// scale factor = 1/(cable velocity) sec/meter

float destlim = {P5IBb_P23FRBa_destlim}

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

echo Making connections from the P5IBb cells to the P23FRBa cells.

//P5IBb - P23FRBa AMPA

str s

//Load synapse location array

str locations = "apdend3 apdend4aL apdend4bL apdend4aR apdend4bR apdend5aLLL apdend5aLL apdend5aLR apdend5aLRR apdend5aRRR apdend5aRR apdend5aRL apdend5aRLL"

foreach s ({arglist {locations}})

    rvolumeconnect /P5IBbnet/P5IBb[]/soma/spk7  \
	      /P23FRBanet/P23FRBa[]/{s}/Ex_ch22P5IBAMPA@all	    \
	      -relative			    \
	      -sourcemask box -1 -1  -1  1  1  1  \
	      -destmask   box -{destlim} -{destlim}  -1 {destlim}  {destlim}  1   \
          -probability 0.07692*{P5IBb_P23FRBa_prob}

end

//P5IBb - P23FRBa NMDA

str s

//Load synapse location array

str locations = "apdend3 apdend4aL apdend4bL apdend4aR apdend4bR apdend5aLLL apdend5aLL apdend5aLR apdend5aLRR apdend5aRRR apdend5aRR apdend5aRL apdend5aRLL"

foreach s ({arglist {locations}})

    rvolumeconnect /P5IBbnet/P5IBb[]/soma/spk7  \
	      /P23FRBanet/P23FRBa[]/{s}/Ex_ch22P5IBNMDA@all	    \
	      -relative			    \
	      -sourcemask box -1 -1  -1  1  1  1  \
	      -destmask   box -{destlim} -{destlim}  -1 {destlim}  {destlim}  1   \
          -probability 0.07692*{P5IBb_P23FRBa_prob}

end

echo Setting weights and delays for P5IBb->P23FRBa connections.
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

rvolumedelay /P5IBbnet/P5IBb[]/soma/spk7 -radial  {P5IBb_P23FRBa_axdelayCV} -add -gaussian {P5IBb_P23FRBa_axdelaystdev} {P5IBb_P23FRBa_axdelaymaxdev}

//P5IBb - P23FRBa AMPA

str s

//Load synapse location array

str locations = "apdend3 apdend4aL apdend4bL apdend4aR apdend4bR apdend5aLLL apdend5aLL apdend5aLR apdend5aLRR apdend5aRRR apdend5aRR apdend5aRL apdend5aRLL"

foreach s ({arglist {locations}})

    syndelay    /P23FRBanet/P23FRBa[]/{s}/Ex_ch22P5IBAMPA {P5IBb_P23FRBa_syndelay} -add -gaussian {P5IBb_P23FRBa_syndelaystdev} {P5IBb_P23FRBa_syndelaymaxdev}

end

//P5IBb - P23FRBa NMDA

str s

//Load synapse location array

str locations = "apdend3 apdend4aL apdend4bL apdend4aR apdend4bR apdend5aLLL apdend5aLL apdend5aLR apdend5aLRR apdend5aRRR apdend5aRR apdend5aRL apdend5aRLL"

foreach s ({arglist {locations}})

    syndelay    /P23FRBanet/P23FRBa[]/{s}/Ex_ch22P5IBNMDA {P5IBb_P23FRBa_syndelay} -add -gaussian {P5IBb_P23FRBa_syndelaystdev} {P5IBb_P23FRBa_syndelaymaxdev}

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

rvolumeweight /P5IBbnet/P5IBb[]/soma/spk7 -decay {P5IBdecayrate} {P5IBmaxwgt} {P5IBminwgt}



