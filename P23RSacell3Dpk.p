// cell.p - Cell parameter file used in Tutorial #5

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
*set_compt_param	RM	5.0   //5.0
*set_compt_param	RA	2.50  //2.50
*set_compt_param	CM	0.009 //0.009
*set_compt_param     EREST_ACT	-0.07
*set_compt_param      ELEAK     -0.0666


//SOMA *************************************************************   
// For the soma, use the leakage potential (-0.07 + 0.0106) for Em
// Actually, after Traub et al. J Neurophys 2003;89:909-921, will maintain
// leakage potential at ELEAK   -0.07
soma  none   0  0  15  16     Ca_s1 -6.8967141E15     NaF1       1875   \
                              NaP1          1.2       KDR1       1250   \
                              KA1         300         K21           1   \
                              KM1          75         CaL1          1   \
                              CaH1         10         KCs1        120   \
                              AR1         2.5         KAHPs1        0.4 
*set_compt_param     RA 2.5
*set_compt_param     CM 0.018
*set_compt_param     ELEAK -0.0666
*set_compt_param     RM 2.5


//APICAL DENDRITE COMPARTMENTS ***************************************
// apdend1 Fig 1. Traub et al., J Neurophysiol 2003;89:909-921
apdend1  soma  0  0  50  8      Ca_d1 -8.2760568E15     NaF1       2500   \
                                NaP1        1.6         KDR1       2500   \
                                KA1         600         K21           2   \
                                KM1         150         CaL1          2   \
                                CaH1         20         KCd1        240   \
                                AR1           5         KAHPd1      0.8 

// apdend2 Fig 1. Traub et al., J Neurophysiol 2003;89:909-921
apdend2  apdend1  0  0  50  7.2    Ca_d1 -9.1956195E15      NaF1        1875 \
                                    NaP1        1.2         KDR1        1875 \
                                    KA1          40         K21           2  \
                                    KM1         150         CaL1          2  \
                                    CaH1         20         KCd1        240  \
                                    AR1           5         KAHPd1      0.8


// apdend3 Fig 1. Traub et al., J Neurophysiol 2003;89:909-921
apdend3  apdend2  0  0  50  6.4    Ca_d1 -1.03450719E16    NaF1        250  \
                                    NaP1          0.16      KDR1       125  \
                                    KA1          40         K21          2  \
                                    KM1         150         CaL1         2  \
                                    CaH1         20         KCd1       240  \
                                    AR1           5         KAHPd1     0.8  

// apdend4aR Fig 1. Traub et al., J Neurophysiol 2003;89:909-921
apdend4aR  apdend3 25 0 43.3 4.00   Ca_d1 -1.65522596E16    NaF1       250  \
                                    NaP1       0.16         KDR1       125  \
                                    KA1          40         K21          2  \
                                    KM1         150         CaL1         2  \
                                    CaH1         20         KCd1       240  \
                                    AR1           5         KAHPd1     0.8

// apdend4bR Fig 1. Traub et al., J Neurophysiol 2003;89:909-921
apdend4bR  apdend4aR 25 0 43.3 4.00 Ca_d1 -1.65522886E16    NaF1         250  \
                                    NaP1       0.16         KDR1         125  \
                                    KA1          40         K21            2  \
                                    KM1         150         CaL1           2  \
                                    CaH1         20         KCd1         240  \
                                    AR1           5         KAHPd1       0.8

// apdend5aRRR Fig 1. Traub et al., J Neurophysiol 2003;89:909-921
apdend5aRRR  apdend4bR 6.4 11.2 48.3 1.6 Ca_d1 -4.1380253E16     NaF1         250    \
                                       NaP1          0.16      KDR1          125   \
                                       KA1          40         K21            2    \
                                       KM1         150         CaL1           2    \
                                       CaH1         20         KCd1         240    \
                                       AR1           5         KAHPd1         0.8

// apdend5bRRR Fig 1. Traub et al., J Neurophysiol 2003;89:909-921
apdend5bRRR  apdend5aRRR 6.4 11.2 48.3 1.6 Ca_d1 -4.1380215E16   NaF1         250    \
                                       NaP1        0.16        KDR1          125   \
                                       KA1          40         K21            2    \
                                       KM1         150         CaL1           2    \
                                       CaH1         20         KCd1         240    \
                                       AR1           5         KAHPd1         0.8

// apdend5cRRR Fig 1. Traub et al., J Neurophysiol 2003;89:909-921
apdend5cRRR  apdend5bRRR 6.4 11.2 48.3  1.6 Ca_d1 -4.1379334E16     NaF1         250    \
                                         NaP1          0.16      KDR1          125   \
                                         KA1          40         K21            2    \
                                         KM1         150         CaL1           2    \
                                         CaH1         20         KCd1         240    \
                                         AR1           5         KAHPd1         0.8

// apdend5aRR Fig 1. Traub et al., J Neurophysiol 2003;89:909-921
apdend5aRR  apdend4bR 2.2 -3.8 49.8 1.6   Ca_d1 -4.1380253E16     NaF1         250    \
                                       NaP1          0.16      KDR1          125   \
                                       KA1          40         K21            2    \
                                       KM1         150         CaL1           2    \
                                       CaH1         20         KCd1         240    \
                                       AR1           5         KAHPd1         0.8

// apdend5bRR Fig 1. Traub et al., J Neurophysiol 2003;89:909-921
apdend5bRR  apdend5aRR 2.2 -3.8 49.8 1.6   Ca_d1 -4.1380215E16   NaF1         250    \
                                       NaP1        0.16        KDR1          125   \
                                       KA1          40         K21            2    \
                                       KM1         150         CaL1           2    \
                                       CaH1         20         KCd1         240    \
                                       AR1           5         KAHPd1         0.8

// apdend5cRR Fig 1. Traub et al., J Neurophysiol 2003;89:909-921
apdend5cRR  apdend5bRR 2.2 -3.8 49.8  1.6   Ca_d1 -4.1379334E16     NaF1         250    \
                                         NaP1          0.16      KDR1          125   \
                                         KA1          40         K21            2    \
                                         KM1         150         CaL1           2    \
                                         CaH1         20         KCd1         240    \
                                         AR1           5         KAHPd1         0.8

// apdend5aRLL Fig 1. Traub et al., J Neurophysiol 2003;89:909-921
apdend5aRLL  apdend4bR -11.2 -6.4 48.3 1.6 Ca_d1 -4.1380253E16     NaF1         250    \
                                          NaP1          0.16      KDR1          125   \
                                          KA1          40         K21            2    \
                                          KM1         150         CaL1           2    \
                                          CaH1         20         KCd1         240    \
                                          AR1           5         KAHPd1         0.8

// apdend5bRLL Fig 1. Traub et al., J Neurophysiol 2003;89:909-921
apdend5bRLL  apdend5aRLL -11.2 -6.4 48.3 1.6 Ca_d1 -4.1380215E16   NaF1         250    \
                                             NaP1        0.16        KDR1          125   \
                                             KA1          40         K21            2    \
                                             KM1         150         CaL1           2    \
                                             CaH1         20         KCd1         240    \
                                             AR1           5         KAHPd1         0.8

// apdend5cRLL Fig 1. Traub et al., J Neurophysiol 2003;89:909-921
apdend5cRLL  apdend5bRLL -11.2 -6.4 48.3 1.6 Ca_d1 -4.1379334E16     NaF1         250    \
                                             NaP1          0.16      KDR1          125   \
                                             KA1          40         K21            2    \
                                             KM1         150         CaL1           2    \
                                             CaH1         20         KCd1         240    \
                                              AR1           5         KAHPd1         0.8

// apdend5aRL Fig 1. Traub et al., J Neurophysiol 2003;89:909-921
apdend5aRL  apdend4bR -3.8 2.2 49.8 1.6  Ca_d1 -4.1380253E16     NaF1         250    \
                                       NaP1          0.16      KDR1          125   \
                                       KA1          40         K21            2    \
                                       KM1         150         CaL1           2    \
                                       CaH1         20         KCd1         240    \
                                       AR1           5         KAHPd1         0.8

// apdend5bRL Fig 1. Traub et al., J Neurophysiol 2003;89:909-921
apdend5bRL  apdend5aRL -3.8 2.2 49.8 1.6  Ca_d1 -4.1380215E16   NaF1         250    \
                                       NaP1        0.16        KDR1          125   \
                                       KA1          40         K21            2    \
                                       KM1         150         CaL1           2    \
                                       CaH1         20         KCd1         240    \
                                       AR1           5         KAHPd1         0.8

// apdend5cRL Fig 1. Traub et al., J Neurophysiol 2003;89:909-921
apdend5cRL  apdend5bRL -3.8 2.2 49.8 1.6  Ca_d1 -4.1379334E16     NaF1         250    \
                                         NaP1          0.16      KDR1          125   \
                                         KA1          40         K21            2    \
                                         KM1         150         CaL1           2    \
                                         CaH1         20         KCd1         240    \
                                         AR1           5         KAHPd1         0.8

// apdend4aL Fig 1. Traub et al., J Neurophysiol 2003;89:909-921
apdend4aL  apdend3 -25 0 43.3 4.00     Ca_d1 -1.65523176E16    NaF1        250 \
                                       NaP1          0.16      KDR1        125 \
                                       KA1          40         K21          2  \
                                       KM1         150         CaL1         2  \
                                       CaH1         20         KCd1       240  \
                                       AR1           5         KAHPd1     0.8

// apdend4bL Fig 1. Traub et al., J Neurophysiol 2003;89:909-921
apdend4bL  apdend4aL -25 0 43.3 4.00   Ca_d1 -1.65522886E16    NaF1         250  \
                                       NaP1       0.16         KDR1         125  \
                                       KA1          40         K21            2  \
                                       KM1         150         CaL1           2  \
                                       CaH1         20         KCd1         240  \
                                       AR1           5         KAHPd1       0.8

// apdend5aLLL Fig 1. Traub et al., J Neurophysiol 2003;89:909-921
apdend5aLLL  apdend4bL -6.4 11.2 48.3 1.6 Ca_d1 -4.1380253E16     NaF1         250    \
                                          NaP1          0.16      KDR1          125   \
                                          KA1          40         K21            2    \
                                          KM1         150         CaL1           2    \
                                          CaH1         20         KCd1         240    \
                                          AR1           5         KAHPd1         0.8

// apdend5bLLL Fig 1. Traub et al., J Neurophysiol 2003;89:909-921
apdend5bLLL  apdend5aLLL -6.4 11.2 48.3 1.6 Ca_d1 -4.1380215E16   NaF1         250    \
                                            NaP1        0.16        KDR1          125   \
                                            KA1          40         K21            2    \
                                            KM1         150         CaL1           2    \
                                            CaH1         20         KCd1         240    \
                                            AR1           5         KAHPd1         0.8

// apdend5cLLL Fig 1. Traub et al., J Neurophysiol 2003;89:909-921
apdend5cLLL  apdend5bLLL -6.4 11.2 48.3 1.6 Ca_d1 -4.1379334E16     NaF1         250    \
                                            NaP1          0.16      KDR1          125   \
                                            KA1          40         K21            2    \
                                            KM1         150         CaL1           2    \
                                            CaH1         20         KCd1         240    \
                                            AR1           5         KAHPd1         0.8

// apdend5aLL Fig 1. Traub et al., J Neurophysiol 2003;89:909-921
apdend5aLL  apdend4bL -2.2 -3.8 49.8 1.6  Ca_d1 -4.1380253E16     NaF1         250    \
                                          NaP1          0.16      KDR1          125   \
                                          KA1          40         K21            2    \
                                          KM1         150         CaL1           2    \
                                          CaH1         20         KCd1         240    \
                                          AR1           5         KAHPd1         0.8

// apdend5bLL Fig 1. Traub et al., J Neurophysiol 2003;89:909-921
apdend5bLL  apdend5aLL -2.2 -3.8 49.8 1.6 Ca_d1 -4.1380215E16   NaF1         250    \
                                          NaP1        0.16        KDR1          125   \
                                          KA1          40         K21            2    \
                                          KM1         150         CaL1           2    \
                                          CaH1         20         KCd1         240    \
                                          AR1           5         KAHPd1         0.8

// apdend5cLL Fig 1. Traub et al., J Neurophysiol 2003;89:909-921
apdend5cLL  apdend5bLL -2.2 -3.8 49.8 1.6 Ca_d1 -4.1379334E16     NaF1         250    \
                                          NaP1          0.16      KDR1          125   \
                                          KA1          40         K21            2    \
                                          KM1         150         CaL1           2    \
                                          CaH1         20         KCd1         240    \
                                          AR1           5         KAHPd1         0.8

// apdend5aLRR Fig 1. Traub et al., J Neurophysiol 2003;89:909-921
apdend5aLRR  apdend4bL 11.2 -6.4 48.3 1.6 Ca_d1 -4.1380253E16     NaF1         250    \
                                          NaP1          0.16      KDR1          125   \
                                          KA1          40         K21            2    \
                                          KM1         150         CaL1           2    \
                                          CaH1         20         KCd1         240    \
                                          AR1           5         KAHPd1         0.8

// apdend5bLRR Fig 1. Traub et al., J Neurophysiol 2003;89:909-921
apdend5bLRR  apdend5aLRR 11.2 -6.4 48.3 1.6 Ca_d1 -4.1380215E16   NaF1         250    \
                                            NaP1        0.16        KDR1          125   \
                                            KA1          40         K21            2    \
                                            KM1         150         CaL1           2    \
                                            CaH1         20         KCd1         240    \
                                            AR1           5         KAHPd1         0.8

// apdend5cLRR Fig 1. Traub et al., J Neurophysiol 2003;89:909-921
apdend5cLRR  apdend5bLRR 11.2 -6.4 48.3 1.6 Ca_d1 -4.1379334E16     NaF1         250    \
                                            NaP1          0.16      KDR1          125   \
                                            KA1          40         K21            2    \
                                            KM1         150         CaL1           2    \
                                            CaH1         20         KCd1         240    \
                                            AR1           5         KAHPd1         0.8

// apdend5aLR Fig 1. Traub et al., J Neurophysiol 2003;89:909-921
apdend5aLR  apdend4bL 3.8 2.2 49.8 1.6  Ca_d1 -4.1380253E16     NaF1         250    \
                                        NaP1          0.16      KDR1          125   \
                                        KA1          40         K21            2    \
                                        KM1         150         CaL1           2    \
                                        CaH1         20         KCd1         240    \
                                        AR1           5         KAHPd1         0.8

// apdend5bLR Fig 1. Traub et al., J Neurophysiol 2003;89:909-921
apdend5bLR  apdend5aLR 3.8 2.2 49.8 1.6 Ca_d1 -4.1380215E16   NaF1         250    \
                                        NaP1        0.16        KDR1          125   \
                                        KA1          40         K21            2    \
                                        KM1         150         CaL1           2    \
                                        CaH1         20         KCd1         240    \
                                        AR1           5         KAHPd1         0.8

// apdend5cLR Fig 1. Traub et al., J Neurophysiol 2003;89:909-921
apdend5cLR  apdend5bLR 3.8 2.2 49.8 1.6  Ca_d1 -4.1379334E16     NaF1         250    \
                                         NaP1          0.16      KDR1          125   \
                                         KA1          40         K21            2    \
                                         KM1         150         CaL1           2    \
                                         CaH1         20         KCd1         240    \
                                         AR1           5         KAHPd1         0.8

//APICAL OBLIQUE DENDRITE COMPARTMENTS ***************************************
// apobdistRa Fig 1. Traub et al., J Neurophysiol 2003;89:909-921
apobdistRa  apdend1  35.4  35.4  0  1.0  Ca_d1 -6.6208454E16     NaF1        1875   \
                                         NaP1         1.2        KDR1        1875   \
                                         KA1          40         K21           2    \
                                         KM1         150         CaL1          2    \
                                         CaH1         20         KCd1        240    \
                                         AR1          5         KAHPd1        0.8

// apobdistRb Fig 1. Traub et al., J Neurophysiol 2003;89:909-921
apobdistRb  apobdistRa 35.4  35.4  0  1.0 Ca_d1 -6.6208454E16     NaF1      250   \
                                          NaP1          0.16      KDR1      125   \
                                          KA1          40         K21       2     \
                                          KM1          150        CaL1      2     \
                                          CaH1         20         KCd1     240    \
                                          AR1          5         KAHPd1    0.8

// apobdistRc Fig 1. Traub et al., J Neurophysiol 2003;89:909-921
apobdistRc  apobdistRb  35.4  35.4  0 1.0  Ca_d1 -6.6208454E16  NaF1       250  \
                                           NaP1        0.16     KDR1       125  \
                                           KA1          40      K21         2   \
                                           KM1         150      CaL1        2   \
                                           CaH1         20      KCd1       240  \
                                           AR1          5       KAHPd1     0.8

// apobproxRa Fig 1. Traub et al., J Neurophysiol 2003;89:909-921
apobproxRa  apdend1  35.4  -35.4  0  1.0  Ca_d1 -6.6208454E16     NaF1     1875   \
                                          NaP1         1.2        KDR1     1875   \
                                          KA1          40         K21        2    \
                                          KM1         150         CaL1       2    \
                                          CaH1         20         KCd1     240    \
                                          AR1          5         KAHPd1     0.8

// apobproxRb Fig 1. Traub et al., J Neurophysiol 2003;89:909-921
apobproxRb apobproxRa 35.4 -35.4 0 1.0  Ca_d1  -6.6208454E16   NaF1   250   \
                                        NaP1        0.16       KDR1   125   \
                                        KA1          40        K21      2   \
                                        KM1         150        CaL1     2   \
                                        CaH1         20        KCd1   240   \
                                        AR1          5         KAHPd1 0.8
 
// apobproxRc Fig 1. Traub et al., J Neurophysiol 2003;89:909-921
apobproxRc  apobproxRb  35.4  -35.4  0  1.0   Ca_d1 -6.6208454E16  NaF1     250  \
                                              NaP1        0.16     KDR1     125  \
                                              KA1          40      K21       2   \
                                              KM1         150      CaL1      2   \
                                              CaH1         20      KCd1     240  \
                                              AR1          5       KAHPd1   0.8

// apobdistLa Fig 1. Traub et al., J Neurophysiol 2003;89:909-921
apobdistLa  apdend1  -35.4  35.4  0  1.0  Ca_d1 -6.6208454E16     NaF1     1875   \
                                          NaP1         1.2        KDR1     1875   \
                                          KA1          40         K21        2    \
                                          KM1         150         CaL1       2    \
                                          CaH1         20         KCd1     240    \
                                          AR1          5         KAHPd1     0.8

// apobdistLb Fig 1. Traub et al., J Neurophysiol 2003;89:909-921
apobdistLb  apobdistLa  -35.4  35.4  0  1.0  Ca_d1 -6.6208454E16     NaF1      250    \
                                             NaP1          0.16      KDR1      125   \
                                             KA1          40         K21        2    \
                                             KM1          150        CaL1       2    \
                                             CaH1         20         KCd1      240    \
                                             AR1          5         KAHPd1     0.8

// apobdistLc Fig 1. Traub et al., J Neurophysiol 2003;89:909-921
apobdistLc  apobdistLb  -35.4  35.4  0  1.0  Ca_d1 -6.6208454E16  NaF1       250    \
                                             NaP1        0.16    KDR1        125  \
                                             KA1          40     K21          2    \
                                             KM1         150     CaL1         2    \
                                             CaH1         20     KCd1        240    \
                                             AR1          5      KAHPd1      0.8

// apobproxLa Fig 1. Traub et al., J Neurophysiol 2003;89:909-921
apobproxLa  apdend1  -35.4  -35.4  0  1.0  Ca_d1 -6.6208454E16     NaF1        1875   \
                                           NaP1         1.2        KDR1        1875   \
                                           KA1          40         K21           2    \
                                           KM1         150         CaL1          2    \
                                           CaH1         20         KCd1        240    \
                                           AR1          5         KAHPd1        0.8

// apobproxLb Fig 1. Traub et al., J Neurophysiol 2003;89:909-921
apobproxLb  apobproxLa  -35.4  -35.4  0  1.0   Ca_d1 -6.6208454E16     NaF1     250    \
                                               NaP1          0.16      KDR1     125   \
                                               KA1          40         K21       2    \
                                               KM1          150        CaL1      2    \
                                               CaH1         20         KCd1     240    \
                                               AR1          5         KAHPd1    0.8

// apobproxLc Fig 1. Traub et al., J Neurophysiol 2003;89:909-921
apobproxLc  apobproxLb  -35.4  -35.4  0  1.0  Ca_d1 -6.6208454E16  NaF1    250    \
                                              NaP1        0.16    KDR1     125  \
                                              KA1          40     K21        2    \
                                              KM1         150     CaL1       2    \
                                              CaH1         20     KCd1     240    \
                                              AR1          5      KAHPd1   0.8

//BASAL DENDRITE COMPARTMENTS ************************************************
// basalLdeepa Fig 1. Traub et al., J Neurophysiol 2003;89:909-921
basalLdeepa  soma  -9.4  -16.2  -46.4  1.0  Ca_d1  -6.620845E16     NaF1    1875  \
                                            NaP1         1.2        KDR1    1875  \
                                            KA1          40         K21       2    \
                                            KM1         150         CaL1      2    \
                                            CaH1         20         KCd1    240    \
                                            AR1          5          KAHPd1    0.8

// basalLdeepb Fig 1. Traub et al., J Neurophysiol 2003;89:909-921
basalLdeepb  basalLdeepa -9.4  -16.2 -46.4  1.0  Ca_d1 -6.6208467E16     NaF1       250   \
                                                 NaP1        0.16        KDR1       125  \
                                                 KA1          40         K21         2    \
                                                 KM1         150         CaL1        2    \
                                                 CaH1         20         KCd1      240    \
                                                 AR1          5          KAHPd1      0.8

// basalLdeepc Fig 1. Traub et al., J Neurophysiol 2003;89:909-921
basalLdeepc  basalLdeepb -9.4  -16.2 -46.4 1.0  Ca_d1 -6.6207608E16     NaF1      250   \
                                                NaP1         0.16       KDR1       125  \
                                                KA1          40         K21         2   \
                                                KM1          150        CaL1        2   \
                                                CaH1         20         KCd1      240   \
                                                AR1          5         KAHPd1      0.8

// basalLmiddeepa Fig 1. Traub et al., J Neurophysiol 2003;89:909-921
basalLmiddeepa  soma  -18.3  31.7  -34.1  1.0  Ca_d1  -6.620845E16     NaF1    1875  \
                                               NaP1         1.2        KDR1    1875  \
                                               KA1          40         K21       2    \
                                               KM1         150         CaL1      2    \
                                               CaH1         20         KCd1    240    \
                                               AR1          5          KAHPd1    0.8

// basalLmiddeepb Fig 1. Traub et al., J Neurophysiol 2003;89:909-921
basalLmiddeepb  basalLmiddeepa -18.3  31.7 -34.1  1.0 Ca_d1 -6.6208467E16     NaF1       250   \
                                                      NaP1        0.16        KDR1       125  \
                                                      KA1          40         K21         2    \
                                                      KM1         150         CaL1        2    \
                                                      CaH1         20         KCd1      240    \
                                                      AR1          5          KAHPd1      0.8

// basalLmiddeepc Fig 1. Traub et al., J Neurophysiol 2003;89:909-921
basalLmiddeepc  basalLmiddeepb -18.3  31.7 -34.1 1.0 Ca_d1 -6.6207608E16     NaF1      250   \
                                                     NaP1         0.16       KDR1       125  \
                                                     KA1          40         K21         2   \
                                                     KM1          150        CaL1        2   \
                                                     CaH1         20         KCd1      240   \
                                                     AR1          5         KAHPd1      0.8

// basalLmidsupera Fig 1. Traub et al., J Neurophysiol 2003;89:909-921
basalLmidsupera  soma  -40.2  -23.2  -18.7  1.0  Ca_d1  -6.620845E16     NaF1    1875  \
                                                 NaP1         1.2        KDR1    1875  \
                                                 KA1          40         K21       2    \
                                                 KM1         150         CaL1      2    \
                                                 CaH1         20         KCd1    240    \
                                                 AR1          5          KAHPd1    0.8

// basalLmidsuperb Fig 1. Traub et al., J Neurophysiol 2003;89:909-921
basalLmidsuperb  basalLmidsupera -40.2  -23.2 -18.7  1.0  Ca_d1 -6.6208467E16     NaF1       250   \
                                                          NaP1        0.16        KDR1       125  \
                                                          KA1          40         K21         2    \
                                                          KM1         150         CaL1        2    \
                                                          CaH1         20         KCd1      240    \
                                                          AR1          5          KAHPd1      0.8

// basalLmidsuperc Fig 1. Traub et al., J Neurophysiol 2003;89:909-921
basalLmidsuperc  basalLmidsuperb -40.2  -23.2 -18.7 1.0  Ca_d1 -6.6207608E16     NaF1      250   \
                                                         NaP1         0.16       KDR1       125  \
                                                         KA1          40         K21         2   \
                                                         KM1          150        CaL1        2   \
                                                         CaH1         20         KCd1      240   \
                                                         AR1          5         KAHPd1      0.8

// basalLsupera Fig 1. Traub et al., J Neurophysiol 2003;89:909-921
basalLsupera  soma  -42.6  24.6  -8.7 1.0   Ca_d1  -6.620845E16     NaF1    1875  \
                                            NaP1         1.2        KDR1    1875  \
                                            KA1          40         K21       2    \
                                            KM1         150         CaL1      2    \
                                            CaH1         20         KCd1    240    \
                                            AR1          5          KAHPd1    0.8

// basalLsuperb Fig 1. Traub et al., J Neurophysiol 2003;89:909-921
basalLsuperb  basalLsupera -42.6  24.6 -8.7  1.0  Ca_d1 -6.6208467E16     NaF1       250   \
                                                  NaP1        0.16        KDR1       125  \
                                                  KA1          40         K21         2    \
                                                  KM1         150         CaL1        2    \
                                                  CaH1         20         KCd1      240    \
                                                  AR1          5          KAHPd1      0.8

// basalLsuperc Fig 1. Traub et al., J Neurophysiol 2003;89:909-921
basalLsuperc  basalLsuperb -42.6  24.6 -8.7 1.0   Ca_d1 -6.6207608E16     NaF1      250   \
                                                  NaP1         0.16       KDR1       125  \
                                                  KA1          40         K21         2   \
                                                  KM1          150        CaL1        2   \
                                                  CaH1         20         KCd1      240   \
                                                  AR1          5         KAHPd1      0.8

// basalRdeepa Fig 1. Traub et al., J Neurophysiol 2003;89:909-921
basalRdeepa  soma   9.4  -16.2   -46.4  1.0  Ca_d1  -6.620845E16     NaF1    1875  \
                                             NaP1         1.2        KDR1    1875  \
                                             KA1          40         K21       2    \
                                             KM1         150         CaL1      2    \
                                             CaH1         20         KCd1    240    \
                                             AR1          5          KAHPd1    0.8

// basalRdeepb Fig 1. Traub et al., J Neurophysiol 2003;89:909-921
basalRdeepb  basalRdeepa  9.4  -16.2  -46.4  1.0  Ca_d1 -6.6208467E16     NaF1       250   \
                                                  NaP1        0.16        KDR1       125  \
                                                  KA1          40         K21         2    \
                                                  KM1         150         CaL1        2    \
                                                  CaH1         20         KCd1      240    \
                                                  AR1          5          KAHPd1      0.8

// basalRdeepc Fig 1. Traub et al., J Neurophysiol 2003;89:909-921
basalRdeepc  basalRdeepb  9.4  -16.2  -46.4 1.0  Ca_d1 -6.6207608E16     NaF1      250   \
                                                 NaP1         0.16       KDR1       125  \
                                                 KA1          40         K21         2   \
                                                 KM1          150        CaL1        2   \
                                                 CaH1         20         KCd1      240   \
                                                 AR1          5         KAHPd1      0.8

// basalRmiddeepa Fig 1. Traub et al., J Neurophysiol 2003;89:909-921
basalRmiddeepa  soma   18.3  31.7  -34.1  1.0  Ca_d1  -6.620845E16     NaF1    1875  \
                                               NaP1         1.2        KDR1    1875  \
                                               KA1          40         K21       2    \
                                               KM1         150         CaL1      2    \
                                               CaH1         20         KCd1    240    \
                                               AR1          5          KAHPd1    0.8

// basalRmiddeepb Fig 1. Traub et al., J Neurophysiol 2003;89:909-921
basalRmiddeepb  basalRmiddeepa  18.3  31.7 -34.1  1.0  Ca_d1 -6.6208467E16     NaF1       250   \
                                                       NaP1        0.16        KDR1       125  \
                                                       KA1          40         K21         2    \
                                                       KM1         150         CaL1        2    \
                                                       CaH1         20         KCd1      240    \
                                                       AR1          5          KAHPd1      0.8

// basalRmiddeepc Fig 1. Traub et al., J Neurophysiol 2003;89:909-921
basalRmiddeepc  basalRmiddeepb  18.3  31.7 -34.1 1.0  Ca_d1 -6.6207608E16     NaF1      250   \
                                                      NaP1         0.16       KDR1       125  \
                                                      KA1          40         K21         2   \
                                                      KM1          150        CaL1        2   \
                                                      CaH1         20         KCd1      240   \
                                                      AR1          5         KAHPd1      0.8

// basalRmidsupera Fig 1. Traub et al., J Neurophysiol 2003;89:909-921
basalRmidsupera  soma  40.2  -23.2  -18.7  1.0  Ca_d1  -6.620845E16     NaF1    1875  \
                                              NaP1         1.2        KDR1    1875  \
                                              KA1          40         K21       2    \
                                              KM1         150         CaL1      2    \
                                              CaH1         20         KCd1    240    \
                                              AR1          5          KAHPd1    0.8

// basalRmidsuperb Fig 1. Traub et al., J Neurophysiol 2003;89:909-921
basalRmidsuperb  basalRmidsupera  40.2  -23.2 -18.7  1.0  Ca_d1 -6.6208467E16     NaF1       250   \
                                                          NaP1        0.16        KDR1       125  \
                                                          KA1          40         K21         2    \
                                                          KM1         150         CaL1        2    \
                                                          CaH1         20         KCd1      240    \
                                                          AR1          5          KAHPd1      0.8

// basalRmidsuperc Fig 1. Traub et al., J Neurophysiol 2003;89:909-921
basalRmidsuperc  basalRmidsuperb  40.2  -23.2 -18.7 1.0  Ca_d1 -6.6207608E16     NaF1      250   \
                                                         NaP1         0.16       KDR1       125  \
                                                         KA1          40         K21         2   \
                                                         KM1          150        CaL1        2   \
                                                         CaH1         20         KCd1      240   \
                                                         AR1          5         KAHPd1      0.8

// basalRsupera Fig 1. Traub et al., J Neurophysiol 2003;89:909-921
basalRsupera  soma  42.6  24.6 -8.7 1.0   Ca_d1  -6.620845E16     NaF1    1875  \
                                          NaP1         1.2        KDR1    1875  \
                                          KA1          40         K21       2    \
                                          KM1         150         CaL1      2    \
                                          CaH1         20         KCd1    240    \
                                          AR1          5          KAHPd1    0.8

// basalRsuperb Fig 1. Traub et al., J Neurophysiol 2003;89:909-921
basalRsuperb  basalRsupera  42.6  24.6 -8.7  1.0  Ca_d1 -6.6208467E16     NaF1       250   \
                                                  NaP1        0.16        KDR1       125  \
                                                  KA1          40         K21         2    \
                                                  KM1         150         CaL1        2    \
                                                  CaH1         20         KCd1      240    \
                                                  AR1          5          KAHPd1      0.8

// basalRsuperc Fig 1. Traub et al., J Neurophysiol 2003;89:909-921
basalRsuperc  basalRsuperb  42.6  24.6 -8.7 1.0  Ca_d1 -6.6207608E16     NaF1      250   \
                                                 NaP1         0.16       KDR1       125  \
                                                 KA1          40         K21         2   \
                                                 KM1          150        CaL1        2   \
                                                 CaH1         20         KCd1      240   \
                                                 AR1          5         KAHPd1      0.8

//		Specifying constants for axonal compartment RMCM=0.0024 (0.0009)
*set_compt_param	RM	0.10   //(0.1)
*set_compt_param	RA	1.00   //(1.00)
*set_compt_param	CM	0.009  //(0.009)(0.024)
//*set_compt_param     EREST_ACT	-0.07
//*set_compt_param     ELEAK	        -0.07

//AXONAL COMPARTMENTS ***************************************
// axona Fig 1. Traub et al., J Neurophysiol 2003;89:909-921
// Differs from Traub et al., in that axon is vertical
axona  soma  0  0 -25  1.8      NaF1       4000   \
                                NaP1          0.0       KDR1       4000   \
                                KA1          20         K21           1   \
                                KM1           0         CaL1          0   \
                                CaH1          0   \
                                AR1           0  

// axonb Fig 1. Traub et al., J Neurophysiol 2003;89:909-921
// Differs from Traub et al., in that axon is vertical
axonb  axona  0  0 -50  1.4     NaF1       4000   \
                                NaP1          0.0       KDR1       4000   \
                                KA1          20         K21           1   \
                                KM1           0         CaL1          0   \
                                CaH1          0   \
                                AR1           0  


// axonLa Fig 1. Traub et al., J Neurophysiol 2003;89:909-921
// Differs from Traub et al., in that axon is vertical
axonLa  axonb  -8.7  0 -49.2  1.0     NaF1       4000   \
                                      NaP1          0.0       KDR1       4000   \
                                      KA1          20         K21           1   \
                                      KM1           0         CaL1          0   \
                                      CaH1          0   \
                                      AR1           0  

// axonLb Fig 1. Traub et al., J Neurophysiol 2003;89:909-921
// Differs from Traub et al., in that axon is vertical
axonLb  axonLa  -8.7  0 -49.2  1.0     NaF1       4000   \
                                       NaP1          0.0       KDR1       4000   \
                                       KA1          20         K21           1   \
                                       KM1           0         CaL1          0   \
                                       CaH1          0   \
                                       AR1           0 

// axonRa Fig 1. Traub et al., J Neurophysiol 2003;89:909-921
// Differs from Traub et al., in that axon is vertical
axonRa  axonb   8.7  0 -49.2  1.0    NaF1       4000   \
                                     NaP1          0.0       KDR1       4000   \
                                     KA1          20         K21           1   \
                                     KM1           0         CaL1          0   \
                                     CaH1          0   \
                                     AR1           0 

// axonRb Fig 1. Traub et al., J Neurophysiol 2003;89:909-921
// Differs from Traub et al., in that axon is vertical
axonRb  axonRa   8.7  0 -49.2  1.0   NaF1       4000   \
                                     NaP1          0.0       KDR1       4000   \
                                     KA1          20         K21           1   \
                                     KM1           0         CaL1          0   \
                                     CaH1          0   \
                                     AR1           0    
