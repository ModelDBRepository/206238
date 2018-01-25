// ST4RScell3D.p cell.p - Cell parameter file used in TraubFS_B

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

*set_global              EREST_ACT      -0.07

//		Specifying constants
   *set_compt_param	RM	5  //0.33333 (2.50)
   *set_compt_param	RA	2.50  //0.3 (2.00)
   *set_compt_param	CM	0.009  //0.01 (0.01)
//   *set_compt_param     EREST_ACT	-0.065  //
   *set_compt_param     ELEAK           -0.0666   // -0.0710


//SOMA *************************************************************   
// For the soma, use the leakage potential (-0.07 + 0.0106) for Em
//*set_compt_param     ELEAK	-0.0594
// Actually, after Cunningham et al. PNAS 2004;101:7152-7157, will maintain
// leakage potential at ELEAK   -0.07
soma  none  0   0  20 15.0  Ca_s17  -5.5173713E16  NaF17  1500 \
                            NaP17   1.5   KDR17   1000 \
                            KA17    300   K217    1.0  \
                            CaH17   5.0   KCs17   100  \
                            KM17    37.5  KAHPs17 2.0  \
                            AR17    2.5	  CaL17	  1

//*set_compt_param        ELEAK   -0.075
*set_compt_param	RM	2.50  //0.33333 (2.50)
*set_compt_param	RA	2.50  //0.3 (2.00)
*set_compt_param	CM	0.018  //0.01 (0.01)

//PROXIMAL DENDRITE COMPARTMENTS ***************************************

// proxdendN   Cunningham et al., PNAS  2004;101:7152-7157
proxdendN  soma  0  0  40 2.12  Ca_d17 -1.95190046E17    NaF17       1500   \
                                NaP17          1.5       KDR17       1500   \
                                KA17         600         K217           2   \
                                CaH17         10         KCd17        200   \
                                KM17          75         KAHPd17        2.0 \
                                AR17           5         CaL17          2

// proxdendE   Cunningham et al., PNAS  2004;101:7152-7157
proxdendE  soma  40  0  0 2.12  Ca_d17  -1.95190046E17   NaF17       1500   \
                                NaP17          1.5       KDR17       1500   \
                                KA17          600        K217           2   \
                                CaH17         10         KCd17        200   \
                                KM17          75         KAHPd17        2.0 \
                                AR17           5         CaL17          2

// proxdendS   Cunningham et al., PNAS  2004;101:7152-7157
proxdendS  soma  0  0  -40 2.12 Ca_d17  -1.95190046E17   NaF17       1500   \
                                NaP17          1.5       KDR17       1500   \
                                KA17          600        K217          2   \
                                CaH17          10        KCd17       200   \
                                KM17           75        KAHPd17       2.0 \
                                AR17           5         CaL17         2 

// proxdendW   Cunningham et al., PNAS  2004;101:7152-7157
proxdendW  soma  -40 0  0 2.12  Ca_d17  -1.95190046E17   NaF17       1500   \
                                NaP17        1.5         KDR17       1500   \
                                KA17         600         K217           2   \
                                CaH17         10         KCd17        200   \
                                KM17          75         KAHPd17        2.0 \
                                AR17           6         CaL17         2


*set_compt_param	RM	2.5  //0.33333 (2.50)
*set_compt_param	RA	2.5  //0.3 (2.00)
*set_compt_param	CM	0.018  //0.01 (0.01)
//*set_compt_param     ELEAK	-0.075


//North DISTAL DENDRITE COMPARTMENTS ***************************************
// distdendNlonga   Cunningham et al., PNAS  2004;101:7152-7157
distdendNlonga  proxdendN  -6.84  11.8 37.6 1.34  Ca_d17 -3.10352894E17    NaF17     1500   \
                                                  NaP17         1.5        KDR17     1500   \
                                                  KA17          40         K217        2   \
                                                  CaH17         10         KCd17     200   \
                                                  KM17          75         KAHPd17     2.0 \
                                                  AR17           5         CaL17        2 

// distdendNlongb   Cunningham et al., PNAS  2004;101:7152-7157
distdendNlongb  distdendNlonga  -6.84 11.8 37.6 1.34    Ca_d17 -4.93830564E17    NaF17     100   \
                                                        NaP17          0.1       KDR17       0   \
                                                        KA17          40         K217        2   \
                                                        CaH17         10         KCd17     200   \
                                                        KM17          75         KAHPd17     2.0 \
                                                        AR17           5         CaL17       2

// distdendNlongc   Cunningham et al., PNAS  2004;101:7152-7157
distdendNlongc  distdendNlongb  -6.84 11.8 37.6 0.84    Ca_d17 -4.93830564E17    NaF17      100   \
                                                        NaP17          0.1       KDR17       0   \
                                                        KA17          40         K217        2   \
                                                        CaH17         10         KCd17       0   \
                                                        KM17          75         KAHPd17     2.0 \
                                                        AR17           5         CaL17       2

// distdendNlongd   Cunningham et al., PNAS  2004;101:7152-7157
distdendNlongd  distdendNlongc  -6.84 11.8 37.6 0.84    Ca_d17 -4.93830564E17    NaF17      100  \
                                                        NaP17          0.1       KDR17       0   \
                                                        KA17          40         K217        2   \
                                                        CaH17         10         KCd17       0   \
                                                        KM17          75         KAHPd17     2.0 \
                                                        AR17           5         CaL17       2

// distdendNlonge   Cunningham et al., PNAS  2004;101:7152-7157
distdendNlonge  distdendNlongd  -6.84 11.8 37.6 0.84    Ca_d17 -4.93830564E17    NaF17      100   \
                                                        NaP17          0.1       KDR17       0   \
                                                        KA17          40         K217        2   \
                                                        CaH17         60         KCd17       0   \
                                                        KM17          75         KAHPd17     2.0 \
                                                        AR17           5         CaL17       2

// distdendNlongf   Cunningham et al., PNAS  2004;101:7152-7157
distdendNlongf  distdendNlonge  -6.84 11.8 37.6 0.84    Ca_d17 -4.93830564E17    NaF17     100   \
                                                        NaP17         0.1        KDR17       0   \
                                                        KA17          40         K217        2   \
                                                        CaH17         60         KCd17       0   \
                                                        KM17          75         KAHPd17     2.0 \
                                                        AR17           5         CaL17       2

// distdendNlongg   Cunningham et al., PNAS  2004;101:7152-7157
distdendNlongg  distdendNlongf  -6.84 11.8 37.6 0.84    Ca_d17 -4.93830426E17    NaF17      100   \
                                                        NaP17          0.1       KDR17       0   \
                                                        KA17          40         K217        2   \
                                                        CaH17         60         KCd17       0   \
                                                        KM17          75         KAHPd17     2.0 \
                                                        AR17           5         CaL17       2

// distdendNmida   Cunningham et al., PNAS  2004;101:7152-7157
distdendNmida  proxdendN  6.84  -11.8 37.6  1.34   Ca_d17 -3.10352894E17    NaF17     1500   \
                                                   NaP17         1.5        KDR17     1500   \
                                                   KA17          40         K217        2    \
                                                   CaH17         10         KCd17     200   \
                                                   KM17          75         KAHPd17     2.0 \
                                                   AR17           5         CaL17       2

// distdendNmidb   Cunningham et al., PNAS  2004;101:7152-7157
distdendNmidb  distdendNmida  6.84 -11.8 37.6  1.34     Ca_d17 -3.1035389E17     NaF17      100   \
                                                        NaP17         0.1        KDR17       0   \
                                                        KA17          40         K217        2   \
                                                        CaH17         10         KCd17       200 \
                                                        KM17          75         KAHPd17     2.0 \
                                                        AR17           5         CaL17       2

// distdendNmidc   Cunningham et al., PNAS  2004;101:7152-7157
distdendNmidc  distdendNmidb  6.84 -11.8 37.6  0.84      Ca_d17 -4.93817851E17    NaF17      100  \
                                                         NaP17         0.1        KDR17       0   \
                                                         KA17          40         K217        2   \
                                                         CaH17         10         KCd17       0   \
                                                         KM17          75         KAHPd17     2.0 \
                                                         AR17           5         CaL17       2      

// distdendNshorta   Cunningham et al., PNAS  2004;101:7152-7157
distdendNshorta  distdendNlonga   6.84  -11.8 37.6  0.84  Ca_d17 -4.93830564E17    NaF17      100  \
                                                          NaP17         0.1        KDR17       0   \
                                                          KA17          40         K217        2   \
                                                          CaH17         10         KCd17       200 \
                                                          KM17          75         KAHPd17     2.0 \
                                                          AR17           5         CaL17       2

// distdendNshortb   Cunningham et al., PNAS  2004;101:7152-7157
distdendNshortb  distdendNshorta 6.84 -11.8 37.6  0.84   Ca_d17 -4.93817851E17    NaF17      100  \
                                                         NaP17          0.1       KDR17       0   \
                                                         KA17          40         K217        2   \
                                                         CaH17         10         KCd17       0   \
                                                         KM17          75         KAHPd17     2.0 \
                                                         AR17           5         CaL17       2

//East DISTAL DENDRITE COMPARTMENTS ***************************************
// distdendElonga   Cunningham et al., PNAS  2004;101:7152-7157
distdendElonga  proxdendE  32.5  18.8 13.68 1.34  Ca_d17 -3.10352894E17    NaF17     1500   \
                                                  NaP17         1.5        KDR17     1500   \
                                                  KA17          40         K217        2   \
                                                  CaH17         10         KCd17     200   \
                                                  KM17          75         KAHPd17     2.0 \
                                                  AR17           5         CaL17        2

// distdendElongb   Cunningham et al., PNAS  2004;101:7152-7157
distdendElongb  distdendElonga  32.5 18.8 13.68 1.34   Ca_d17 -4.93830564E17    NaF17     100   \
                                                        NaP17          0.1       KDR17       0   \
                                                        KA17          40         K217        2   \
                                                        CaH17         10         KCd17     200   \
                                                        KM17          75         KAHPd17     2.0 \
                                                        AR17           5         CaL17       2

// distdendElongc   Cunningham et al., PNAS  2004;101:7152-7157
distdendElongc  distdendElongb  32.5 18.8 13.68 0.84   Ca_d17 -4.93830564E17    NaF17      100   \
                                                        NaP17          0.1       KDR17       0   \
                                                        KA17          40         K217        2   \
                                                        CaH17         10         KCd17       0   \
                                                        KM17          75         KAHPd17     2.0 \
                                                        AR17           5         CaL17       2

// distdendElongd   Cunningham et al., PNAS  2004;101:7152-7157
distdendElongd  distdendElongc  32.5 18.8 13.68 0.84    Ca_d17 -4.93830564E17    NaF17      100  \
                                                        NaP17          0.1       KDR17       0   \
                                                        KA17          40         K217        2   \
                                                        CaH17         10         KCd17       0   \
                                                        KM17          75         KAHPd17     2.0 \
                                                        AR17           5         CaL17       2

// distdendElonge   Cunningham et al., PNAS  2004;101:7152-7157
distdendElonge  distdendElongd  32.5 18.8 13.68 0.84   Ca_d17 -4.93830564E17    NaF17      100   \
                                                        NaP17          0.1       KDR17       0   \
                                                        KA17          40         K217        2   \
                                                        CaH17         60         KCd17       0   \
                                                        KM17          75         KAHPd17     2.0 \
                                                        AR17           5         CaL17       2

// distdendElongf   Cunningham et al., PNAS  2004;101:7152-7157
distdendElongf  distdendElonge  32.5 18.8 13.68 0.84   Ca_d17 -4.93830564E17    NaF17     100   \
                                                        NaP17         0.1        KDR17       0   \
                                                        KA17          40         K217        2   \
                                                        CaH17         60         KCd17       0   \
                                                        KM17          75         KAHPd17     2.0 \
                                                        AR17           5         CaL17       2

// distdendElongg   Cunningham et al., PNAS  2004;101:7152-7157
distdendElongg  distdendElongf  32.5 18.8 13.68 0.84   Ca_d17 -4.93830426E17    NaF17      100   \
                                                        NaP17          0.1       KDR17       0   \
                                                        KA17          40         K217        2   \
                                                        CaH17         60         KCd17       0   \
                                                        KM17          75         KAHPd17     2.0 \
                                                        AR17           5         CaL17       2

// distdendEmida   Cunningham et al., PNAS  2004;101:7152-7157
distdendEmida  proxdendE  32.5 18.8 -13.68 1.34    Ca_d17 -3.10352894E17    NaF17     1500   \
                                                   NaP17         1.5        KDR17     1500   \
                                                   KA17          40         K217        2   \
                                                   CaH17         10         KCd17     200   \
                                                   KM17          75         KAHPd17     2.0 \
                                                   AR17           5         CaL17       2

// distdendEmidb   Cunningham et al., PNAS  2004;101:7152-7157
distdendEmidb  distdendEmida 32.5 18.8 -13.68  1.34    Ca_d17 -3.1035389E17     NaF17      100   \
                                                        NaP17         0.1        KDR17       0   \
                                                        KA17          40         K217        2   \
                                                        CaH17         10         KCd17       200 \
                                                        KM17          75         KAHPd17     2.0 \
                                                        AR17           5         CaL17       2

// distdendEmidc   Cunningham et al., PNAS  2004;101:7152-7157
distdendEmidc  distdendEmidb  32.5 18.8 -13.68  0.84    Ca_d17 -4.93817851E17    NaF17      100  \
                                                         NaP17         0.1        KDR17       0   \
                                                         KA17          40         K217        2   \
                                                         CaH17         10         KCd17       0   \
                                                         KM17          75         KAHPd17     2.0 \
                                                         AR17           5         CaL17       2

// distdendEshorta   Cunningham et al., PNAS  2004;101:7152-7157
distdendEshorta  distdendElonga   32.5  18.8  -13.68 0.84 Ca_d17 -4.93830564E17    NaF17      100  \
                                                          NaP17         0.1        KDR17       0   \
                                                          KA17          40         K217        2   \
                                                          CaH17         10         KCd17       200 \
                                                          KM17          75         KAHPd17     2.0 \
                                                          AR17           5         CaL17       2

// distdendEshortb   Cunningham et al., PNAS  2004;101:7152-7157
distdendEshortb  distdendEshorta 32.5 18.8 -13.68 0.84 Ca_d17 -4.93817851E17    NaF17      100  \
                                                         NaP17          0.1       KDR17       0   \
                                                         KA17          40         K217        2   \
                                                         CaH17         10         KCd17       0   \
                                                         KM17          75         KAHPd17     2.0 \
                                                         AR17           5         CaL17       2

//South DISTAL DENDRITE COMPARTMENTS ***************************************
// distdendSlonga   Cunningham et al., PNAS  2004;101:7152-7157
distdendSlonga  proxdendS  6.84  -11.8 -37.6 1.34  Ca_d17 -3.10352894E17    NaF17     1500   \
                                                  NaP17         1.5        KDR17     1500   \
                                                  KA17          40         K217        2   \
                                                  CaH17         10         KCd17     200   \
                                                  KM17          75         KAHPd17     2.0 \
                                                  AR17           5         CaL17        2

// distdendSlongb   Cunningham et al., PNAS  2004;101:7152-7157
distdendSlongb  distdendSlonga  6.84 -11.8 -37.6 1.34    Ca_d17 -4.93830564E17    NaF17     100   \
                                                        NaP17          0.1       KDR17       0   \
                                                        KA17          40         K217        2   \
                                                        CaH17         10         KCd17     200   \
                                                        KM17          75         KAHPd17     2.0 \
                                                        AR17           5         CaL17       2

// distdendSlongc   Cunningham et al., PNAS  2004;101:7152-7157
distdendSlongc  distdendSlongb  6.84 -11.8 -37.6 0.84    Ca_d17 -4.93830564E17    NaF17      100   \
                                                        NaP17          0.1       KDR17       0   \
                                                        KA17          40         K217        2   \
                                                        CaH17         10         KCd17       0   \
                                                        KM17          75         KAHPd17     2.0 \
                                                        AR17           5         CaL17       2

// distdendSlongd   Cunningham et al., PNAS  2004;101:7152-7157
distdendSlongd  distdendSlongc  6.84 -11.8 -37.6 0.84    Ca_d17 -4.93830564E17    NaF17      100  \
                                                        NaP17          0.1       KDR17       0   \
                                                        KA17          40         K217        2   \
                                                        CaH17         10         KCd17       0   \
                                                        KM17          75         KAHPd17     2.0 \
                                                        AR17           5         CaL17       2

// distdendSlonge   Cunningham et al., PNAS  2004;101:7152-7157
distdendSlonge  distdendSlongd  6.84 -11.8 -37.6 0.84    Ca_d17 -4.93830564E17    NaF17      100   \
                                                        NaP17          0.1       KDR17       0   \
                                                        KA17          40         K217        2   \
                                                        CaH17         60         KCd17       0   \
                                                        KM17          75         KAHPd17     2.0 \
                                                        AR17           5         CaL17       2

// distdendSlongf   Cunningham et al., PNAS  2004;101:7152-7157
distdendSlongf  distdendSlonge  6.84 -11.8 -37.6 0.84    Ca_d17 -4.93830564E17    NaF17     100   \
                                                        NaP17         0.1        KDR17       0   \
                                                        KA17          40         K217        2   \
                                                        CaH17         60         KCd17       0   \
                                                        KM17          75         KAHPd17     2.0 \
                                                        AR17           5         CaL17       2

// distdendSlongg   Cunningham et al., PNAS  2004;101:7152-7157
distdendSlongg  distdendSlongf  6.84 -11.8 -37.6 0.84    Ca_d17 -4.93830426E17    NaF17      100   \
                                                        NaP17          0.1       KDR17       0   \
                                                        KA17          40         K217        2   \
                                                        CaH17         60         KCd17       0   \
                                                        KM17          75         KAHPd17     2.0 \
                                                        AR17           5         CaL17       2

// distdendSmida   Cunningham et al., PNAS  2004;101:7152-7157
distdendSmida  proxdendS  -6.84  11.8 -37.6 1.34   Ca_d17 -3.10352894E17    NaF17     1500   \
                                                   NaP17         1.5        KDR17     1500   \
                                                   KA17          40         K217        2   \
                                                   CaH17         10         KCd17     200   \
                                                   KM17          75         KAHPd17     2.0 \
                                                   AR17           5         CaL17       2

// distdendSmidb   Cunningham et al., PNAS  2004;101:7152-7157
distdendSmidb  distdendSmida  -6.84 11.8 -37.6 2.34    Ca_d17 -3.1035389E17     NaF17      100   \
                                                        NaP17         0.1        KDR17       0   \
                                                        KA17          40         K217        2   \
                                                        CaH17         10         KCd17       200 \
                                                        KM17          75         KAHPd17     2.0 \
                                                        AR17           5         CaL17       2

// distdendSmidc   Cunningham et al., PNAS  2004;101:7152-7157
distdendSmidc  distdendSmidb  -6.84 11.8 -37.6  0.84     Ca_d17 -4.93817851E17    NaF17      100  \
                                                         NaP17         0.1        KDR17       0   \
                                                         KA17          40         K217        2   \
                                                         CaH17         10         KCd17       0   \
                                                         KM17          75         KAHPd17     2.0 \
                                                         AR17           5         CaL17       2

// distdendSshorta   Cunningham et al., PNAS  2004;101:7152-7157
distdendSshorta  distdendSlonga   -6.84  11.8 -37.6 0.84  Ca_d17 -4.93830564E17    NaF17      100  \
                                                          NaP17         0.1        KDR17       0   \
                                                          KA17          40         K217        2   \
                                                          CaH17         10         KCd17       200 \
                                                          KM17          75         KAHPd17     2.0 \
                                                          AR17           5         CaL17       2

// distdendSshortb   Cunningham et al., PNAS  2004;101:7152-7157
distdendSshortb  distdendSshorta -6.84 11.8 -37.6 0.84  Ca_d17 -4.93817851E17    NaF17      100  \
                                                         NaP17          0.1       KDR17       0   \
                                                         KA17          40         K217        2   \
                                                         CaH17         10         KCd17       0   \
                                                         KM17          75         KAHPd17     2.0 \
                                                         AR17           5         CaL17       2

//West DISTAL DENDRITE COMPARTMENTS ***************************************
// distdendWlonga   Cunningham et al., PNAS  2004;101:7152-7157
distdendWlonga  proxdendW -32.5 -18.8 13.68 1.34   Ca_d17 -3.10352894E17    NaF17     1500   \
                                                  NaP17         1.5        KDR17     1500   \
                                                  KA17          40         K217        2   \
                                                  CaH17         10         KCd17     200   \
                                                  KM17          75         KAHPd17     2.0 \
                                                  AR17           5         CaL17       2

// distdendWlongb   Cunningham et al., PNAS  2004;101:7152-7157
distdendWlongb  distdendWlonga -32.5 -18.8 13.68 1.34   Ca_d17 -4.93830564E17    NaF17     100   \
                                                        NaP17          0.1       KDR17       0   \
                                                        KA17          40         K217        2   \
                                                        CaH17         10         KCd17     200   \
                                                        KM17          75         KAHPd17     2.0 \
                                                        AR17           5         CaL17       2

// distdendWlongc   Cunningham et al., PNAS  2004;101:7152-7157
distdendWlongc  distdendWlongb -32.5 -18.8 13.68 0.84   Ca_d17 -4.93830564E17    NaF17      100   \
                                                        NaP17          0.1       KDR17       0   \
                                                        KA17          40         K217        2   \
                                                        CaH17         10         KCd17       0   \
                                                        KM17          75         KAHPd17     2.0 \
                                                        AR17           5         CaL17       2

// distdendWlongd   Cunningham et al., PNAS  2004;101:7152-7157
distdendWlongd  distdendWlongc -32.5 -18.8 13.68 0.84    Ca_d17 -4.93830564E17    NaF17      100  \
                                                        NaP17          0.1       KDR17       0   \
                                                        KA17          40         K217        2   \
                                                        CaH17         10         KCd17       0   \
                                                        KM17          75         KAHPd17     2.0 \
                                                        AR17           5         CaL17       2

// distdendWlonge   Cunningham et al., PNAS  2004;101:7152-7157
distdendWlonge  distdendWlongd -32.5 -18.8 13.68 0.84   Ca_d17 -4.93830564E17    NaF17      100   \
                                                        NaP17          0.1       KDR17       0   \
                                                        KA17          40         K217        2   \
                                                        CaH17         60         KCd17       0   \
                                                        KM17          75         KAHPd17     2.0 \
                                                        AR17           5         CaL17       2

// distdendWlongf   Cunningham et al., PNAS  2004;101:7152-7157
distdendWlongf  distdendWlonge -32.5 -18.8 13.68 0.84   Ca_d17 -4.93830564E17    NaF17     100   \
                                                        NaP17         0.1        KDR17       0   \
                                                        KA17          40         K217        2   \
                                                        CaH17         60         KCd17       0   \
                                                        KM17          75         KAHPd17     2.0 \
                                                        AR17           5         CaL17       2

// distdendWlongg   Cunningham et al., PNAS  2004;101:7152-7157
distdendWlongg  distdendWlongf -32.5 -18.8 13.68 0.84   Ca_d17 -4.93830426E17    NaF17      100   \
                                                        NaP17          0.1       KDR17       0   \
                                                        KA17          40         K217        2   \
                                                        CaH17         60         KCd17       0   \
                                                        KM17          75         KAHPd17     2.0 \
                                                        AR17           5         CaL17       2

// distdendWmida   Cunningham et al., PNAS  2004;101:7152-7157
distdendWmida  proxdendW  -32.5 -18.8 -13.68 1.34  Ca_d17 -3.10352894E17    NaF17     1500   \
                                                   NaP17         1.5        KDR17     1500   \
                                                   KA17          40         K217        2   \
                                                   CaH17         10         KCd17     200   \
                                                   KM17          75         KAHPd17     2.0 \
                                                   AR17           5         CaL17       2

// distdendWmidb   Cunningham et al., PNAS  2004;101:7152-7157
distdendWmidb  distdendWmida -32.5 -18.8 -13.68  1.34   Ca_d17 -3.1035389E17     NaF17      100   \
                                                        NaP17         0.1        KDR17       0   \
                                                        KA17          40         K217        2   \
                                                        CaH17         10         KCd17       200 \
                                                        KM17          75         KAHPd17     2.0 \
                                                        AR17           5         CaL17       2

// distdendWmidc   Cunningham et al., PNAS  2004;101:7152-7157
distdendWmidc  distdendWmidb  -32.5 -18.8 -13.68  0.84   Ca_d17 -4.93817851E17    NaF17      100  \
                                                         NaP17         0.1        KDR17       0   \
                                                         KA17          40         K217        2   \
                                                         CaH17         10         KCd17       0   \
                                                         KM17          75         KAHPd17     2.0 \
                                                         AR17           5         CaL17       2

// distdendWshorta   Cunningham et al., PNAS  2004;101:7152-7157
distdendWshorta  distdendWlonga   -32.5  -18.8 -13.68 0.84 Ca_d17 -4.93830564E17    NaF17      100  \
                                                          NaP17         0.1        KDR17       0   \
                                                          KA17          40         K217        2   \
                                                          CaH17         10         KCd17       200 \
                                                          KM17          75         KAHPd17     2.0 \
                                                          AR17           5         CaL17       2

// distdendWshortb   Cunningham et al., PNAS  2004;101:7152-7157
distdendWshortb  distdendWshorta -32.5 -18.8 -13.68 0.84  Ca_d17 -4.93817851E17    NaF17      100  \
                                                         NaP17          0.1       KDR17       0   \
                                                         KA17          40         K217        2   \
                                                         CaH17         10         KCd17       0   \
                                                         KM17          75         KAHPd17     2.0 \
                                                         AR17           5         CaL17       2

//		Specifying constants for axonal compartment

   *set_compt_param	RM	0.1   // (0.1)
   *set_compt_param	RA	1.0   // (1.0)
   *set_compt_param	CM	0.009  // (0.01) RC = 0.001
   *set_compt_param     ELEAK	-0.0666
  
// axona Fig 1. Traub et al., J Neurophysiol 2003;89:909-921
// Differs from Traub et al., in that axon is vertical
axona  soma  0  0 -25  1.4      NaF17       4000   \
                                KDR17       4000   \
                                KA17          20   K217          1

// axonb Fig 1. Traub et al., J Neurophysiol 2003;89:909-921
// Differs from Traub et al., in that axon is vertical
axonb  axona  0  0 -50  1.2     NaF17       4000   \
                                KDR17       4000   \
                                KA17          20   K217          1

// axonLa Fig 1. Traub et al., J Neurophysiol 2003;89:909-921
// Differs from Traub et al., in that axon is vertical
axonLa  axonb  -8.7  0 -49.2  1    NaF17       4000   \
                                     KDR17     4000   \
                                     KA17       20   K217     1

// axonLb Fig 1. Traub et al., J Neurophysiol 2003;89:909-921
// Differs from Traub et al., in that axon is vertical
axonLb  axonLa  -8.7  0 -49.2  1.0   NaF17       4000   \
                                     KDR17       4000   \
                                     KA17         20   K217     1    

// axonRa Fig 1. Traub et al., J Neurophysiol 2003;89:909-921
// Differs from Traub et al., in that axon is vertical
axonRa  axonb   8.7  0 -49.2  1.0    NaF17       4000   \
                                     KDR17       4000   \
                                     KA17         20   K217     1

// axonRb Fig 1. Traub et al., J Neurophysiol 2003;89:909-921
// Differs from Traub et al., in that axon is vertical
axonRb  axonRa   8.7  0 -49.2  1.0   NaF17       4000   \
                                     KDR17       4000   \
                                     KA17        20   K217     1
