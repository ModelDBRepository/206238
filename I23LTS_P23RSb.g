// genesis

// Setting the axonal propagation velocity
float CABLE_VEL = 1	// scale factor = 1/(cable velocity) sec/meter

float destlim = {I23LTS_P23RSb_destlim}

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

echo Making connections from the I23LTS cells to the P23RSb cells.


//I23LTS - P23RSb GABAa

str s

//Load synapse location array

str locations = "basalLsuperb basalLsuperc basalLmidsuperb basalLmidsuperc basalLmiddeepb basalLmiddeepc basalLdeepb basalLdeepc basalRsuperb basalRsuperc basalRmidsuperb basalRmidsuperc basalRmiddeepb basalRmiddeepc basalRdeepb basalRdeepc apdend3 apdend4aR apdend4bR apdend4aL apdend4bL apdend5aLLL apdend5bLLL apdend5cLLL apdend5aLL apdend5bLL apdend5cLL apdend5aLR apdend5bLR apdend5cLR apdend5aLRR apdend5bLRR apdend5cLRR apdend5aRLL apdend5bRLL apdend5cRLL apdend5aRL apdend5bRL apdend5cRL apdend5aRR apdend5bRR apdend5cRR apdend5aRRR apdend5bRRR apdend5cRRR apobdistRb apobdistRc apobproxRb apobproxRc apobdistLb apobdistLc apobproxLb apobproxLc"

foreach s ({arglist {locations}})

    rvolumeconnect /I23LTSnet/I23LTS[]/soma/spk18  \
	      /P23RSbnet/P23RSb[]/{s}/Inh_ch2I23LTSGABAa@all	    \
	      -relative			    \
	      -sourcemask box -1 -1  -1  1  1  1  \
	      -destmask   box -{destlim} -{destlim}  -1 {destlim}  {destlim}  1   \
          -probability 0.01887*{I23LTS_P23RSb_prob}

end

echo Setting weights and delays for I23LTS->P23RSb connections.
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

rvolumedelay /I23LTSnet/I23LTS[]/soma/spk18 -radial  {I23LTS_P23RSb_axdelayCV} -add -gaussian {I23LTS_P23RSb_axdelaystdev} {I23LTS_P23RSb_axdelaymaxdev}

//I23LTS - P23RSb GABAa

str s

//Load synapse location array

str locations = "basalLsuperb basalLsuperc basalLmidsuperb basalLmidsuperc basalLmiddeepb basalLmiddeepc basalLdeepb basalLdeepc basalRsuperb basalRsuperc basalRmidsuperb basalRmidsuperc basalRmiddeepb basalRmiddeepc basalRdeepb basalRdeepc apdend3 apdend4aR apdend4bR apdend4aL apdend4bL apdend5aLLL apdend5bLLL apdend5cLLL apdend5aLL apdend5bLL apdend5cLL apdend5aLR apdend5bLR apdend5cLR apdend5aLRR apdend5bLRR apdend5cLRR apdend5aRLL apdend5bRLL apdend5cRLL apdend5aRL apdend5bRL apdend5cRL apdend5aRR apdend5bRR apdend5cRR apdend5aRRR apdend5bRRR apdend5cRRR apobdistRb apobdistRc apobproxRb apobproxRc apobdistLb apobdistLc apobproxLb apobproxLc"

foreach s ({arglist {locations}})

    syndelay    /P23RSbnet/P23RSb[]/{s}/Inh_ch2I23LTSGABAa {I23LTS_P23RSb_syndelay} -add -gaussian {I23LTS_P23RSb_syndelaystdev} {I23LTS_P23RSb_syndelaymaxdev}

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

rvolumeweight /I23LTSnet/I23LTS[]/soma/spk18 -decay {I23LTSdecayrate} {I23LTSmaxwgt} {I23LTSminwgt}




