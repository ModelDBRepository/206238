// genesis

// Setting the axonal propagation velocity
float CABLE_VEL = 1	// scale factor = 1/(cable velocity) sec/meter

float destlim = {P5RSa_ST4RS_destlim}

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

echo Making connections from the P5RSa cells to the ST4RS cells.

//P5RSa - ST4RS AMPA

str s

//Load synapse location array

str locations = "distdendNlongb distdendNlongc distdendNmidb distdendNmidc distdendNshorta distdendNshortb distdendElongb distdendElongc distdendEmidb distdendEmidc distdendEshorta distdendEshortb distdendSlongb distdendSlongc distdendSmidb distdendSmidc distdendSshorta distdendSshortb distdendWlongb distdendWlongc distdendWmidb distdendWmidc distdendWshorta distdendWshortb"

foreach s ({arglist {locations}})

    rvolumeconnect /P5RSanet/P5RSa[]/soma/spk23  \
	      /ST4RSnet/ST4RS[]/{s}/Ex_ch17P5RSAMPA@all	    \
	      -relative			    \
	      -sourcemask box -1 -1  -1  1  1  1   \
	      -destmask   box -{destlim} -{destlim}  -1 {destlim}  {destlim}  1   \
          -probability 0.042*{P5RSa_ST4RS_prob}

end

//P5RSa - ST4RS NMDA

str s

//Load synapse location array

str locations = "distdendNlongb distdendNlongc distdendNmidb distdendNmidc distdendNshorta distdendNshortb distdendElongb distdendElongc distdendEmidb distdendEmidc distdendEshorta distdendEshortb distdendSlongb distdendSlongc distdendSmidb distdendSmidc distdendSshorta distdendSshortb distdendWlongb distdendWlongc distdendWmidb distdendWmidc distdendWshorta distdendWshortb"

foreach s ({arglist {locations}})

    rvolumeconnect /P5RSanet/P5RSa[]/soma/spk23  \
	      /ST4RSnet/ST4RS[]/{s}/Ex_ch17P5RSNMDA@all	    \
	      -relative			    \
	      -sourcemask box -1 -1  -1  1  1  1   \
	      -destmask   box -{destlim} -{destlim}  -1 {destlim}  {destlim}  1   \
          -probability 0.042*{P5RSa_ST4RS_prob}

end

echo Setting weights and delays for P5RSa->ST4RS connections.
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

rvolumedelay /P5RSanet/P5RSa[]/soma/spk23 -radial  {P5RSa_ST4RS_axdelayCV} -add -gaussian {P5RSa_ST4RS_axdelaystdev} {P5RSa_ST4RS_axdelaymaxdev}

// P5RSa - ST4RS AMPA

str s

//Load synapse location array

str locations = "distdendNlongb distdendNlongc distdendNmidb distdendNmidc distdendNshorta distdendNshortb distdendElongb distdendElongc distdendEmidb distdendEmidc distdendEshorta distdendEshortb distdendSlongb distdendSlongc distdendSmidb distdendSmidc distdendSshorta distdendSshortb distdendWlongb distdendWlongc distdendWmidb distdendWmidc distdendWshorta distdendWshortb"

foreach s ({arglist {locations}})

    syndelay    /ST4RSnet/ST4RS[]/{s}/Ex_ch17P5RSAMPA {P5RSa_ST4RS_syndelay} -add -gaussian {P5RSa_ST4RS_syndelaystdev} {P5RSa_ST4RS_syndelaymaxdev}

end

// P5RSa - ST4RS NMDA

str s

//Load synapse location array

str locations = "distdendNlongb distdendNlongc distdendNmidb distdendNmidc distdendNshorta distdendNshortb distdendElongb distdendElongc distdendEmidb distdendEmidc distdendEshorta distdendEshortb distdendSlongb distdendSlongc distdendSmidb distdendSmidc distdendSshorta distdendSshortb distdendWlongb distdendWlongc distdendWmidb distdendWmidc distdendWshorta distdendWshortb"

foreach s ({arglist {locations}})

    syndelay    /ST4RSnet/ST4RS[]/{s}/Ex_ch17P5RSNMDA {P5RSa_ST4RS_syndelay} -add -gaussian {P5RSa_ST4RS_syndelaystdev} {P5RSa_ST4RS_syndelaymaxdev}

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

rvolumeweight /P5RSanet/P5RSa[]/soma/spk23 -decay {P5RSdecayrate} {P5RSmaxwgt} {P5RSminwgt}
//planarweight /P5RSanet/P5RSa[]/soma/spk23 -fixed 0.50



