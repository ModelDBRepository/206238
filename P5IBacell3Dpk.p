// P5IBa.p - for TraubIB_VP

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
soma  none   0  0  15  18     Ca_s6 -6.1304081E14 NaF6           2000     \
                              NaP6        1.6     KDR6           1700     \
                              KA6         200     K26               5     \
                              KM6         119     CaL6              1     \
                              CaH6         40     KCs6            160     \
                              AR6         1.0     KAHPs6            2.0
   *set_compt_param     CM      0.018
   *set_compt_param     RM      2.5

//APICAL DENDRITE COMPARTMENTS ***************************************
// apdend1 Fig 1. Traub et al., J Neurophysiol 2003;89:909-921
apdend1  soma  0  0  75  4      Ca_d6 -1.47129963E17   NaF6        3000   \
                                NaP6         2.4       KDR6        2400   \
                                KA6          160        K26          10   \
                                KM6          380       CaL6           2   \
                                CaH6         80        KCd6         320   \
                                AR6          2.0      KAHPd6         4   
                               
// apdend2 Fig 1. Traub et al., J Neurophysiol 2003;89:909-921
apdend2  apdend1  0  0  75  3.8   Ca_d6 -1.54873652E17    NaF6       1500  \
                                    NaP6          1.2     KDR6       1500  \
                                    KA6          80       K26         10   \
                                    KM6         380.8     CaL6         2  \
                                    CaH6         80       KCd6       320  \
                                    AR6           2.0     KAHPd6       4.0


// apdend3 Fig 1. Traub et al., J Neurophysiol 2003;89:909-921
apdend3  apdend2  0  0  75  3.6     Ca_d6 -1.63477742E17    NaF6         300  \
                                    NaP6          0.24      KDR6           0  \
                                    KA6           12         K26          10  \
                                    KM6         380.8       CaL6           2  \
                                    CaH6         80         KCd6           10 \
                                    AR6           2.0       KAHPd6         4.0


// apdend4 Fig 1. Traub et al., J Neurophysiol 2003;89:909-921
apdend4  apdend3  0  0  75  2.4   Ca_d6  -1.94730587E17  NaF6            300  \
                                    NaP6          0.24     KDR6            0  \
                                    KA6           12        K26             10  \
                                    KM6         380.8      CaL6            2  \
                                    CaH6         80        KCd6            10  \
                                    AR6          2.0      KAHPd6          4.0

// apdend5 Fig 1. Traub et al., J Neurophysiol 2003;89:909-921
apdend5  apdend4  0  0  75  3.2   Ca_d6  -2.06900497E17     NaF6         300  \
                                    NaP6          0.24      KDR6           0  \
                                    KA6           12         K26          10  \
                                    KM6         380.8       CaL6           2  \
                                    CaH6         40         KCd6           10  \
                                    AR6          2.0       KAHPd6         4.0


// apdend6 Fig 1. Traub et al., J Neurophysiol 2003;89:909-921
apdend6  apdend5  0  0  75  3   Ca_d6 -2.20693871E17    NaF6         300  \
                                    NaP6          0.24      KDR6           0  \
                                    KA6           12         K26           10  \
                                    KM6         380.8       CaL6           2  \
                                    CaH6          40         KCd6          10  \
                                    AR6           2.0       KAHPd6         4.0

// apdend7 Fig 1. Traub et al., J Neurophysiol 2003;89:909-921
apdend7  apdend6  0  0  75  2.8   Ca_d6 -2.36457724E17     NaF6         300  \
                                    NaP6          0.24     KDR6           0  \
                                    KA6           12        K26          10  \
                                    KM6         380.8      CaL6           2  \
                                    CaH6         40        KCd6           10  \
                                    AR6           2.0      KAHPd6         4.0

// apdend8 Fig 1. Traub et al., J Neurophysiol 2003;89:909-921
apdend8  apdend7  0  0  75  2.6   Ca_d6 -2.82942241E17   NaF6         300  \
                                    NaP6         0.24   KDR6           0  \
                                    KA6          12      K26           10  \
                                    KM6        380.8    CaL6           2  \
                                    CaH6        40      KCd6           10  \
                                    AR6          2.0    KAHPd6         4.0

// apdend9 Fig 1. Traub et al., J Neurophysiol 2003;89:909-921
apdend9  apdend8  0  0  75  2.4   Ca_d6 -3.06520752E17     NaF6         300   \
                                    NaP6       0.24     KDR6           0   \
                                    KA6        12        K26           10   \
                                    KM6      380.8      CaL6           2   \
                                    CaH6      40        KCd6           10   \
                                    AR6        2.0      KAHPd6         4.0

// apdend10 Fig 1. Traub et al., J Neurophysiol 2003;89:909-921
apdend10  apdend9  0  0  75  2   Ca_d6 -4.04611345E17 NaF6           300  \
                                    NaP6       0.24     KDR6           0  \
                                    KA6        12        K26           10  \
                                    KM6      380.8      CaL6           2  \
                                    CaH6      40        KCd6           10  \
                                    AR6        2.0      KAHPd6         4.0

// apdend11 Fig 1. Traub et al., J Neurophysiol 2003;89:909-921
apdend11  apdend10  0  0  75  1.6    Ca_d6 -5.51737374E17    NaF6        60  \
                                       NaP6       0.048    KDR6          0  \
                                       KA6        12        K26          10  \
                                       KM6       112        CaL6          2  \
                                       CaH6      20        KCd6          24  \
                                       AR6        2.0      KAHPd6        4.0

// apdend12 Fig 1. Traub et al., J Neurophysiol 2003;89:909-921
apdend12  apdend11  0  0  75  1.4    Ca_d6 -6.8309675E17     NaF6         60  \
                                       NaP6         0.048    KDR6          0  \
                                       KA6           12      K26          10  \
                                       KM6          112      CaL6          2  \
                                       CaH6         20       KCd6         24  \
                                       AR6          2.0      KAHPd6        4.0

// apdend13 Fig 1. Traub et al., J Neurophysiol 2003;89:909-921
apdend13  apdend12  0  0  75  1.2    Ca_d6 -8.5827204E17    NaF6          60   \
                                       NaP6         0.048   KDR6          0   \
                                       KA6           12     K26           10   \
                                       KM6          112     CaL6          2   \
                                       CaH6         20     KCd6           24   \
                                       AR6           2.0   KAHPd6         4.0

// apdend14aR Fig 1. Traub et al., J Neurophysiol 2003;89:909-921
apdend14aR  apdend13 11.2 -19.5 55.6 1.1    Ca_d6 -1.00311682E18     NaF6    60  \
                                             NaP6      0.048    KDR6          0  \
                                             KA6       12        K26          10  \
                                             KM6       112        CaL6        2  \
                                             CaH6      54        KCd6         24  \
                                             AR6        4.0      KAHPd6       4.0


// apdend14bR Fig 1. Traub et al., J Neurophysiol 2003;89:909-921
apdend14bR  apdend14aR 11.2 -19.5 55.6 1.1  Ca_d6 -1.00321358E18  NaF6        60  \
                                             NaP6       0.048    KDR6          0  \
                                             KA6        12        K26         10  \
                                             KM6       112        CaL6         2  \
                                             CaH6      12        KCd6         24  \
                                             AR6       4.0      KAHPd6        4.0

// apdend14cR Fig 1. Traub et al., J Neurophysiol 2003;89:909-921
apdend14cR  apdend14bR 11.2 -19.5 55.6 1.1    Ca_d6 -1.00321358E18    NaF6     60  \
                                              NaP6      0.048    KDR6          0  \
                                              KA6       12        K26          10  \
                                              KM6       112        CaL6        2  \
                                              CaH6       12       KCd6         24  \
                                              AR6        4.0      KAHPd6       4.0

// apdend14dR Fig 1. Traub et al., J Neurophysiol 2003;89:909-921
apdend14dR  apdend14cR 11.2 -19.5 55.6 1.1 Ca_d6 -1.00307944E18 NaF6         60  \
                                           NaP6       0.048     KDR6          0  \
                                           KA6       12         K26           10  \
                                           KM6       112         CaL6         2  \
                                           CaH6      12         KCd6         24  \
                                           AR6       4.0       KAHPd6        4.0

// apdend14aL Fig 1. Traub et al., J Neurophysiol 2003;89:909-921
apdend14aL  apdend13 -11.2 19.5 55.6  1.1    Ca_d6 -1.0030927E18  NaF6         60  \
                                              NaP6      0.048    KDR6          0  \
                                              KA6       12        K26          10   \
                                              KM6       112       CaL6          2  \
                                              CaH6      54        KCd6         24  \
                                              AR6       4.0      KAHPd6        4.0


// apdend14bL Fig 1. Traub et al., J Neurophysiol 2003;89:909-921
apdend14bL  apdend14aL -11.2 19.5 55.6 1.1  Ca_d6 -1.00322458E18  NaF6        60  \
                                             NaP6      0.048    KDR6          0  \
                                             KA6       12        K26          10  \
                                             KM6       112       CaL6          2  \
                                             CaH6      12        KCd6         24  \
                                             AR6       4.0      KAHPd6        4.0

// apdend14cL Fig 1. Traub et al., J Neurophysiol 2003;89:909-921
apdend14cL  apdend14bL -11.2 19.5 55.6 1.1    Ca_d6 -1.00322368E18  NaF6       60  \
                                              NaP6      0.048    KDR6          0  \
                                              KA6       12        K26          10  \
                                              KM6       112       CaL6          2  \
                                              CaH6       12        KCd6         24  \
                                              AR6        4.0      KAHPd6        4.0

// apdend14dL Fig 1. Traub et al., J Neurophysiol 2003;89:909-921
apdend14dL  apdend14cL -11.2 19.5 55.6 1.1 Ca_d6 -1.0030782E18    NaF6        60  \
                                           NaP6       0.048     KDR6          0  \
                                           KA6        12         K26          10  \
                                           KM6       112         CaL6         2  \
                                           CaH6       12         KCd6         24  \
                                           AR6        4.0       KAHPd6        4.0

//APICAL OBLIQUE DENDRITE COMPARTMENTS ***************************************

// apobdistRa Fig 1. Traub et al., J Neurophysiol 2003;89:909-921
apobdistRa  apdend3  42.4  42.4 0.0 1.24      Ca_d6 -8.1574073E17 NaF6         1500  \
                                             NaP6        1.2     KDR6          1500  \
                                             KA6        160       K26            10  \
                                             KM6       380.8     CaL6             2  \
                                             CaH6       80       KCd6           320  \
                                             AR6         2.0     KAHPd6          4.0

// apobdistRb Fig 1. Traub et al., J Neurophysiol 2003;89:909-921
apobdistRb  apobdistRa  42.4  42.4 0.0 1.24    Ca_d6 -8.1574094E17    NaF6       300  \
                                              NaP6       0.24     KDR6            0  \
                                              KA6        12        K26            10   \
                                              KM6      380.8      CaL6            2  \
                                              CaH6      80        KCd6            10  \
                                              AR6       2.0      KAHPd6          4.0

// apobdistRc Fig 1. Traub et al., J Neurophysiol 2003;89:909-921
apobdistRc  apobdistRb  42.4  42.4 0.0 1.24    Ca_d6 -8.1574321E17    NaF6         300  \
                                              NaP6       0.24     KDR6            0  \
                                              KA6        12        K26            10  \
                                              KM6      380.8      CaL6            2  \
                                              CaH6      80        KCd6            10  \
                                              AR6        2.0      KAHPd6          4.0

// apobdistLa Fig 1. Traub et al., J Neurophysiol 2003;89:909-921
apobdistLa  apdend3  -42.4  -42.4 0.0 1.24     Ca_d6 -8.1574073E17 NaF6        1500  \
                                               NaP6       1.2     KDR6         1500  \
                                               KA6        160       K26           10  \
                                               KM6       380.8     CaL6           2  \
                                               CaH6       80       KCd6          320  \
                                               AR6        2.0     KAHPd6         4.0

// apobdistLb Fig 1. Traub et al., J Neurophysiol 2003;89:909-921
apobdistLb  apobdistLa  -42.4  -42.4 0.0 1.24   Ca_d6 -8.1574094E17    NaF6         300  \
                                                NaP6       0.24     KDR6            0  \
                                                KA6        12        K26            10  \
                                                KM6      380.8      CaL6            2  \
                                                CaH6      80        KCd6            10  \
                                                AR6       2.0      KAHPd6          4.0

// apobdistLc Fig 1. Traub et al., J Neurophysiol 2003;89:909-921
apobdistLc  apobdistLb  -42.4 -42.4 0.0 1.24    Ca_d6 -8.1574321E17 NaF6          300  \
                                                NaP6       0.24     KDR6            0  \
                                                KA6        12        K26            10  \
                                                KM6      380.8      CaL6            2  \
                                                CaH6      80        KCd6            10  \
                                                AR6        2.0      KAHPd6         4.0

// apobmidRa Fig 1. Traub et al., J Neurophysiol 2003;89:909-921
apobmidRa  apdend2  42.4  -42.4 0.0  1.24      Ca_d6 -8.1574073E17    NaF6      1500  \
                                              NaP6        1.2     KDR6          1500  \
                                              KA6        160       K26            10  \
                                              KM6       380.8     CaL6            2  \
                                              CaH6       80       KCd6          320  \
                                              AR6         2.0     KAHPd6          4.0

// apobmidRb Fig 1. Traub et al., J Neurophysiol 2003;89:909-921
apobmidRb  apobmidRa  42.4  -42.4 0.0  1.24    Ca_d6 -8.1574094E17    NaF6        300  \
                                               NaP6       0.24     KDR6            0  \
                                               KA6        12        K26            10  \
                                               KM6      380.8      CaL6            2  \
                                               CaH6      80        KCd6            10  \
                                               AR6        2.0      KAHPd6          4.0

// apobmidRc Fig 1. Traub et al., J Neurophysiol 2003;89:909-921
apobmidRc  apobmidRb  42.4  -42.4 0.0  1.24    Ca_d6 -8.1574321E17    NaF6        300  \
                                               NaP6       0.24     KDR6            0  \
                                               KA6        12        K26            10   \
                                               KM6      380.8      CaL6            2  \
                                               CaH6      80        KCd6            10  \
                                               AR6        2.0      KAHPd6          4.0

// apobmidLa Fig 1. Traub et al., J Neurophysiol 2003;89:909-921
apobmidLa  apdend2  -42.4  42.4 0.0  1.24      Ca_d6 -8.1574073E17 NaF6          1500  \
                                              NaP6       1.2      KDR6          1500  \
                                              KA6        160       K26            10  \
                                              KM6       380.8     CaL6             2  \
                                              CaH6       80       KCd6           320  \
                                              AR6        2.0     KAHPd6          4.0

// apobmidLb Fig 1. Traub et al., J Neurophysiol 2003;89:909-921
apobmidLb  apobmidLa  -42.4  42.4 0.0  1.24     Ca_d6 -8.1574094E17   NaF6          300  \
                                               NaP6       0.24     KDR6            0  \
                                               KA6        12        K26            10   \
                                               KM6      380.8      CaL6            2  \
                                               CaH6      80        KCd6            10  \
                                               AR6        2.0      KAHPd6          4.0

// apobmidLc Fig 1. Traub et al., J Neurophysiol 2003;89:909-921
apobmidLc  apobmidLb  -42.4  42.4 0.0  1.24     Ca_d6 -8.1574321E17   NaF6         300  \
                                               NaP6       0.24     KDR6            0  \
                                               KA6        12        K26            10  \
                                               KM6      380.8      CaL6            2  \
                                               CaH6      80        KCd6            10  \
                                               AR6        2.0      KAHPd6          4.0

// apobproxRa Fig 1. Traub et al., J Neurophysiol 2003;89:909-921
apobproxRa  apdend1  42.4  42.4 0.0  1.24     Ca_d6 -8.1574073E17 NaF6         1500  \
                                              NaP6        1.2     KDR6         1500  \
                                              KA6        160       K26            10   \
                                              KM6       380.8     CaL6            2  \
                                              CaH6       80       KCd6          320  \
                                              AR6        2.0     KAHPd6          4.0

// apobproxRb Fig 1. Traub et al., J Neurophysiol 2003;89:909-921
apobproxRb  apobproxRa  42.4  42.4 0.0  1.24     Ca_d6 -8.1574094E17 NaF6          300  \
                                                NaP6       0.24     KDR6            0  \
                                                KA6        12        K26             10  \
                                                KM6      380.8      CaL6            2  \
                                                CaH6      80        KCd6            10  \
                                                AR6        2.0      KAHPd6          4.0

// apobproxRc Fig 1. Traub et al., J Neurophysiol 2003;89:909-921
apobproxRc  apobproxRb  42.4  42.4 0.0  1.24     Ca_d6 -8.1573867E17 NaF6          300  \
                                                NaP6       0.24     KDR6            0  \
                                                KA6        12        K26             10  \
                                                KM6      380.8     CaL6            2  \
                                                CaH6      80        KCd6            10  \
                                                AR6        2.0      KAHPd6          4.0

// apobproxLa Fig 1. Traub et al., J Neurophysiol 2003;89:909-921
apobproxLa  apdend1  -42.4  -42.4 0.0  1.24      Ca_d6 -8.1574073E17    NaF6      1500  \
                                                NaP6        1.2     KDR6          1500  \
                                                KA6        160       K26             10  \
                                                KM6       380.8     CaL6            2  \
                                                CaH6       80       KCd6          320  \
                                                AR6        2.0     KAHPd6          4.0

// apobproxLb Fig 1. Traub et al., J Neurophysiol 2003;89:909-921
apobproxLb  apobproxLa  -42.4  -42.4 0.0  1.24     Ca_d6 -8.1574094E17 NaF6          300  \
                                                  NaP6       0.24     KDR6            0  \
                                                  KA6        12        K26            10  \
                                                  KM6      380.8      CaL6            2  \
                                                  CaH6      80        KCd6            10  \
                                                  AR6        2.0      KAHPd6          4.0

// apobproxLc Fig 1. Traub et al., J Neurophysiol 2003;89:909-921
apobproxLc  apobproxLb  -42.4  -42.4 0.0  1.24     Ca_d6 -8.1573867E17    NaF6          300  \
                                                  NaP6       0.24     KDR6            0  \
                                                  KA6        12        K26             10  \
                                                  KM6      380.8      CaL6            2  \
                                                  CaH6      80        KCd6            10  \
                                                  AR6        2.0      KAHPd6          4.0

//BASAL DENDRITE COMPARTMENTS ************************************************
// basalLsupera Fig 1. Traub et al., J Neurophysiol 2003;89:909-921
basalLsupera  soma  -26.8  -46.3  -27.2  1.7    Ca_d6 -5.40919039E17   NaF6     1500  \
                                                NaP6        1.2     KDR6        1500  \
                                                KA6        160       K26          10  \
                                                KM6       380.8     CaL6          2  \
                                                CaH6       80       KCd6        320  \
                                                AR6       2.0     KAHPd6        4.0

// basalLsuperb Fig 1. Traub et al., J Neurophysiol 2003;89:909-921
basalLsuperb  basalLsupera  -26.8  -46.3 -27.2  1.7     Ca_d6 -5.40918077E17    NaF6      300  \
                                                        NaP6        0.24    KDR6          0  \
                                                        KA6         12      K26          10  \
                                                        KM6       380.8     CaL6          2  \
                                                        CaH6       80       KCd6         10  \
                                                        AR6        2.0     KAHPd6        4.0

// basalLsuperc Fig 1. Traub et al., J Neurophysiol 2003;89:909-921
basalLsuperc  basalLsuperb  -26.8  -46.3 -27.2  1.7     Ca_d6 -5.40917321E17   NaF6     300  \
                                                        NaP6       0.24     KDR6          0  \
                                                        KA6         12       K26          10  \
                                                        KM6       380.8     CaL6          2  \
                                                        CaH6       80       KCd6          10  \
                                                        AR6        2.0     KAHPd6        4.0

// basalLmida Fig 1. Traub et al., J Neurophysiol 2003;89:909-921
basalLmida  soma  -19.3  33.4  -46.0  1.7      Ca_db6 -5.4091897E17    NaF6     1500  \
                                               NaP6       1.2     KDR6        1500  \
                                               KA6        160       K26         10  \
                                               KM6       380.8     CaL6          2  \
                                               CaH6       80       KCdb6        320  \
                                               AR6        2.0     KAHPdb6        4.0

// basalLmidb Fig 1. Traub et al., J Neurophysiol 2003;89:909-921
basalLmidb  basalLmida  -19.3  33.4 -46.0  1.7         Ca_d6 -5.40919417E17    NaF6    300  \
                                                       NaP6        0.24    KDR6          0  \
                                                       KA6         12       K26         10  \
                                                       KM6       380.8     CaL6          2  \
                                                       CaH6       80       KCd6          10  \
                                                       AR6        2.0     KAHPd6        4.0

// basalLmidc Fig 1. Traub et al., J Neurophysiol 2003;89:909-921
basalLmidc  basalLmidb  -19.3  33.4 -46.0  1.7         Ca_d6 -5.40919967E17    NaF6    300  \
                                                       NaP6        0.24    KDR6          0  \
                                                       KA6        12       K26           10  \
                                                       KM6       380.8     CaL6          2  \
                                                       CaH6       80       KCd6          10  \
                                                       AR6        2.0     KAHPd6        4.0

// basalRsupera Fig 1. Traub et al., J Neurophysiol 2003;89:909-921
basalRsupera  soma  26.8  46.3  -27.2  1.7     Ca_d6 -5.40919039E17    NaF6    1500  \
                                               NaP6      1.2      KDR6        1500  \
                                               KA6       160       K26           10  \
                                               KM6       380.8     CaL6          2  \
                                               CaH6       80       KCd6        320  \
                                               AR6        2.0     KAHPd6       4.0

// basalRsuperb Fig 1. Traub et al., J Neurophysiol 2003;89:909-921
basalRsuperb  basalRsupera  26.8  46.3 -27.2  1.7      Ca_d6 -5.40919417E17    NaF6    300  \
                                                       NaP6        0.24    KDR6          0  \
                                                       KA6         12       K26          10  \
                                                       KM6       380.8     CaL6          2  \
                                                       CaH6       80       KCd6          10  \
                                                       AR6        2.0     KAHPd6        4.0

// basalRsuperc Fig 1. Traub et al., J Neurophysiol 2003;89:909-921
basalRsuperc  basalRsuperb  26.8  46.3 -27.2  1.7      Ca_d6  -5.40919967E17    NaF6   300  \
                                                       NaP6        0.24    KDR6          0  \
                                                       KA6        12       K26          10  \
                                                       KM6       380.8     CaL6          2  \
                                                       CaH6       80       KCd6          10  \
                                                       AR6        2.0     KAHPd6       4.0

// basalRmida Fig 1. Traub et al., J Neurophysiol 2003;89:909-921
basalRmida  soma  19.3  -33.4  -46.0  1.7       Ca_db6 -5.40918901E17  NaF6      1500  \
                                                NaP6        1.2     KDR6        1500  \
                                                KA6        160       K26         10   \
                                                KM6       380.0     CaL6          2  \
                                                CaH6       80       KCdb6        320  \
                                                AR6        2.0     KAHPdb6        4.0

// basalRmidb Fig 1. Traub et al., J Neurophysiol 2003;89:909-921
basalRmidb  basalRmida  19.3  -33.4 -46.0  1.7          Ca_d6 -5.40919417E17   NaF6     300  \
                                                        NaP6        0.24    KDR6          0  \
                                                        KA6         12       K26           10  \
                                                        KM6       380.8     CaL6          2  \
                                                        CaH6       80       KCd6          10  \
                                                        AR6         2.0     KAHPd6        4.0

// basalRmidc Fig 1. Traub et al., J Neurophysiol 2003;89:909-921
basalRmidc  basalRmidb  19.3  -33.4 -46.0  1.7          Ca_d6 -5.4091952E17    NaF6      300  \
                                                        NaP6        0.24    KDR6          0  \
                                                        KA6         12       K26           10  \
                                                        KM6       380.8     CaL6          2  \
                                                        CaH6       80       KCd6          10  \
                                                        AR6        2.0     KAHPd6        4.0

// basaldeepa Fig 1. Traub et al., J Neurophysiol 2003;89:909-921
basaldeepa  soma  0  0  -60.0  1.7          Ca_db6 -5.40918764E17    NaF6    1500  \
                                            NaP6       1.2      KDR6        1500  \
                                            KA6        160       K26         10    \
                                            KM6       380.8     CaL6          2  \
                                            CaH6       80       KCdb6        320  \
                                            AR6        2.0     KAHPdb6        4.0

// basaldeepb Fig 1. Traub et al., J Neurophysiol 2003;89:909-921
basaldeepb  basaldeepa  0  0 -60.0  1.7             Ca_d6 -5.40919417E17    NaF6    300  \
                                                    NaP6        0.24    KDR6          0  \
                                                    KA6        12       K26          10  \
                                                    KM6       380.8     CaL6          2  \
                                                    CaH6       80       KCd6          10  \
                                                    AR6         2.0     KAHPd6        4.0

// basaldeepc Fig 1. Traub et al., J Neurophysiol 2003;89:909-921
basaldeepc  basaldeepb  0  0 -60.0  1.7             Ca_d6 -5.40919967E17    NaF6    300  \
                                                    NaP6        0.24    KDR6          0  \
                                                    KA6         12       K26         10  \
                                                    KM6       380.8     CaL6          2  \
                                                    CaH6       80       KCd6          10  \
                                                    AR6         2.0     KAHPd6        4.0


//		Specifying constants for axonal compartment RMCM=0.0014 (0.0009)
*set_compt_param	RM	0.10   // (0.10)
*set_compt_param	RA	1.00   // (1.00)
*set_compt_param	CM	0.009  // (0.009)
*set_compt_param     EREST_ACT	-0.07 // -0.075
*set_compt_param     ELEAK	-0.066 // -0.075

//AXONAL COMPARTMENTS ***************************************
// axona Fig 1. Traub et al., J Neurophysiol 2003;89:909-921
// Differs from Traub et al., in that axon is vertical
axona  soma  0  0 -25  1.8      NaF6       4500   \
                                NaP6          0.0     KDR6       4500   \
                                KA6           6       K26           5   \
                                KM6         300       CaL6          0   \
                                CaH6          0   \
                                AR6           0   

// axonb Fig 1. Traub et al., J Neurophysiol 2003;89:909-921
// Differs from Traub et al., in that axon is vertical
axonb  axona  0  0 -50  1.4     NaF6       4500   \
                                NaP6          0.0     KDR6       4500   \
                                KA6           6       K26           5   \
                                KM6         300       CaL6          0   \
                                CaH6          0   \
                                AR6           0

// axonLa Fig 1. Traub et al., J Neurophysiol 2003;89:909-921
// Differs from Traub et al., in that axon is vertical
axonLa  axonb  -8.7  0 -49.2  1.0    NaF6       4500   \
                                     NaP6          0.0     KDR6       4500   \
                                     KA6           6       K26           5   \
                                     KM6         300       CaL6          0   \
                                     CaH6          0   \
                                     AR6           0   

// axonLb Fig 1. Traub et al., J Neurophysiol 2003;89:909-921
// Differs from Traub et al., in that axon is vertical
axonLb  axonLa  -8.7  0 -49.2  1.0   NaF6       4500   \
                                     NaP6          0.0     KDR6       4500   \
                                     KA6           6       K26           5   \
                                     KM6         300       CaL6          0   \
                                     CaH6          0   \
                                     AR6           0   

// axonRa Fig 1. Traub et al., J Neurophysiol 2003;89:909-921
// Differs from Traub et al., in that axon is vertical
axonRa  axonb   8.7  0 -49.2  1.0    NaF6       4500   \
                                     NaP6          0.0     KDR6       4500   \
                                     KA6           6       K26           5   \
                                     KM6         300       CaL6          0   \
                                     CaH6          0   \
                                     AR6           0  

// axonRb Fig 1. Traub et al., J Neurophysiol 2003;89:909-921
// Differs from Traub et al., in that axon is vertical
axonRb  axonRa   8.7  0 -49.2  1.0   NaF6       4500   \
                                     NaP6          0.0     KDR6       4500   \
                                     KA6           6       K26           5   \
                                     KM6         300       CaL6          0   \
                                     CaH6          0   \
                                     AR6           0     
