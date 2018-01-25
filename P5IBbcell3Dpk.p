// P5IBb.p - for TraubIB_VP

//	Format of file :
// x,y,z,dia are in microns, all other units are SI (Meter Kilogram Sec Amp)
// In polar mode 'r' is in microns, theta and phi in degrees 
// Control line options start with a '*'
// The format for each compartment parameter line is :
//name	parent	r	theta	phi	d	ch	dens ...
//in polar mode, and in cartesian mode :
//name	parent	x	y	z	d	ch	dens ...
// For channels, "dens" =  maximum conductance per unit area of compartment
// For spike elements, "dens" is the spike threshold
//		Coordinate mode
*relative
*cartesian
*asymmetric

//		Specifying constants
   *set_compt_param	RM	5.0   // 5.0
   *set_compt_param	RA	2.50  // 2.50
   *set_compt_param	CM	0.009 // 0.009
   *set_compt_param     EREST_ACT	-0.07 // -0.075
   *set_compt_param     ELEAK           -0.0666 // -0.075


//SOMA *************************************************************   
// For the soma, use the leakage potential (-0.07 + 0.0106) for Em
//*set_compt_param     ELEAK	-0.0594
// Actually, after Traub et al. J Neurophys 2003;89:909-921, will maintain
// leakage potential at ELEAK   -0.07
soma  none   0  0  15  18     Ca_s7 -6.1304081E14 NaF7           2000     \
                              NaP7        1.6     KDR7           1700     \
                              KA7         200     K27               5     \
                              KM7         119     CaL7              1     \
                              CaH7         40     KCs7            160     \
                              AR7         1.0     KAHPs7            2.0
   *set_compt_param     CM      0.018
   *set_compt_param     RM      2.5

//APICAL DENDRITE COMPARTMENTS ***************************************
// apdend1 Fig 1. Traub et al., J Neurophysiol 2003;89:909-921
apdend1  soma  0  0  75  4      Ca_d7 -1.47129963E17   NaF7        3000   \
                                NaP7         2.4       KDR7        2400   \
                                KA7          160        K27          10   \
                                KM7          380       CaL7           2   \
                                CaH7         80        KCd7         320   \
                                AR7          2.0      KAHPd7         4   
                               
// apdend2 Fig 1. Traub et al., J Neurophysiol 2003;89:909-921
apdend2  apdend1  0  0  75  3.8   Ca_d7 -1.54873652E17    NaF7       1500  \
                                    NaP7          1.2     KDR7       1500  \
                                    KA7          80       K27         10   \
                                    KM7         380.8     CaL7         2  \
                                    CaH7         80       KCd7       320  \
                                    AR7           2.0     KAHPd7       4.0


// apdend3 Fig 1. Traub et al., J Neurophysiol 2003;89:909-921
apdend3  apdend2  0  0  75  3.6     Ca_d7 -1.63477742E17    NaF7         300  \
                                    NaP7          0.24      KDR7           0  \
                                    KA7           12         K27          10  \
                                    KM7         380.8       CaL7           2  \
                                    CaH7         80         KCd7           10 \
                                    AR7           2.0       KAHPd7         4.0


// apdend4 Fig 1. Traub et al., J Neurophysiol 2003;89:909-921
apdend4  apdend3  0  0  75  2.4   Ca_d7  -1.94730587E17  NaF7            300  \
                                    NaP7          0.24     KDR7            0  \
                                    KA7           12        K27             10  \
                                    KM7         380.8      CaL7            2  \
                                    CaH7         80        KCd7            10  \
                                    AR7          2.0      KAHPd7          4.0

// apdend5 Fig 1. Traub et al., J Neurophysiol 2003;89:909-921
apdend5  apdend4  0  0  75  3.2   Ca_d7  -2.06900497E17     NaF7         300  \
                                    NaP7          0.24      KDR7           0  \
                                    KA7           12         K27          10  \
                                    KM7         380.8       CaL7           2  \
                                    CaH7         40         KCd7           10  \
                                    AR7          2.0       KAHPd7         4.0


// apdend6 Fig 1. Traub et al., J Neurophysiol 2003;89:909-921
apdend6  apdend5  0  0  75  3   Ca_d7 -2.20693871E17    NaF7         300  \
                                    NaP7          0.24      KDR7           0  \
                                    KA7           12         K27           10  \
                                    KM7         380.8       CaL7           2  \
                                    CaH7          40         KCd7          10  \
                                    AR7           2.0       KAHPd7         4.0

// apdend7 Fig 1. Traub et al., J Neurophysiol 2003;89:909-921
apdend7  apdend6  0  0  75  2.8   Ca_d7 -2.36457724E17     NaF7         300  \
                                    NaP7          0.24     KDR7           0  \
                                    KA7           12        K27          10  \
                                    KM7         380.8      CaL7           2  \
                                    CaH7         40        KCd7           10  \
                                    AR7           2.0      KAHPd7         4.0

// apdend8 Fig 1. Traub et al., J Neurophysiol 2003;89:909-921
apdend8  apdend7  0  0  75  2.6   Ca_d7 -2.82942241E17   NaF7         300  \
                                    NaP7         0.24   KDR7           0  \
                                    KA7          12      K27           10  \
                                    KM7        380.8    CaL7           2  \
                                    CaH7        40      KCd7           10  \
                                    AR7          2.0    KAHPd7         4.0

// apdend9 Fig 1. Traub et al., J Neurophysiol 2003;89:909-921
apdend9  apdend8  0  0  75  2.4   Ca_d7 -3.06520752E17     NaF7         300   \
                                    NaP7       0.24     KDR7           0   \
                                    KA7        12        K27           10   \
                                    KM7      380.8      CaL7           2   \
                                    CaH7      40        KCd7           10   \
                                    AR7        2.0      KAHPd7         4.0

// apdend10 Fig 1. Traub et al., J Neurophysiol 2003;89:909-921
apdend10  apdend9  0  0  75  2   Ca_d7 -4.04611345E17 NaF7           300  \
                                    NaP7       0.24     KDR7           0  \
                                    KA7        12        K27           10  \
                                    KM7      380.8      CaL7           2  \
                                    CaH7      40        KCd7           10  \
                                    AR7        2.0      KAHPd7         4.0

// apdend11 Fig 1. Traub et al., J Neurophysiol 2003;89:909-921
apdend11  apdend10  0  0  75  1.6    Ca_d7 -5.51737374E17    NaF7        60  \
                                       NaP7       0.048    KDR7          0  \
                                       KA7        12        K27          10  \
                                       KM7       112        CaL7          2  \
                                       CaH7      20        KCd7          24  \
                                       AR7        2.0      KAHPd7        4.0

// apdend12 Fig 1. Traub et al., J Neurophysiol 2003;89:909-921
apdend12  apdend11  0  0  75  1.4    Ca_d7 -6.8309675E17     NaF7         60  \
                                       NaP7         0.048    KDR7          0  \
                                       KA7           12      K27          10  \
                                       KM7          112      CaL7          2  \
                                       CaH7         20       KCd7         24  \
                                       AR7          2.0      KAHPd7        4.0

// apdend13 Fig 1. Traub et al., J Neurophysiol 2003;89:909-921
apdend13  apdend12  0  0  75  1.2    Ca_d7 -8.5827204E17    NaF7          60   \
                                       NaP7         0.048   KDR7          0   \
                                       KA7           12     K27           10   \
                                       KM7          112     CaL7          2   \
                                       CaH7         20     KCd7           24   \
                                       AR7           2.0   KAHPd7         4.0

// apdend14aR Fig 1. Traub et al., J Neurophysiol 2003;89:909-921
apdend14aR  apdend13 11.2 -19.5 55.6 1.1    Ca_d7 -1.00311682E18     NaF7    60  \
                                             NaP7      0.048    KDR7          0  \
                                             KA7       12        K27          10  \
                                             KM7       112        CaL7        2  \
                                             CaH7      54        KCd7         24  \
                                             AR7        4.0      KAHPd7       4.0


// apdend14bR Fig 1. Traub et al., J Neurophysiol 2003;89:909-921
apdend14bR  apdend14aR 11.2 -19.5 55.6 1.1  Ca_d7 -1.00321358E18  NaF7        60  \
                                             NaP7       0.048    KDR7          0  \
                                             KA7        12        K27         10  \
                                             KM7       112        CaL7         2  \
                                             CaH7      12        KCd7         24  \
                                             AR7       4.0      KAHPd7        4.0

// apdend14cR Fig 1. Traub et al., J Neurophysiol 2003;89:909-921
apdend14cR  apdend14bR 11.2 -19.5 55.6 1.1    Ca_d7 -1.00321358E18    NaF7     60  \
                                              NaP7      0.048    KDR7          0  \
                                              KA7       12        K27          10  \
                                              KM7       112        CaL7        2  \
                                              CaH7       12       KCd7         24  \
                                              AR7        4.0      KAHPd7       4.0

// apdend14dR Fig 1. Traub et al., J Neurophysiol 2003;89:909-921
apdend14dR  apdend14cR 11.2 -19.5 55.6 1.1 Ca_d7 -1.00307944E18 NaF7         60  \
                                           NaP7       0.048     KDR7          0  \
                                           KA7       12         K27           10  \
                                           KM7       112         CaL7         2  \
                                           CaH7      12         KCd7         24  \
                                           AR7       4.0       KAHPd7        4.0

// apdend14aL Fig 1. Traub et al., J Neurophysiol 2003;89:909-921
apdend14aL  apdend13 -11.2 19.5 55.6  1.1    Ca_d7 -1.0030927E18  NaF7         60  \
                                              NaP7      0.048    KDR7          0  \
                                              KA7       12        K27          10   \
                                              KM7       112       CaL7          2  \
                                              CaH7      54        KCd7         24  \
                                              AR7       4.0      KAHPd7        4.0


// apdend14bL Fig 1. Traub et al., J Neurophysiol 2003;89:909-921
apdend14bL  apdend14aL -11.2 19.5 55.6 1.1  Ca_d7 -1.00322458E18  NaF7        60  \
                                             NaP7      0.048    KDR7          0  \
                                             KA7       12        K27          10  \
                                             KM7       112       CaL7          2  \
                                             CaH7      12        KCd7         24  \
                                             AR7       4.0      KAHPd7        4.0

// apdend14cL Fig 1. Traub et al., J Neurophysiol 2003;89:909-921
apdend14cL  apdend14bL -11.2 19.5 55.6 1.1    Ca_d7 -1.00322368E18  NaF7       60  \
                                              NaP7      0.048    KDR7          0  \
                                              KA7       12        K27          10  \
                                              KM7       112       CaL7          2  \
                                              CaH7       12        KCd7         24  \
                                              AR7        4.0      KAHPd7        4.0

// apdend14dL Fig 1. Traub et al., J Neurophysiol 2003;89:909-921
apdend14dL  apdend14cL -11.2 19.5 55.6 1.1 Ca_d7 -1.0030782E18    NaF7        60  \
                                           NaP7       0.048     KDR7          0  \
                                           KA7        12         K27          10  \
                                           KM7       112         CaL7         2  \
                                           CaH7       12         KCd7         24  \
                                           AR7        4.0       KAHPd7        4.0

//APICAL OBLIQUE DENDRITE COMPARTMENTS ***************************************

// apobdistRa Fig 1. Traub et al., J Neurophysiol 2003;89:909-921
apobdistRa  apdend3  42.4  42.4 0.0 1.24      Ca_d7 -8.1574073E17 NaF7         1500  \
                                             NaP7        1.2     KDR7          1500  \
                                             KA7        160       K27            10  \
                                             KM7       380.8     CaL7             2  \
                                             CaH7       80       KCd7           320  \
                                             AR7         2.0     KAHPd7          4.0

// apobdistRb Fig 1. Traub et al., J Neurophysiol 2003;89:909-921
apobdistRb  apobdistRa  42.4  42.4 0.0 1.24    Ca_d7 -8.1574094E17    NaF7       300  \
                                              NaP7       0.24     KDR7            0  \
                                              KA7        12        K27            10   \
                                              KM7      380.8      CaL7            2  \
                                              CaH7      80        KCd7            10  \
                                              AR7       2.0      KAHPd7          4.0

// apobdistRc Fig 1. Traub et al., J Neurophysiol 2003;89:909-921
apobdistRc  apobdistRb  42.4  42.4 0.0 1.24    Ca_d7 -8.1574321E17    NaF7         300  \
                                              NaP7       0.24     KDR7            0  \
                                              KA7        12        K27            10  \
                                              KM7      380.8      CaL7            2  \
                                              CaH7      80        KCd7            10  \
                                              AR7        2.0      KAHPd7          4.0

// apobdistLa Fig 1. Traub et al., J Neurophysiol 2003;89:909-921
apobdistLa  apdend3  -42.4  -42.4 0.0 1.24     Ca_d7 -8.1574073E17 NaF7        1500  \
                                               NaP7       1.2     KDR7         1500  \
                                               KA7        160       K27           10  \
                                               KM7       380.8     CaL7           2  \
                                               CaH7       80       KCd7          320  \
                                               AR7        2.0     KAHPd7         4.0

// apobdistLb Fig 1. Traub et al., J Neurophysiol 2003;89:909-921
apobdistLb  apobdistLa  -42.4  -42.4 0.0 1.24   Ca_d7 -8.1574094E17    NaF7         300  \
                                                NaP7       0.24     KDR7            0  \
                                                KA7        12        K27            10  \
                                                KM7      380.8      CaL7            2  \
                                                CaH7      80        KCd7            10  \
                                                AR7       2.0      KAHPd7          4.0

// apobdistLc Fig 1. Traub et al., J Neurophysiol 2003;89:909-921
apobdistLc  apobdistLb  -42.4 -42.4 0.0 1.24    Ca_d7 -8.1574321E17 NaF7          300  \
                                                NaP7       0.24     KDR7            0  \
                                                KA7        12        K27            10  \
                                                KM7      380.8      CaL7            2  \
                                                CaH7      80        KCd7            10  \
                                                AR7        2.0      KAHPd7         4.0

// apobmidRa Fig 1. Traub et al., J Neurophysiol 2003;89:909-921
apobmidRa  apdend2  42.4  -42.4 0.0  1.24      Ca_d7 -8.1574073E17    NaF7      1500  \
                                              NaP7        1.2     KDR7          1500  \
                                              KA7        160       K27            10  \
                                              KM7       380.8     CaL7            2  \
                                              CaH7       80       KCd7          320  \
                                              AR7         2.0     KAHPd7          4.0

// apobmidRb Fig 1. Traub et al., J Neurophysiol 2003;89:909-921
apobmidRb  apobmidRa  42.4  -42.4 0.0  1.24    Ca_d7 -8.1574094E17    NaF7        300  \
                                               NaP7       0.24     KDR7            0  \
                                               KA7        12        K27            10  \
                                               KM7      380.8      CaL7            2  \
                                               CaH7      80        KCd7            10  \
                                               AR7        2.0      KAHPd7          4.0

// apobmidRc Fig 1. Traub et al., J Neurophysiol 2003;89:909-921
apobmidRc  apobmidRb  42.4  -42.4 0.0  1.24    Ca_d7 -8.1574321E17    NaF7        300  \
                                               NaP7       0.24     KDR7            0  \
                                               KA7        12        K27            10   \
                                               KM7      380.8      CaL7            2  \
                                               CaH7      80        KCd7            10  \
                                               AR7        2.0      KAHPd7          4.0

// apobmidLa Fig 1. Traub et al., J Neurophysiol 2003;89:909-921
apobmidLa  apdend2  -42.4  42.4 0.0  1.24      Ca_d7 -8.1574073E17 NaF7          1500  \
                                              NaP7       1.2      KDR7          1500  \
                                              KA7        160       K27            10  \
                                              KM7       380.8     CaL7             2  \
                                              CaH7       80       KCd7           320  \
                                              AR7        2.0     KAHPd7          4.0

// apobmidLb Fig 1. Traub et al., J Neurophysiol 2003;89:909-921
apobmidLb  apobmidLa  -42.4  42.4 0.0  1.24     Ca_d7 -8.1574094E17   NaF7          300  \
                                               NaP7       0.24     KDR7            0  \
                                               KA7        12        K27            10   \
                                               KM7      380.8      CaL7            2  \
                                               CaH7      80        KCd7            10  \
                                               AR7        2.0      KAHPd7          4.0

// apobmidLc Fig 1. Traub et al., J Neurophysiol 2003;89:909-921
apobmidLc  apobmidLb  -42.4  42.4 0.0  1.24     Ca_d7 -8.1574321E17   NaF7         300  \
                                               NaP7       0.24     KDR7            0  \
                                               KA7        12        K27            10  \
                                               KM7      380.8      CaL7            2  \
                                               CaH7      80        KCd7            10  \
                                               AR7        2.0      KAHPd7          4.0

// apobproxRa Fig 1. Traub et al., J Neurophysiol 2003;89:909-921
apobproxRa  apdend1  42.4  42.4 0.0  1.24     Ca_d7 -8.1574073E17 NaF7         1500  \
                                              NaP7        1.2     KDR7         1500  \
                                              KA7        160       K27            10   \
                                              KM7       380.8     CaL7            2  \
                                              CaH7       80       KCd7          320  \
                                              AR7        2.0     KAHPd7          4.0

// apobproxRb Fig 1. Traub et al., J Neurophysiol 2003;89:909-921
apobproxRb  apobproxRa  42.4  42.4 0.0  1.24     Ca_d7 -8.1574094E17 NaF7          300  \
                                                NaP7       0.24     KDR7            0  \
                                                KA7        12        K27             10  \
                                                KM7      380.8      CaL7            2  \
                                                CaH7      80        KCd7            10  \
                                                AR7        2.0      KAHPd7          4.0

// apobproxRc Fig 1. Traub et al., J Neurophysiol 2003;89:909-921
apobproxRc  apobproxRb  42.4  42.4 0.0  1.24     Ca_d7 -8.1573867E17 NaF7          300  \
                                                NaP7       0.24     KDR7            0  \
                                                KA7        12        K27             10  \
                                                KM7      380.8     CaL7            2  \
                                                CaH7      80        KCd7            10  \
                                                AR7        2.0      KAHPd7          4.0

// apobproxLa Fig 1. Traub et al., J Neurophysiol 2003;89:909-921
apobproxLa  apdend1  -42.4  -42.4 0.0  1.24      Ca_d7 -8.1574073E17    NaF7      1500  \
                                                NaP7        1.2     KDR7          1500  \
                                                KA7        160       K27             10  \
                                                KM7       380.8     CaL7            2  \
                                                CaH7       80       KCd7          320  \
                                                AR7        2.0     KAHPd7          4.0

// apobproxLb Fig 1. Traub et al., J Neurophysiol 2003;89:909-921
apobproxLb  apobproxLa  -42.4  -42.4 0.0  1.24     Ca_d7 -8.1574094E17 NaF7          300  \
                                                  NaP7       0.24     KDR7            0  \
                                                  KA7        12        K27            10  \
                                                  KM7      380.8      CaL7            2  \
                                                  CaH7      80        KCd7            10  \
                                                  AR7        2.0      KAHPd7          4.0

// apobproxLc Fig 1. Traub et al., J Neurophysiol 2003;89:909-921
apobproxLc  apobproxLb  -42.4  -42.4 0.0  1.24     Ca_d7 -8.1573867E17    NaF7          300  \
                                                  NaP7       0.24     KDR7            0  \
                                                  KA7        12        K27             10  \
                                                  KM7      380.8      CaL7            2  \
                                                  CaH7      80        KCd7            10  \
                                                  AR7        2.0      KAHPd7          4.0

//BASAL DENDRITE COMPARTMENTS ************************************************
// basalLsupera Fig 1. Traub et al., J Neurophysiol 2003;89:909-921
basalLsupera  soma  -26.8  -46.3  -27.2  1.7    Ca_d7 -5.40919039E17   NaF7     1500  \
                                                NaP7        1.2     KDR7        1500  \
                                                KA7        160       K27          10  \
                                                KM7       380.8     CaL7          2  \
                                                CaH7       80       KCd7        320  \
                                                AR7       2.0     KAHPd7        4.0

// basalLsuperb Fig 1. Traub et al., J Neurophysiol 2003;89:909-921
basalLsuperb  basalLsupera  -26.8  -46.3 -27.2  1.7     Ca_d7 -5.40918077E17    NaF7      300  \
                                                        NaP7        0.24    KDR7          0  \
                                                        KA7         12      K27          10  \
                                                        KM7       380.8     CaL7          2  \
                                                        CaH7       80       KCd7         10  \
                                                        AR7        2.0     KAHPd7        4.0

// basalLsuperc Fig 1. Traub et al., J Neurophysiol 2003;89:909-921
basalLsuperc  basalLsuperb  -26.8  -46.3 -27.2  1.7     Ca_d7 -5.40917321E17   NaF7     300  \
                                                        NaP7       0.24     KDR7          0  \
                                                        KA7         12       K27          10  \
                                                        KM7       380.8     CaL7          2  \
                                                        CaH7       80       KCd7          10  \
                                                        AR7        2.0     KAHPd7        4.0

// basalLmida Fig 1. Traub et al., J Neurophysiol 2003;89:909-921
basalLmida  soma  -19.3  33.4  -46.0  1.7      Ca_db7 -5.4091897E17    NaF7     1500  \
                                               NaP7       1.2     KDR7        1500  \
                                               KA7        160       K27         10  \
                                               KM7       380.8     CaL7          2  \
                                               CaH7       80       KCdb7        320  \
                                               AR7        2.0     KAHPdb7        4.0

// basalLmidb Fig 1. Traub et al., J Neurophysiol 2003;89:909-921
basalLmidb  basalLmida  -19.3  33.4 -46.0  1.7         Ca_d7 -5.40919417E17    NaF7    300  \
                                                       NaP7        0.24    KDR7          0  \
                                                       KA7         12       K27         10  \
                                                       KM7       380.8     CaL7          2  \
                                                       CaH7       80       KCd7          10  \
                                                       AR7        2.0     KAHPd7        4.0

// basalLmidc Fig 1. Traub et al., J Neurophysiol 2003;89:909-921
basalLmidc  basalLmidb  -19.3  33.4 -46.0  1.7         Ca_d7 -5.40919967E17    NaF7    300  \
                                                       NaP7        0.24    KDR7          0  \
                                                       KA7        12       K27           10  \
                                                       KM7       380.8     CaL7          2  \
                                                       CaH7       80       KCd7          10  \
                                                       AR7        2.0     KAHPd7        4.0

// basalRsupera Fig 1. Traub et al., J Neurophysiol 2003;89:909-921
basalRsupera  soma  26.8  46.3  -27.2  1.7     Ca_d7 -5.40919039E17    NaF7    1500  \
                                               NaP7      1.2      KDR7        1500  \
                                               KA7       160       K27           10  \
                                               KM7       380.8     CaL7          2  \
                                               CaH7       80       KCd7        320  \
                                               AR7        2.0     KAHPd7       4.0

// basalRsuperb Fig 1. Traub et al., J Neurophysiol 2003;89:909-921
basalRsuperb  basalRsupera  26.8  46.3 -27.2  1.7      Ca_d7 -5.40919417E17    NaF7    300  \
                                                       NaP7        0.24    KDR7          0  \
                                                       KA7         12       K27          10  \
                                                       KM7       380.8     CaL7          2  \
                                                       CaH7       80       KCd7          10  \
                                                       AR7        2.0     KAHPd7        4.0

// basalRsuperc Fig 1. Traub et al., J Neurophysiol 2003;89:909-921
basalRsuperc  basalRsuperb  26.8  46.3 -27.2  1.7      Ca_d7  -5.40919967E17    NaF7   300  \
                                                       NaP7        0.24    KDR7          0  \
                                                       KA7        12       K27          10  \
                                                       KM7       380.8     CaL7          2  \
                                                       CaH7       80       KCd7          10  \
                                                       AR7        2.0     KAHPd7       4.0

// basalRmida Fig 1. Traub et al., J Neurophysiol 2003;89:909-921
basalRmida  soma  19.3  -33.4  -46.0  1.7       Ca_db7 -5.40918901E17  NaF7      1500  \
                                                NaP7        1.2     KDR7        1500  \
                                                KA7        160       K27         10   \
                                                KM7       380.0     CaL7          2  \
                                                CaH7       80       KCdb7        320  \
                                                AR7        2.0     KAHPdb7        4.0

// basalRmidb Fig 1. Traub et al., J Neurophysiol 2003;89:909-921
basalRmidb  basalRmida  19.3  -33.4 -46.0  1.7          Ca_d7 -5.40919417E17   NaF7     300  \
                                                        NaP7        0.24    KDR7          0  \
                                                        KA7         12       K27           10  \
                                                        KM7       380.8     CaL7          2  \
                                                        CaH7       80       KCd7          10  \
                                                        AR7         2.0     KAHPd7        4.0

// basalRmidc Fig 1. Traub et al., J Neurophysiol 2003;89:909-921
basalRmidc  basalRmidb  19.3  -33.4 -46.0  1.7          Ca_d7 -5.4091952E17    NaF7      300  \
                                                        NaP7        0.24    KDR7          0  \
                                                        KA7         12       K27           10  \
                                                        KM7       380.8     CaL7          2  \
                                                        CaH7       80       KCd7          10  \
                                                        AR7        2.0     KAHPd7        4.0

// basaldeepa Fig 1. Traub et al., J Neurophysiol 2003;89:909-921
basaldeepa  soma  0  0  -60.0  1.7          Ca_db7 -5.40918764E17    NaF7    1500  \
                                            NaP7       1.2      KDR7        1500  \
                                            KA7        160       K27         10    \
                                            KM7       380.8     CaL7          2  \
                                            CaH7       80       KCdb7        320  \
                                            AR7        2.0     KAHPdb7        4.0

// basaldeepb Fig 1. Traub et al., J Neurophysiol 2003;89:909-921
basaldeepb  basaldeepa  0  0 -60.0  1.7             Ca_d7 -5.40919417E17    NaF7    300  \
                                                    NaP7        0.24    KDR7          0  \
                                                    KA7        12       K27          10  \
                                                    KM7       380.8     CaL7          2  \
                                                    CaH7       80       KCd7          10  \
                                                    AR7         2.0     KAHPd7        4.0

// basaldeepc Fig 1. Traub et al., J Neurophysiol 2003;89:909-921
basaldeepc  basaldeepb  0  0 -60.0  1.7             Ca_d7 -5.40919967E17    NaF7    300  \
                                                    NaP7        0.24    KDR7          0  \
                                                    KA7         12       K27         10  \
                                                    KM7       380.8     CaL7          2  \
                                                    CaH7       80       KCd7          10  \
                                                    AR7         2.0     KAHPd7        4.0


//		Specifying constants for axonal compartment RMCM=0.0014 (0.0009)
*set_compt_param	RM	0.10   // (0.10)
*set_compt_param	RA	1.00   // (1.00)
*set_compt_param	CM	0.009  // (0.009)
*set_compt_param     EREST_ACT	-0.07 // -0.075
*set_compt_param     ELEAK	-0.066 // -0.075

//AXONAL COMPARTMENTS ***************************************
// axona Fig 1. Traub et al., J Neurophysiol 2003;89:909-921
// Differs from Traub et al., in that axon is vertical
axona  soma  0  0 -25  1.8      NaF7       4500   \
                                NaP7          0.0     KDR7       4500   \
                                KA7           6       K27           5   \
                                KM7         300       CaL7          0   \
                                CaH7          0   \
                                AR7           0   

// axonb Fig 1. Traub et al., J Neurophysiol 2003;89:909-921
// Differs from Traub et al., in that axon is vertical
axonb  axona  0  0 -50  1.4     NaF7       4500   \
                                NaP7          0.0     KDR7       4500   \
                                KA7           6       K27           5   \
                                KM7         300       CaL7          0   \
                                CaH7          0   \
                                AR7           0

// axonLa Fig 1. Traub et al., J Neurophysiol 2003;89:909-921
// Differs from Traub et al., in that axon is vertical
axonLa  axonb  -8.7  0 -49.2  1.0    NaF7       4500   \
                                     NaP7          0.0     KDR7       4500   \
                                     KA7           6       K27           5   \
                                     KM7         300       CaL7          0   \
                                     CaH7          0   \
                                     AR7           0   

// axonLb Fig 1. Traub et al., J Neurophysiol 2003;89:909-921
// Differs from Traub et al., in that axon is vertical
axonLb  axonLa  -8.7  0 -49.2  1.0   NaF7       4500   \
                                     NaP7          0.0     KDR7       4500   \
                                     KA7           6       K27           5   \
                                     KM7         300       CaL7          0   \
                                     CaH7          0   \
                                     AR7           0   

// axonRa Fig 1. Traub et al., J Neurophysiol 2003;89:909-921
// Differs from Traub et al., in that axon is vertical
axonRa  axonb   8.7  0 -49.2  1.0    NaF7       4500   \
                                     NaP7          0.0     KDR7       4500   \
                                     KA7           6       K27           5   \
                                     KM7         300       CaL7          0   \
                                     CaH7          0   \
                                     AR7           0  

// axonRb Fig 1. Traub et al., J Neurophysiol 2003;89:909-921
// Differs from Traub et al., in that axon is vertical
axonRb  axonRa   8.7  0 -49.2  1.0   NaF7       4500   \
                                     NaP7          0.0     KDR7       4500   \
                                     KA7           6       K27           5   \
                                     KM7         300       CaL7          0   \
                                     CaH7          0   \
                                     AR7           0     
