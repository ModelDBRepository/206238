// P6RSacell3D.p

//      Format of file :
// x,y,z,dia are in microns, all other units are SI (Meter Kilogram Sec Amp)
// In polar mode 'r' is in microns, theta and phi in degrees
// Control line options start with a '*'
// The format for each compartment parameter line is :
//name  parent  r       theta   phi     d       ch      dens ...
//in polar mode, and in cartesian mode :
//name  parent  x       y       z       d       ch      dens ...
// For channels, "dens" =  maximum conductance per unit area of compartment
// For spike elements, "dens" is the spike threshold
//              Coordinate mode
*absolute
*relative
*cartesian
*asymmetric

*set_global              RM     0.3333333
*set_global              EREST_ACT      -0.07
*set_compt_param     ELEAK      -0.0594


//              Specifying constants
*set_compt_param        RM      5.0  //0.33333
*set_compt_param        RA      2.50  //0.3
*set_compt_param        CM      0.009 //0.01
*set_compt_param        ELEAK   -0.0666 // -0.068


//SOMA *************************************************************
// For the soma, use the leakage potential (-0.07 + 0.0106) for Em
//*set_compt_param     ELEAK    -0.0594
// Actually, after Traub et al. J Neurophys 2003;89:909-921, will maintain
soma  none   0  0  15  16     Ca_s14 -2.58626798e15    NaF14       2000   \
                              NaP14        0.8         KDR14       1700   \
                              KA14        1190         K214           1.0 \
                              KM14        42           CaL14          1.0 \
                              CaH14        2.0         KCs14        150   \
                              AR14         2.5         KAHPs14        2.0  
*set_compt_param     RA 2.5
*set_compt_param     CM 0.018
*set_compt_param     ELEAK -0.0666
*set_compt_param     RM 2.5


//APICAL DENDRITE COMPARTMENTS ***************************************
// apdend1 Fig A6 Traub et al. J. Neurophysiol 2005;93:2194-2232
apdend1  soma  0  0  50 3       Ca_d14 -1.65521236e17     NaF14       3000   \
                                NaP14        1.2          KDR14       2400   \
                                KA14      2380            K214           2   \
                                KM14        84            CaL14          2   \
                                CaH14        4            KCd14        300   \
                                AR14         5          KAHPd14        4.0

// apdend2 Fig A6 Traub et al. J. Neurophysiol 2005;93:2194-2232
apdend2  apdend1  0  0  50   2.8    Ca_d14 -1.88092836e17 NaF14   1500  \
                                    NaP14        0.6     KDR14   1500  \
                                    KA14        272       K214      2  \
                                    KM14        84       CaL14     4  \
                                    CaH14        2       KCd14   300  \
                                    AR14         5     KAHPd14   4.0


// apdend3 Fig A6 Traub et al. J. Neurophysiol 2005;93:2194-2232
apdend3  apdend2  0  0  50   2.8   Ca_d14 -2.22818969E17  NaF14   100  \
                                    NaP14       0.04     KDR14    0  \
                                    KA14      272        K214     2  \
                                    KM14       84        CaL14    2  \
                                    CaH14       4        KCd14    0  \
                                    AR14        5        KAHPd14  4.0


// apdend4 Fig A6 Traub et al. J. Neurophysiol 2005;93:2194-2232
apdend4  apdend3  0  0  50   2.6    Ca_d14 -2.22818969e17    NaF14          100  \
                                    NaP14       0.04         KDR14           0  \
                                    KA14      272            K214            2  \
                                    KM14       84            CaL14           2  \
                                    CaH14       4            KCd14           0  \
                                    AR14        5            KAHPd14         4.0

// apdend5 Fig A6 Traub et al. J. Neurophysiol 2005;93:2194-2232
apdend5  apdend4  0  0  50   2.40  Ca_d14    -2.41385133e17  NaF14	    100 \
                                    NaP14       0.04         KDR14           0  \
                                    KA14      272            K214            2  \
                                    KM14       84            CaL14           2  \
                                    CaH14       4            KCd14           0  \
                                    AR14        5            KAHPd14         4.0

// apdend6 Fig A6 Traub et al. J. Neurophysiol 2005;93:2194-2232
apdend6  apdend5  0  0  50   2      Ca_d14 -3.31042301e17    NaF14          100  \
                                    NaP14       0.04         KDR14           0  \
                                    KA14      272            K214            2  \
                                    KM14       84            CaL14           2  \
                                    CaH14       40           KCd14           0  \
                                    AR14        5            KAHPd14         4.0

// apdend7  Fig A6 Traub et al. J. Neurophysiol 2005;93:2194-2232
apdend7  apdend6  0  0  50   1.8    Ca_d14 -3.67824744e17    NaF14          100  \
                                    NaP14       0.04         KDR14           0  \
                                    KA14      272            K214            2  \
                                    KM14       84            CaL14           2  \
                                    CaH14       40           KCd14           0  \
                                    AR14        5            KAHPd14         4.0

// apdend8  Fig A6 Traub et al. J. Neurophysiol 2005;93:2194-2232
apdend8  apdend7  0  0  50   1.6    Ca_d14 -4.1380285e17     NaF14          100  \
                                    NaP14         0.04       KDR14           0  \
                                    KA14        272          K214            2  \
                                    KM14         84          CaL14           2  \
                                    CaH14         40         KCd14           0  \
                                    AR14          5        KAHPd14         4.0

// apdend9  Fig A6 Traub et al. J. Neurophysiol 2005;93:2194-2232
apdend9  apdend8  0  0  50   1.4    Ca_d14 -5.32033542e17    NaF14          100   \
                                    NaP14       0.04         KDR14           0   \
                                    KA14      272            K214            2   \
                                    KM14       84            CaL14           2   \
                                    CaH14       40           KCd14           0   \
                                    AR14        5            KAHPd14         4.0

// apdend10  Fig A6 Traub et al. J. Neurophysiol 2005;93:2194-2232
apdend10  apdend9  0  0  40   1.2   Ca_d14  -6.8967142e17    NaF14          100  \
                                    NaP14       0.04         KDR14           0  \
                                    KA14      272            K214            2  \
                                    KM14       84            CaL14           2  \
                                    CaH14       40           KCd14           0  \
                                    AR14        5            KAHPd14         4.0

//APICAL OBLIQUE DENDRITE COMPARTMENTS ***************************************

// apobdistRa  Fig A6 Traub et al. J. Neurophysiol 2005;93:2194-2232
apobdistRa  apdend3  42.4  42.4 0  1.24      Ca_d14 -6.1180627e17     NaF14      1500  \
                                             NaP14        0.6         KDR14      1500  \
                                             KA14       272           K214         2  \
                                             KM14        84           CaL14        2  \
                                             CaH14        4           KCd14      300  \
                                             AR14         5           KAHPd14      4.0

// apobdistRb  Fig A6 Traub et al. J. Neurophysiol 2005;93:2194-2232
apobdistRb  apobdistRa  42.4  42.4 0   1.24   Ca_d14    -6.1180971e17  NaF14       100  \
                                              NaP14       0.04         KDR14        0  \
                                              KA14      272            K214         2  \
                                              KM14       84            CaL14        2  \
                                              CaH14       4            KCd14        0  \
                                              AR14        5          KAHPd14      4.0

// apobdistRc  Fig A6 Traub et al. J. Neurophysiol 2005;93:2194-2232
apobdistRc  apobdistRb  42.4  42.4 0   1.24    Ca_d14 -6.1180994e17     NaF14       100  \
                                              NaP14       0.04         KDR14        0  \
                                              KA14      272            K214         2  \
                                              KM14       84            CaL14        2  \
                                              CaH14       4            KCd14        0  \
                                              AR14        5            KAHPd14      4.0

// apobdistLa  Fig A6 Traub et al. J. Neurophysiol 2005;93:2194-2232
apobdistLa  apdend3  -42.4  -42.4 0   1.24      Ca_d14 -6.1180627e17     NaF14      1500  \
                                               NaP14        0.6         KDR14      1500  \
                                               KA14       272           K214         2  \
                                               KM14        84           CaL14        2  \
                                               CaH14        4           KCd14      300  \
                                               AR14         5         KAHPd14      4.0

// apobdistLb  Fig A6 Traub et al. J. Neurophysiol 2005;93:2194-2232
apobdistLb  apobdistLa  -42.4  -42.4 0   1.24    Ca_d14 -6.11809714e17    NaF14       100  \
                                                NaP14       0.04         KDR14        0  \
                                                KA14      272            K214         2  \
                                                KM14       84            CaL14        2  \
                                                CaH14       4            KCd14        0  \
                                                AR14        5            KAHPd14      4.0

// apobdistLc  Fig A6 Traub et al. J. Neurophysiol 2005;93:2194-2232
apobdistLc  apobdistLb  -42.4  -42.4 0   1.24    Ca_d14 -6.1180994e17     NaF14       100  \
                                                NaP14       0.04         KDR14        0  \
                                                KA14      272            K214         2  \
                                                KM14       84            CaL14        2  \
                                                CaH14       4            KCd14        0  \
                                                AR14        5            KAHPd14      4.0

// apobmidRa  Fig A6 Traub et al. J. Neurophysiol 2005;93:2194-2232
apobmidRa  apdend2  42.4  -42.4  0   1.24      Ca_d14 -6.1180483E17     NaF14      1500  \
                                              NaP14        0.6         KDR14      1500  \
                                              KA14       272           K214         2  \
                                              KM14        84           CaL14        2  \
                                              CaH14        4           KCd14      300  \
                                              AR14         5           KAHPd14      4.0

// apobmidRb  Fig A6 Traub et al. J. Neurophysiol 2005;93:2194-2232
apobmidRb  apobmidRa  42.4  -42.4  0   1.24     Ca_d14 -6.118106E17      NaF14       100  \
                                               NaP14       0.04         KDR14        0  \
                                               KA14      272            K214         2  \
                                               KM14       84            CaL14        2  \
                                               CaH14       4            KCd14        0  \
                                               AR14        5            KAHPd14      4.0

// apobmidRc  Fig A6 Traub et al. J. Neurophysiol 2005;93:2194-2232
apobmidRc  apobmidRb  42.4  -42.4  0   1.24     Ca_d14 -6.1179686E17     NaF14       100  \
                                               NaP14       0.04         KDR14        0  \
                                               KA14      272            K214         2  \
                                               KM14       84            CaL14        2  \
                                               CaH14       4            KCd14        0  \
                                               AR14        5            KAHPd14      4.0

// apobmidLa  Fig A6 Traub et al. J. Neurophysiol 2005;93:2194-2232
apobmidLa  apdend2  -42.4  42.4  0   1.24     Ca_d14 -6.1180483E17     NaF14      1500  \
                                              NaP14        0.6         KDR14      1500  \
                                              KA14       272           K214         2  \
                                              KM14        84           CaL14        2  \
                                              CaH14        4           KCd14      300  \
                                              AR14         5          KAHPd14      4.0

// apobmidLb  Fig A6 Traub et al. J. Neurophysiol 2005;93:2194-2232
apobmidLb  apobmidLa  -42.4  42.4  0   1.24    Ca_d14  -6.118106E17      NaF14       100  \
                                               NaP14       0.04         KDR14        0  \
                                               KA14      272            K214         2  \
                                               KM14       84            CaL14        2  \
                                               CaH14       4            KCd14        0  \
                                               AR14        5            KAHPd14      4.0

// apobmidLc  Fig A6 Traub et al. J. Neurophysiol 2005;93:2194-2232
apobmidLc  apobmidLb  -42.4  42.4  0   1.24    Ca_d14 -6.1179686E17      NaF14       100  \
                                               NaP14       0.04         KDR14        0  \
                                               KA14      272            K214         2  \
                                               KM14       84            CaL14        2  \
                                               CaH14       4            KCd14        0  \
                                               AR14        5            KAHPd14      4.0

// apobproxRa  Fig A6 Traub et al. J. Neurophysiol 2005;93:2194-2232
apobproxRa  apdend1  42.4  42.4  0   1.24    Ca_d14 -6.1180297E17     NaF14      1500  \
                                             NaP14        0.6         KDR14      1500  \
                                             KA14       272           K214         2  \
                                             KM14        84           CaL14        2  \
                                             CaH14        4           KCd14      300  \
                                             AR14         5           KAHPd14      4.0

// apobproxRb Fig A6 Traub et al. J. Neurophysiol 2005;93:2194-2232
apobproxRb  apobproxRa  42.4  42.4  0 1.24    Ca_d14 -6.118106E17      NaF14       100  \
                                              NaP14       0.04         KDR14        0  \
                                              KA14      272            K214         2  \
                                              KM14       84            CaL14        2  \
                                              CaH14       4            KCd14        0  \
                                              AR14        5           KAHPd14      4.0

// apobproxRc Fig A6 Traub et al. J. Neurophysiol 2005;93:2194-2232
apobproxRc  apobproxRb  42.4  42.4  0 1.24    Ca_d14 -6.1181232E17     NaF14       100  \
                                              NaP14       0.04         KDR14        0  \
                                              KA14      272            K214         2  \
                                              KM14       84            CaL14        2  \
                                              CaH14       4            KCd14        0  \
                                              AR14        5            KAHPd14      4.0

// apobproxLa  Fig A6 Traub et al. J. Neurophysiol 2005;93:2194-2232
apobproxLa  apdend1  -42.4  -42.4  0   1.24    Ca_d14 -6.1180297E17     NaF14      1500 \
                                               NaP14        0.6         KDR14      1500 \
                                               KA14       272           K214         2  \
                                               KM14        84           CaL14        2  \
                                               CaH14        4           KCd14      300  \
                                               AR14         5          KAHPd14      4.0

// apobproxLb  Fig A6 Traub et al. J. Neurophysiol 2005;93:2194-2232
apobproxLb  apobproxLa  -42.4  -42.4  0  1.24   Ca_d14 -6.118106E17      NaF14       100 \
                                                NaP14       0.04         KDR14        0  \
                                                KA14      272            K214         2  \
                                                KM14       84            CaL14        2  \
                                                CaH14       4            KCd14        0  \
                                                AR14        5          KAHPd14        4.0

// apobproxLc  Fig A6 Traub et al. J. Neurophysiol 2005;93:2194-2232
apobproxLc  apobproxLb  -42.4  -42.4  0  1.24   Ca_d14 -6.118106E17      NaF14       100 \
                                                NaP14       0.04         KDR14        0  \
                                                KA14      272            K214         2  \
                                                KM14       84            CaL14        2  \
                                                CaH14       4            KCd14        0  \
                                                AR14        5          KAHPd14      4.0

*set_compt_param     RA 2.5
*set_compt_param     CM 0.018
*set_compt_param     ELEAK -0.0666
*set_compt_param     RM 2.5


//BASAL DENDRITE COMPARTMENTS ************************************************
// basalLsupera  Fig A6 Traub et al. J. Neurophysiol 2005;93:2194-2232
basalLsupera  soma  -26.8  -46.4  -27.2  1.7    Ca_d14 -4.05689382E17  NaF14        1500  \
                                                NaP14        0.6     KDR14        1500  \
                                                KA14       272       K214           2  \
                                                KM14        84       CaL14          2  \
                                                CaH14        4       KCd14        300  \
                                                AR14         5       KAHPd14        4.0

// basalLsuperb  Fig A6 Traub et al. J. Neurophysiol 2005;93:2194-2232
basalLsuperb  basalLsupera  -26.8  -46.4 -27.2  1.7     Ca_d14 -4.05691135E17  NaF14        100  \
                                                        NaP14        0.04    KDR14          0  \
                                                        KA14       272       K214           2  \
                                                        KM14        84       CaL14          2  \
                                                        CaH14        4       KCd14          0  \
                                                        AR14         5       KAHPd14        4.0

// basalLsuperc  Fig A6 Traub et al. J. Neurophysiol 2005;93:2194-2232
basalLsuperc  basalLsuperb  -26.8  -46.4 -27.2  1.7     Ca_d14 -4.05691135E17 NaF14         100  \
                                                        NaP14        0.04    KDR14          0  \
                                                        KA14       136       K214           2  \
                                                        KM14        84       CaL14          2  \
                                                        CaH14        4       KCd14          0  \
                                                        AR14         5       KAHPd14        4.0

// basalLmida  Fig A6 Traub et al. J. Neurophysiol 2005;93:2194-2232
basalLmida  soma  -19.3  33.4  -46.0  1.7      Ca_d14 -4.05689382E17  NaF14        1500  \
                                                NaP14        0.6     KDR14        1500  \
                                                KA14       272       K214           2  \
                                                KM14        84       CaL14          2  \
                                                CaH14        4       KCd14        300  \
                                                AR14         5       KAHPd14        4.0

// basalLmidb  Fig A6 Traub et al. J. Neurophysiol 2005;93:2194-2232
basalLmidb  basalLmida  -19.3  33.4 -46.0  1.7         Ca_d14 -4.05689382E17 NaF14         100  \
                                                       NaP14        0.04    KDR14          0  \
                                                       KA14       272       K214           2  \
                                                       KM14        84       CaL14          2  \
                                                       CaH14        4       KCd14          0  \
                                                       AR14         5       KAHPd14        4.0

// basalLmidc  Fig A6 Traub et al. J. Neurophysiol 2005;93:2194-2232
basalLmidc  basalLmidb  -19.3  33.4 -46.0  1.7         Ca_d14    -4.05689382E17  NaF14     100  \
                                                       NaP14        0.04    KDR14          0  \
                                                       KA14       272       K214           2  \
                                                       KM14        84       CaL14          2  \
                                                       CaH14        4       KCd14          0  \
                                                       AR14         5       KAHPd14        4.0

// basalRsupera  Fig A6 Traub et al. J. Neurophysiol 2005;93:2194-2232
basalRsupera  soma   26.8  46.4  -27.2  1.7    Ca_d14    -4.05689382E17  NaF14        1500  \
                                               NaP14        0.6     KDR14        1500  \
                                               KA14       272       K214           2  \
                                               KM14        84       CaL14          2  \
                                               CaH14        4       KCd14        200  \
                                               AR14         5     KAHPd14        4.0

// basalRsuperb  Fig A6 Traub et al. J. Neurophysiol 2005;93:2194-2232
basalRsuperb  basalRsupera   26.8  46.4 -27.2  1.7     Ca_d14 -4.05689382E17 NaF14         100  \
                                                       NaP14        0.04    KDR14          0  \
                                                       KA14       272       K214           2  \
                                                       KM14        84       CaL14          2  \
                                                       CaH14        4       KCd14          0  \
                                                       AR14         5       KAHPd14        4.0

// basalRsuperc  Fig A6 Traub et al. J. Neurophysiol 2005;93:2194-2232
basalRsuperc  basalRsuperb   26.8  46.4 -27.2  1.7     Ca_d14 -4.05689382E17 NaF14         100  \
                                                       NaP14        0.04    KDR14          0  \
                                                       KA14       272       K214           2  \
                                                       KM14        84       CaL14          2  \
                                                       CaH14        4       KCd14          0  \
                                                       AR14         5       KAHPd14        4.0

// basalRmida  Fig A6 Traub et al. J. Neurophysiol 2005;93:2194-2232
basalRmida  soma   19.3  -33.4  -46.0  1.7      Ca_d14  -4.05689382E17   NaF14    1500  \
                                                NaP14        0.6         KDR14    1500  \
                                                KA14       272           K214       2  \
                                                KM14        84           CaL14      2  \
                                                CaH14        4           KCd14    300  \
                                                AR14         5           KAHPd14    4.0

// basalRmidb  Fig A6 Traub et al. J. Neurophysiol 2005;93:2194-2232
basalRmidb  basalRmida   19.3  -33.4 -46.0  1.7     Ca_d14 -4.05689382E17     NaF14     100  \
                                                    NaP14        0.04        KDR14      0  \
                                                    KA14       272           K214       2  \
                                                    KM14        84           CaL14      2  \
                                                    CaH14        4           KCd14      0  \
                                                    AR14         5           KAHPd14    4.0

// basalRmidc  Fig A6 Traub et al. J. Neurophysiol 2005;93:2194-2232
basalRmidc  basalRmidb   19.3  -33.4 -46.0  1.7     Ca_d14 -4.05689382E17     NaF14     100  \
                                                    NaP14        0.04        KDR14      0  \
                                                    KA14       272           K214       2  \
                                                    KM14        84           CaL14      2  \
                                                    CaH14        4           KCd14      0  \
                                                    AR14         5           KAHPd14    4.0

// basaldeepa  Fig A6 Traub et al. J. Neurophysiol 2005;93:2194-2232
basaldeepa  soma  0  0  -60.0  1.7          Ca_d14 -4.05689382E17    NaF14    1500  \
                                            NaP14        0.6         KDR14    1500  \
                                            KA14       272           K214       2  \
                                            KM14        84           CaL14      2  \
                                            CaH14        4           KCd14    300  \
                                            AR14         5           KAHPd14    4.0

// basaldeepb  Fig A6 Traub et al. J. Neurophysiol 2005;93:2194-2232
basaldeepb  basaldeepa  0  0 -60.0  1.7             Ca_d14 -4.05689382E17     NaF14     100  \
                                                    NaP14        0.04        KDR14      0  \
                                                    KA14       272           K214       2  \
                                                    KM14        84           CaL14      2  \
                                                    CaH14        4           KCd14      0  \
                                                    AR14         5           KAHPd14    4.0

// basaldeepc  Fig A6 Traub et al. J. Neurophysiol 2005;93:2194-2232
basaldeepc  basaldeepb  0  0 -60.0  1.7             Ca_d14 -4.05689382E17     NaF14     100  \
                                                    NaP14        0.04        KDR14      0  \
                                                    KA14       272           K214       2  \
                                                    KM14        84           CaL14      2  \
                                                    CaH14        4           KCd14      0  \
                                                    AR14         5           KAHPd14    4.0


//              Specifying constants for axonal compartment RMCM=0.0024 (0.0009)
*set_compt_param        RM      0.10   //(0.1)
*set_compt_param        RA      1.00   //(1.00)
*set_compt_param        CM      0.009  //(0.009)(0.024)
*set_compt_param        ELEAK   -0.0666

//AXONAL COMPARTMENTS ***************************************
// axona Fig A6 Traub et al. J. Neurophysiol 2005;93:2194-2232
// Differs from Traub et al., in that axon is vertical
axona  soma  0  0 -25  1.8      NaF14       4500   \
                                KDR14       4500   \
                                KA14          40       K214               1

// axonb Fig A6 Traub et al. J. Neurophysiol 2005;93:2194-2232
// Differs from Traub et al., in that axon is vertical
axonb  axona  0  0 -50  1.8     NaF14       4500   \
                                KDR14       4500   \
                                KA14          40       K214               1

// axonLa Fig A6 Traub et al. J. Neurophysiol 2005;93:2194-2232
// Differs from Traub et al., in that axon is vertical
axonLa  axonb  -8.7  0 -49.2  1.8    NaF14       4500   \
                                     KDR14       4500   \
                                     KA14          40  K214               1

// axonLb Fig A6 Traub et al. J. Neurophysiol 2005;93:2194-2232
// Differs from Traub et al., in that axon is vertical
axonLb  axonLa  -8.7  0 -49.2  1.8   NaF14       4500   \
                                     KDR14       4500   \
                                     KA14          40  K214               1

// axonRa Fig A6 Traub et al. J. Neurophysiol 2005;93:2194-2232
// Differs from Traub et al., in that axon is vertical
axonRa  axonb   8.7  0 -49.2  1.8    NaF14       4500   \
                                     KDR14       4500   \
                                     KA14          40  K214               1

// axonRb Fig A6 Traub et al. J. Neurophysiol 2005;93:2194-2232
// Differs from Traub et al., in that axon is vertical
axonRb  axonRa   8.7  0 -49.2  1.8   NaF14       4500   \
                                     KDR14       4500   \
                                     KA14          40  K214               1

