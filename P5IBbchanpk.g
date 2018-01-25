//genesis

/* FILE INFORMATION
** The 1991 Traub set of voltage and concentration dependent channels
** Implemented as tabchannels by : Dave Beeman
**      R.D.Traub, R. K. S. Wong, R. Miles, and H. Michelson
**	Journal of Neurophysiology, Vol. 66, p. 635 (1991)
**
** This file depends on functions and constants defined in defaults.g
** As it is also intended as an example of the use of the tabchannel
** object to implement concentration dependent channels, it has extensive
** comments.  Note that the original units used in the paper have been
** converted to SI (MKS) units.  Also, we define the ionic equilibrium 
** potentials relative to the resting potential, EREST_ACT.  In the
** paper, this was defined to be zero.  Here, we use -0.060 volts, the
** measured value relative to the outside of the cell.
*/

/* November 1999 update for GENESIS 2.2: Previous versions of this file used
   a combination of a table, tabgate, and vdep_channel to implement the
   Ca-dependent K Channel - K(C).  This new version uses the new tabchannel
   "instant" field, introduced in GENESIS 2.2, to implement an
   "instantaneous" gate for the multiplicative Ca-dependent factor in the
   conductance.   This allows these channels to be used with the fast
   hsolve chanmodes > 1.
*/

// Now updated for Traub et al. J Neurophysiol 2003;89:909-921.

// CONSTANTS
float EREST_ACT = -0.070 /* hippocampal cell resting potl */
float ENAP5IBb = 0.11 + EREST_ACT // 0.05
float EKP5IBb = -0.025 + EREST_ACT // -0.095
float ECAP5IBb = 0.195 + EREST_ACT // 0.125
float EARP5IBb = 0.035 + EREST_ACT // -0.035
float SOMA_A = 3.320e-9       // soma area in square meters

/*
For these channels, the maximum channel conductance (Gbar) has been
calculated using the CA3 soma channel conductance densities and soma
area.  Typically, the functions which create these channels will be used
to create a library of prototype channels.  When the cell reader creates
copies of these channels in various compartments, it will set the actual
value of Gbar by calculating it from the cell parameter file.
*/

//========================================================================
//                Tabchannel gNa-transient, gNa(F) 2005/03
//========================================================================
function make_NaF7
        if ({exists NaF7})
            return
        end
        
        create tabchannel NaF7
            

        setfield NaF7 \ 
            Ek              0.05 \
            Ik              0  \
            Xpower          3 \
            Ypower          1
        
        setfield NaF7 \
            Gbar 1875 \
            Gk              0 

        float tab_divs = 741
        float v_min = -0.12

        float v_max = 0.06

        float v, dv, i
            
        // Creating table for gate m, using name X for it here

        float dv = ({v_max} - {v_min})/{tab_divs}
            
        call NaF7 TABCREATE X {tab_divs} {v_min} {v_max}
                
        v = {v_min}

            

        for (i = 0; i <= ({tab_divs}); i = i + 1)
            
            // Looking at rate: tau
                

            float tau
            v = v * 1000 // temporarily set v to units of equation...
            if ({v - 3.5} < -30 )
                tau =  0.025 + 0.14 * { exp { {{v - 3.5} + 30} / 10} } 
            else
                tau =  0.02 + 0.145 * { exp { -1 * {{v - 3.5} + 30} / 10.0} }
            end
            v = v * 0.001 // reset v
            
            // Set correct units of tau
            tau = tau * 0.001
            // inf
                

            float inf
            v = v * 1000 // temporarily set v to units of equation...
            inf =  1 / { 1 + {exp { { -1 * {v - 3.5} - 38} / 10}} } 
            v = v * 0.001 // reset v
            

            // Working out the "real" alpha and beta expressions from the tau and inf
            
            float alpha
            float beta
            alpha = inf / tau   
            beta = (1- inf)/tau
            
            
            setfield NaF7 X_A->table[{i}] {alpha}
            setfield NaF7 X_B->table[{i}] {alpha + beta}

                
            v = v + dv

        end // end of for (i = 0; i <= ({tab_divs}); i = i + 1)
            
        setfield NaF7 X_A->calc_mode 1 X_B->calc_mode 1
                    
        // Creating table for gate h, using name Y for it here

        float dv = ({v_max} - {v_min})/{tab_divs}
            
        call NaF7 TABCREATE Y {tab_divs} {v_min} {v_max}
                
        v = {v_min}

            

        for (i = 0; i <= ({tab_divs}); i = i + 1)
            
            // tau
                
            float tau
            v = v * 1000 // temporarily set v to units of equation...
            tau = 0.15 + 1.15 / { 1 + { exp {{ v + 37 } / 15} } }
            v = v * 0.001 // reset v
            
            // Set correct units of tau
            tau = tau * 0.001
            // Looking at rate: inf
                

            float inf
            v = v * 1000 // temporarily set v to units of equation...
            inf = 1 / { 1 + {exp {{ v + 62.9 } / 10.7}} }
            v = v * 0.001 // reset v
            

            // Working out the "real" alpha and beta expressions from the tau and inf
            
            float alpha
            float beta
            alpha = inf / tau   
            beta = (1- inf)/tau
            
            
            setfield NaF7 Y_A->table[{i}] {alpha}
            setfield NaF7 Y_B->table[{i}] {alpha + beta}

                
            v = v + dv

        end // end of for (i = 0; i <= ({tab_divs}); i = i + 1)
            
        setfield NaF7 Y_A->calc_mode 1 Y_B->calc_mode 1
                    


end

//========================================================================
//        Tabchannel gNa-persistent (non-inactivating), gNa(P) 2005/03
//========================================================================
function make_NaP7
        if ({exists NaP7})
            return
        end
        
        create tabchannel NaP7
            

        setfield NaP7 \ 
            Ek              0.05 \
            Ik              0  \
            Xpower          1
        
        setfield NaP7 \
            Gbar 1 \
            Gk              0 

        float tab_divs = 741
        float v_min = -0.12

        float v_max = 0.06

        float v, dv, i
            
        // Creating table for gate m, using name X for it here

        float dv = ({v_max} - {v_min})/{tab_divs}
            
        call NaP7 TABCREATE X {tab_divs} {v_min} {v_max}
                
        v = {v_min}

            

        for (i = 0; i <= ({tab_divs}); i = i + 1)
            
            // tau

            float tau
            v = v * 1000 // temporarily set v to units of equation...
            if (v < -40 )
                tau =  0.025 + 0.14 * {exp {{ v + 40 }/10}} 
            else
                tau =  0.02 + 0.145 * {exp {-1 * {v + 40}/ 10}}
            end
            v = v * 0.001 // reset v
            
            // Set correct units of tau
            tau = tau * 0.001
            // inf
            float inf
            float A, B, Vhalf
                             
            inf = 1 / ( {exp {(v +0.048) / -0.01}} + 1)

            // alpha & beta 
            
            float alpha
            float beta
            alpha = inf / tau   
            beta = (1- inf)/tau
            
            setfield NaP7 X_A->table[{i}] {alpha}
            setfield NaP7 X_B->table[{i}] {alpha + beta}
            v = v + dv

        end // end of for (i = 0; i <= ({tab_divs}); i = i + 1)
            
        setfield NaP7 X_A->calc_mode 1 X_B->calc_mode 1
                    


end

//========================================================================
//        Tabchannel Anomalous Rectifier, gAR 2005/03
//========================================================================
function make_AR7
        if ({exists AR7})
            return
        end
        
        create tabchannel AR7
            

        setfield AR7 \ 
            Ek              -0.035 \
            Ik              0  \
            Xpower          1
        
        setfield AR7 \
            Gbar 2.5 \
            Gk              0 

        float tab_divs = 741
        float v_min = -0.12

        float v_max = 0.06

        float v, dv, i
            
        // Creating table for gate m, using name X for it here

        float dv = ({v_max} - {v_min})/{tab_divs}
            
        call AR7 TABCREATE X {tab_divs} {v_min} {v_max}
                
        v = {v_min}

            

        for (i = 0; i <= ({tab_divs}); i = i + 1)
            
            // tau
            float tau
            v = v * 1000 // temporarily set v to units of equation...
            tau = 1 /{{exp {-14.6 - {0.086 * v} }} + {exp {-1.87 + {0.07 * v}}}}
            v = v * 0.001 // reset v
            
            // correct units of tau
            tau = tau * 0.001

            // inf

            float inf
            inf = 1 / ( {exp {(v + 0.075) / 0.0055}} + 1)
        
            // alpha &beta 
            
            float alpha
            float beta
            alpha = inf / tau   
            beta = (1- inf)/tau

            setfield AR7 X_A->table[{i}] {alpha}
            setfield AR7 X_B->table[{i}] {alpha + beta}
            v = v + dv

        end // end of for (i = 0; i <= ({tab_divs}); i = i + 1)
            
        setfield AR7 X_A->calc_mode 1 X_B->calc_mode 1
end

//========================================================================
//                Tabchannel gK-delayed rectifier, gK(DR) 2005/03
//========================================================================
function make_KDR7
        if ({exists KDR7})
            return
        end
        
        create tabchannel KDR7
            

        setfield KDR7 \ 
            Ek              -0.095 \
            Ik              0  \
            Xpower          4
        
        setfield KDR7 \
            Gbar 1250 \
            Gk              0 

        
        float tab_divs = 741
        float v_min = -0.12

        float v_max = 0.06

        float v, dv, i
            
        // Creating table for gate m, using name X for it here

        float dv = ({v_max} - {v_min})/{tab_divs}
            
        call KDR7 TABCREATE X {tab_divs} {v_min} {v_max}
                
        v = {v_min}

            

        for (i = 0; i <= ({tab_divs}); i = i + 1)
            
            // Looking at rate: tau
                

            float tau
            v = v * 1000 // temporarily set v to units of equation...
            if (v < -10 )
                tau =  0.25 + 4.35 * {exp {{ v + 10 }/10}} 
            else
                tau =  0.25 + 4.35 * {exp {{- v - 10}/ 10}}
            end
            v = v * 0.001 // reset v
            
            // correct units of tau
            tau = tau * 0.001
            

            // inf
            float inf
            inf = 1 / ( {exp {(v + 0.0295) / -0.01}} + 1)

            float alpha
            float beta
            alpha = inf / tau   
            beta = (1- inf)/tau
            
            
            setfield KDR7 X_A->table[{i}] {alpha}
            setfield KDR7 X_B->table[{i}] {alpha + beta}
            v = v + dv

        end // end of for (i = 0; i <= ({tab_divs}); i = i + 1)
            
        setfield KDR7 X_A->calc_mode 1 X_B->calc_mode 1
end

//========================================================================
//                Tabchannel gK-transient, gK(A) 2005/03
//========================================================================
function make_KA7
        if ({exists KA7})
            return
        end
        
        create tabchannel KA7

        setfield KA7 \ 
            Ek              -0.095 \
            Ik              0  \
            Xpower          4 \
            Ypower          1
        
        setfield KA7 \
            Gbar 300 \
            Gk              0 

        float tab_divs = 741
        float v_min = -0.12

        float v_max = 0.06

        float v, dv, i
            
        // X table for gate m

        float dv = ({v_max} - {v_min})/{tab_divs}
            
        call KA7 TABCREATE X {tab_divs} {v_min} {v_max}
                
        v = {v_min}

        for (i = 0; i <= ({tab_divs}); i = i + 1)
            
            // tau
            float tau

            v = v * 1000 // temporarily set v to units of equation...
            tau = 0.185 + 0.5 / {{exp {{ v + 35.8 }/19.7}} + {exp {{-v - 79.7}/12.7}}}
            v = v * 0.001 // reset v
            
            // correct units of tau
            tau = tau * 0.001


            // inf
            float inf
            // A = 1, B = -8.5, Vhalf = -60, in p.u. 
            // A = 1  B = -0.0085 Vhalf = -0.06 in SI
            inf = 1 / ( {exp {(v + 0.05) / -0.0085}} + 1)
        

            // alpha and beta
            float alpha
            float beta
            alpha = inf / tau   
            beta = (1- inf)/tau
            
            setfield KA7 X_A->table[{i}] {alpha}
            setfield KA7 X_B->table[{i}] {alpha + beta}
            v = v + dv

        end // end of for (i = 0; i <= ({tab_divs}); i = i + 1)
            
        setfield KA7 X_A->calc_mode 1 X_B->calc_mode 1
                    
        // Creating table for gate h, using name Y for it here

        float dv = ({v_max} - {v_min})/{tab_divs}
            
        call KA7 TABCREATE Y {tab_divs} {v_min} {v_max}
                
        v = {v_min}

        for (i = 0; i <= ({tab_divs}); i = i + 1)
            
            //  tau

            float tau
            v = v * 1000 // temporarily set v to units of equation...
            if (v < -63.0 )
                tau =  2.6 * 0.5 / {{exp {{ v + 46 }/5}} + {exp {{ -v - 238 }/37.5}}} 
            else
                tau =  2.6 * 9.5
            end
            v = v * 0.001 // reset v
            
            // correct units of tau
            tau = tau * 0.001
            // inf

            float inf
            // A = 1, B = 6, Vhalf = -78, in units: Physiological Units
            // A = 1 B = 0.006 Vhalf = -0.078
            inf = 1 / ( {exp {(v + 0.078) / 0.006}} + 1)
        
            // alpha and beta 
            float alpha
            float beta
            alpha = inf / tau   
            beta = (1- inf)/tau
            
            setfield KA7 Y_A->table[{i}] {alpha}
            setfield KA7 Y_B->table[{i}] {alpha + beta}
            v = v + dv

        end // end of for (i = 0; i <= ({tab_divs}); i = i + 1)
            
        setfield KA7 Y_A->calc_mode 1 Y_B->calc_mode 1
end


//========================================================================
//                Tabchannel gK2-slow, gK2 2005/03
//========================================================================
function make_K27
        if ({exists K27})
            return
        end
        
        create tabchannel K27
        setfield K27 \ 
            Ek              -0.095 \
            Ik              0  \
            Xpower          1 \
            Ypower          1
        
        setfield K27 \
            Gbar 1 \
            Gk              0 

        float tab_divs = 741
        float v_min = -0.12

        float v_max = 0.06

        float v, dv, i
            
        // Creating table for gate m, using name X for it here

        float dv = ({v_max} - {v_min})/{tab_divs}
            
        call K27 TABCREATE X {tab_divs} {v_min} {v_max}
                
        v = {v_min}

        for (i = 0; i <= ({tab_divs}); i = i + 1)
            
            //  tau
            float tau

            v = v * 1000 // temporarily set v to units of equation...
            tau = 4.95 + 0.5 / { {exp { {v - 81} / 25.6}} + {exp { {- v - 132} / 18 }}}
            v = v * 0.001 // reset v
            
            // correct units of tau
            tau = tau * 0.001
          
            //  inf
            float inf
                
            // A = 1, B = -17, Vhalf = -10, in p.u. 
            // A = 1  B = -0.017 Vhalf = -0.01 in SI

            inf = 1 / ( {exp {(v + 0.01) / -0.017}} + 1)

            // alpha and beta
            
            float alpha
            float beta
            alpha = inf / tau   
            beta = (1- inf)/tau
            
            setfield K27 X_A->table[{i}] {alpha}
            setfield K27 X_B->table[{i}] {alpha + beta}
                
            v = v + dv
        end // end of for (i = 0; i <= ({tab_divs}); i = i + 1)
            
        setfield K27 X_A->calc_mode 1 X_B->calc_mode 1
                    
        // Creating table for gate h, using name Y for it here

        float dv = ({v_max} - {v_min})/{tab_divs}
            
        call K27 TABCREATE Y {tab_divs} {v_min} {v_max}
                
        v = {v_min}

            

        for (i = 0; i <= ({tab_divs}); i = i + 1)
            
            // tau
            float tau
            v = v * 1000 // temporarily set v to units of equation...
            tau = 60 + 0.5 / {{exp {{ v - 1.33 }/200}} + {exp {{- v - 130}/ 7.1}}}
            v = v * 0.001 // reset v
            
            // correct units of tau
            tau = tau * 0.001

            // inf
            float inf
            // A = 1, B = 10.6, Vhalf = -58, in p.u.
            // A = 1  B = 0.0106  Vhalf = -0.058 in SI
            inf = 1 / ( {exp {(v + 0.058 ) / 0.0106}} + 1)
        
            // alpha and beta
            
            float alpha
            float beta
            alpha = inf / tau   
            beta = (1- inf)/tau
            
            setfield K27 Y_A->table[{i}] {alpha}
            setfield K27 Y_B->table[{i}] {alpha + beta}
                
            v = v + dv

        end // end of for (i = 0; i <= ({tab_divs}); i = i + 1)
            
        setfield K27 Y_A->calc_mode 1 Y_B->calc_mode 1
end

//========================================================================
//           Tabchannel gK-muscarinic receptor supressed, gK(M) 2005/03
//========================================================================
function make_KM7
        if ({exists KM7})
            return
        end
        
        create tabchannel KM7
        setfield KM7 \ 
            Ek              -0.095 \
            Ik              0  \
            Xpower          1
        
        setfield KM7 \
            Gbar 75 \
            Gk              0 

        float tab_divs = 741
        float v_min = -0.12

        float v_max = 0.06

        float v, dv, i
            
        // X table for gate m

        float dv = ({v_max} - {v_min})/{tab_divs}
            
        call KM7 TABCREATE X {tab_divs} {v_min} {v_max}
                
        v = {v_min}

        for (i = 0; i <= ({tab_divs}); i = i + 1)
            
            // alpha
            float alpha
            // A = 0.02, B = -5, Vhalf = -20, in p.u.
            // A = 20 B = -0.005 Vhalf = -0.02 in SI

            alpha = 20 / ( {exp {(v + 0.02) / -0.005}} + 1)
        
            // beta
                

            float beta
                
            // A = 0.01, B = -18,   Vhalf = -43, in p.u.
            // A = 10    B = -0.018 Vhalf = -0.043 in SI
            beta = 10 * {exp {(v + 0.043) / -0.018}}
        
            //  tables

            float tau = 1/(alpha + beta)
            
            setfield KM7 X_A->table[{i}] {alpha}
            setfield KM7 X_B->table[{i}] {alpha + beta}
                    
            v = v + dv

        end // end of for (i = 0; i <= ({tab_divs}); i = i + 1)
            
        setfield KM7 X_A->calc_mode 1 X_B->calc_mode 1
end

//========================================================================
//          Tabchannel gCa(L)-low threshold, transient, gCa(L) 2005/03
//========================================================================
function make_CaL7
        if ({exists CaL7})
            return
        end
        
        create tabchannel CaL7
            

        setfield CaL7 \ 
            Ek              0.125 \
            Ik              0  \
            Xpower          2 \
            Ypower          1
        
        setfield CaL7 \
            Gbar 1 \
            Gk              0 

        float tab_divs = 741
        float v_min = -0.12

        float v_max = 0.06

        float v, dv, i
            
        // Creating table for gate m, using name X for it here

        float dv = ({v_max} - {v_min})/{tab_divs}
            
        call CaL7 TABCREATE X {tab_divs} {v_min} {v_max}
                
        v = {v_min}

        for (i = 0; i <= ({tab_divs}); i = i + 1)
            
            // tau
            float tau
            v = v * 1000 // temporarily set v to units of equation...
            tau = 0.204 + 0.333 / { {exp {{15.8 + v} / 18.2 }} + {exp {{- v - 131} / 16.7}} }
            v = v * 0.001 // reset v
            
            // correct units of tau
            tau = tau * 0.001
          
            // inf
            float inf
            // A = 1, B = -6.2, Vhalf = -56.0, in physiological unit
            inf = 1 / ( {exp {(v + 0.056) / -0.0062}} + 1)
        
            // alpha and beta 
            
            float alpha
            float beta
            alpha = inf / tau   
            beta = (1- inf)/tau
            
            
            setfield CaL7 X_A->table[{i}] {alpha}
            setfield CaL7 X_B->table[{i}] {alpha + beta}
            v = v + dv

        end // end of for (i = 0; i <= ({tab_divs}); i = i + 1)
            
        setfield CaL7 X_A->calc_mode 1 X_B->calc_mode 1
                    
        // Creating table for gate h, using name Y for it here

        float dv = ({v_max} - {v_min})/{tab_divs}
            
        call CaL7 TABCREATE Y {tab_divs} {v_min} {v_max}
                
        v = {v_min}

        for (i = 0; i <= ({tab_divs}); i = i + 1)
            
            // tau
            float tau
                        
            v = v * 1000 // temporarily set v to units of equation...
            if (v < -81.0 )
                tau =  0.333 * {exp {{ v + 466 } / 66.6}} 
            else
                tau =  9.32 + 0.333 * {exp {{ - v - 21 } / 10.5}}
            end
            v = v * 0.001 // reset v
            
            // correct units of tau
            tau = tau * 0.001

            // inf
            float inf
            // A = 1, B = 4, Vhalf = -80, in units: Physiological Units
            inf = 1 / ( {exp {(v + 0.08) / 0.004}} + 1)

            // alpha and beta
            float alpha
            float beta
            alpha = inf / tau   
            beta = (1- inf)/tau
            
            
            setfield CaL7 Y_A->table[{i}] {alpha}
            setfield CaL7 Y_B->table[{i}] {alpha + beta}
            v = v + dv

        end // end of for (i = 0; i <= ({tab_divs}); i = i + 1)
            
        setfield CaL7 Y_A->calc_mode 1 Y_B->calc_mode 1
end

//==========================================================================
//            Tabchannel gCaH-high threshold calcium, gCa(L) "long" 2003/05
//==========================================================================
function make_CaH7
        if ({exists CaH7})
            return
        end
        
        create tabchannel CaH7
            

        setfield CaH7 \ 
            Ek              0.125 \
            Ik              0  \
            Xpower          2
        
        setfield CaH7 \
            Gbar 5 \
            Gk              0 

        float tab_divs = 741
        float v_min = -0.12

        float v_max = 0.06

        float v, dv, i
            
        // Creating table for gate m, using name X for it here

        float dv = ({v_max} - {v_min})/{tab_divs}
            
        call CaH7 TABCREATE X {tab_divs} {v_min} {v_max}
                
        v = {v_min}

            

        for (i = 0; i <= ({tab_divs}); i = i + 1)
            
            // Looking at rate: alpha
                

            float alpha

            // A = 1.6, B = -13.888889, Vhalf = 5, in physiological units
            alpha = 1600 / ( {exp {(v - 0.005) / -0.013888889000000001}} + 1)
        
            // beta
                

            float beta
            // A = 0.1, B = -5, Vhalf = -8.9, in units: Physiological Units
            if ( {abs {(v + 0.0089) / -0.005}} < 1e-6)
                beta = 100 * (1 + (v +0.0089)/-0.005/2)
            else
                beta = 100 * ((v + 0.0089) / -0.005) /(1 - {exp {-1 * (v + 0.0089)/ -0.005}})
            end

            // alpha and beta 

            float tau = 1/(alpha + beta)
            
            setfield CaH7 X_A->table[{i}] {alpha}
            setfield CaH7 X_B->table[{i}] {alpha + beta}
                    
            v = v + dv

        end // end of for (i = 0; i <= ({tab_divs}); i = i + 1)
            
        setfield CaH7 X_A->calc_mode 1 X_B->calc_mode 1
end

//========================================================================
//             Ca conc, Traub et al. J Neurophysiol 2003;89:909-921.
//========================================================================
/****************************************************************************
Next, we need an element to take the Calcium current calculated by the Ca
channel and convert it to the Ca concentration.  The "Ca_concen" object
solves the equation dC/dt = B*I_Ca - C/tau, and sets Ca = Ca_base + C.  As
it is easy to make mistakes in units when using this Calcium diffusion
equation, the units used here merit some discussion.

With Ca_base = 0, this corresponds to Traub's diffusion equation for
concentration, except that the sign of the current term here is positive, as
GENESIS uses the convention that I_Ca is the current flowing INTO the
compartment through the channel.  In SI units, the concentration is usually
expressed in moles/m^3 (which equals millimoles/liter), and the units of B
are chosen so that B = 1/(ion_charge * Faraday * volume). Current is
expressed in amperes and one Faraday = 96487 coulombs.  However, in this
case, Traub expresses the concentration in arbitrary units, current in
microamps and uses tau = 13.33 msec (50 msec soma, 20 msec dendrites in the
2003 J Neurophys paper).  If we use the same concentration units,
but express current in amperes and tau in seconds, our B constant is then
10^12 times the constant (called "phi") used in the paper.  The actual value
used will typically be determined by the cell reader from the cell
parameter file (will vary inversely with surface area of compartment).  
However, for the prototype channel we will use Traub's
corrected value for the soma.  (An error in the paper gives it as 17,402
rather than 17.402.)  In our units, this will be 17.402e12.

****************************************************************************/
function make_Ca_s7
        if ({exists Ca_s7})
            return
        end
        create Ca_concen Ca_s7
        // params for a pool model in soma
        setfield Ca_s7 \
            tau                   { 1.0 / 10 }    \
            Ca_base               0

        addfield Ca_s7 addmsg1
        setfield Ca_s7 \
                addmsg1        "../CaH7 . I_Ca Ik"
        addfield Ca_s7 addmsg2
        setfield Ca_s7 \
                addmsg2        "../CaL7 . I_Ca Ik"
end
/*
This Ca_concen element should receive an "I_Ca" message from the calcium
channel, accompanied by the value of the calcium channel current.  As we
will ordinarily use the cell reader to create copies of these prototype
elements in one or more compartments, we need some way to be sure that the
needed messages are established.  Although the cell reader has enough
information to create the messages which link compartments to their channels
and to other adjacent compartments, it must be provided with the information
needed to establish additional messages.  This is done by placing the
message string in a user-defined field of one of the elements which is
involved in the message.  The cell reader recognizes the added field names
"addmsg1", "addmsg2", etc. as indicating that they are to be
evaluated and used to set up messages.  The paths are relative to the
element which contains the message string in its added field.  Thus,
"../Ca_hip_traub91" refers to the sibling element Ca_hip_traub91 and "."
refers to the Ca_hip_conc element itself.
*/

/****************************************************************************/
function make_Ca_d7
        if ({exists Ca_d7})
            return
        end
        create Ca_concen Ca_d7
        // par. for a pool model

        setfield Ca_d7 \
            tau                   { 1.0 / 75 }    \
            Ca_base               0

        addfield Ca_d7 addmsg1
        setfield Ca_d7 \
                addmsg1        "../CaH7 . I_Ca Ik"
        addfield Ca_d7 addmsg2
        setfield Ca_d7 \
                addmsg2        "../CaL7 . I_Ca Ik"
             
end


function make_Ca_db7

        if ({exists Ca_db7})
            return
        end

        create Ca_concen Ca_db7

        setfield Ca_db7 \
            tau                   { 1.0 / 20 }    \
            Ca_base               0

        addfield Ca_db7 addmsg1
        setfield Ca_db7 \
                addmsg1        "../CaH7 . I_Ca Ik"
        addfield Ca_db7 addmsg2
        setfield Ca_db7 \
                addmsg2        "../CaL7 . I_Ca Ik"
             
end


//===============================================================================
//  Ca-dependent K Channel - K(C) - (vdep_channel with table and tabgate)2005/03
//===============================================================================
/*
The expression for the conductance of the potassium C-current channel has a
typical voltage and time dependent activation gate, where the time dependence
arises from the solution of a differential equation containing the rate
parameters alpha and beta.  It is multiplied by a function of calcium
concentration that is given explicitly rather than being obtained from a
differential equation.  Therefore, we need a way to multiply the activation
by a concentration dependent value which is determined from a lookup table.
This is accomplished by using the Z gate with the new tabchannel "instant"
field, introduced in GENESIS 2.2, to implement an "instantaneous" gate for
the multiplicative Ca-dependent factor in the conductance.
*/
function make_KCs7
        if ({exists KCs7})
            return
        end
        
        create tabchannel KCs7

        setfield KCs7 \ 
            Ek              -0.095 \
            Ik              0  \
            Xpower          1 \
            Zpower          1
            
        
        setfield KCs7 \
            Gbar 120 \
            Gk              0 

        float tab_divs = 1041
        float v_min = -0.12

        float v_max = 0.14

        float v, dv, i
            
        // X table for gate m

        float dv = ({v_max} - {v_min})/{tab_divs}
            
        call KCs7 TABCREATE X {tab_divs} {v_min} {v_max}
                
        v = {v_min}
        for (i = 0; i <= ({tab_divs}); i = i + 1)
            
            // alpha
                

            float alpha
                
            v = v * 1000 // temporarily set v to units of equation...
            if (v < -10 )
                alpha =  {2 / 37.95} * { exp { {{v + 50 } / 11} - {{ v + 53.5} / 27} } } 
            else
                alpha =  2 * {exp { { {-1 * v} - 53.5 } / 27 }}
            end
            v = v * 0.001 // reset v
            
            // correct units of alpha
            alpha = alpha * 1000

            
            // beta

            float beta
            v = v * 1000 // temporarily set v to units of equation...
            
            // Equation depends on alpha, so converting it...
            alpha = alpha * 0.001

            if (v < -10 )
                beta =  2 * {exp { { {-1 * v} - 53.5 } / 27 }} - alpha 
            else
                beta =  0.0
            end
            v = v * 0.001 // reset v
            alpha = alpha * 1000  // resetting alpha
                        
            // correct units of beta
            beta = beta * 1000

            // alpha and beta to populate the tables

            float tau = 1/(alpha + beta)
            
            setfield KCs7 X_A->table[{i}] {alpha}
            setfield KCs7 X_B->table[{i}] {alpha + beta}
            v = v + dv

        end // end of for (i = 0; i <= ({tab_divs}); i = i + 1)
            
        setfield KCs7 X_A->calc_mode 1 X_B->calc_mode 1
                    
        // Adding voltage independent concentration term
        
        float conc_min = 0
        float conc_max = 1000

        float dc = ({conc_max} - {conc_min})/{tab_divs}

        float ca_conc = {conc_min}
        
        call KCs7 TABCREATE  Z {tab_divs} {conc_min} {conc_max}
        
        float const_state

        for (i = 0; i <= ({tab_divs}); i = i + 1)
                
            // Equation is in different set of units...
            ca_conc = ca_conc * 0.000001
            if (ca_conc < 0.00025 )
                const_state =  {ca_conc / 0.00025} 
            else
                const_state =  1
            end
            // Converting back...
            ca_conc = ca_conc * 1000000
            
            setfield KCs7 Z_A->table[{i}] {0}
            setfield KCs7 Z_B->table[{i}] {const_state}

            ca_conc= ca_conc + dc
        end
             
        tweaktau KCs7 Z
        
        addfield KCs7 addmsg1
        setfield KCs7 addmsg1  "../Ca_s7  . CONCEN Ca"
end


function make_KCd7
        if ({exists KCd7})
            return
        end
        create tabchannel KCd7
        setfield KCd7 \ 
            Ek              -0.095 \
            Ik              0  \
            Xpower          1 \
            Zpower          1
        setfield KCd7 \
            Gbar 120 \
            Gk              0 

        float tab_divs = 1041
        float v_min = -0.12
        float v_max = 0.14
        float v, dv, i
            
        // X table for gate m
        float dv = ({v_max} - {v_min})/{tab_divs}
        call KCd7 TABCREATE X {tab_divs} {v_min} {v_max}
        v = {v_min}
        for (i = 0; i <= ({tab_divs}); i = i + 1)
            // alpha
            float alpha
            v = v * 1000 // temporarily set v to units of equation...
            if (v < -10 )
                alpha =  {2 / 37.95} * { exp { {{v + 50 } / 11} - {{ v + 53.5} / 27} } } 
            else
                alpha =  2 * {exp { { {-1 * v} - 53.5 } / 27 }}
            end
            v = v * 0.001 // reset v
            // correct units of alpha
            alpha = alpha * 1000

            // beta
            float beta
            v = v * 1000 // temporarily set v to units of equation
            alpha = alpha * 0.001 // and set alpha to units of equation

            if (v < -10 )
                beta =  2 * {exp { { {-1 * v} - 53.5 } / 27 }} - alpha 
            else
                beta =  0.0
            end
            v = v * 0.001 // reset v
            alpha = alpha * 1000  // resetting alpha
            // correct units of beta
            beta = beta * 1000

            // alpha and beta 
            float tau = 1/(alpha + beta)
            setfield KCd7 X_A->table[{i}] {alpha}
            setfield KCd7 X_B->table[{i}] {alpha + beta}
            v = v + dv
        end // end of for (i = 0; i <= ({tab_divs}); i = i + 1)
            
        setfield KCd7 X_A->calc_mode 1 X_B->calc_mode 1
        // Adding voltage independent concentration term
        
        float conc_min = 0
        float conc_max = 1000
        float dc = ({conc_max} - {conc_min})/{tab_divs}
        float ca_conc = {conc_min}
        call KCd7 TABCREATE  Z {tab_divs} {conc_min} {conc_max}
        float const_state
        for (i = 0; i <= ({tab_divs}); i = i + 1)
                
            // Equation is in different set of units...
            ca_conc = ca_conc * 0.000001

            if (ca_conc < 0.00025 )
                const_state =  {ca_conc / 0.00025} 
            else
                const_state =  1
            end
            // Converting back...
            ca_conc = ca_conc * 1000000
            
            setfield KCd7 Z_A->table[{i}] {0}
            setfield KCd7 Z_B->table[{i}] {const_state}
            ca_conc= ca_conc + dc
        end
             
        tweaktau KCd7 Z
        addfield KCd7 addmsg1
        setfield KCd7 addmsg1  "../Ca_d7  . CONCEN Ca"
end

function make_KCdb7
        if ({exists KCdb7})
            return
        end
        create tabchannel KCdb7

        setfield KCdb7 \ 
            Ek              -0.095 \
            Ik              0  \
            Xpower          1 \
            Zpower          1
        
        setfield KCdb7 \
            Gbar 120 \
            Gk              0 
        float tab_divs = 1041
        float v_min = -0.12
        float v_max = 0.14
        float v, dv, i
            
        // X table for gate m
        float dv = ({v_max} - {v_min})/{tab_divs}
        call KCdb7 TABCREATE X {tab_divs} {v_min} {v_max}
        v = {v_min}
        for (i = 0; i <= ({tab_divs}); i = i + 1)
            //  alpha
            float alpha
            v = v * 1000 // temporarily set v to units of equation...
            if (v < -10 )
                alpha =  {2 / 37.95} * { exp { {{v + 50 } / 11} - {{ v + 53.5} / 27} } } 
            else
                alpha =  2 * {exp { { {-1 * v} - 53.5 } / 27 }}
            end
            v = v * 0.001 // reset v
            
            // correct units of alpha
            alpha = alpha * 1000
            
            //  beta
            float beta
            v = v * 1000 // temporarily set v to units of equation...
            alpha = alpha * 0.001  //and set alpha too

            if (v < -10 )
                beta =  2 * {exp { { {-1 * v} - 53.5 } / 27 }} - alpha 
            else
                beta =  0.0
            end
            v = v * 0.001 // reset v
            alpha = alpha * 1000  // resetting alpha
                        
            // correct units of beta
            beta = beta * 1000

            //  alpha and beta 
            float tau = 1/(alpha + beta)
            
            setfield KCdb7 X_A->table[{i}] {alpha}
            setfield KCdb7 X_B->table[{i}] {alpha + beta}
            v = v + dv                    

        end // end of for (i = 0; i <= ({tab_divs}); i = i + 1)

        setfield KCdb7 X_A->calc_mode 1 X_B->calc_mode 1
                    
        // now voltage independent concentration term
        
        float conc_min = 0
        float conc_max = 1000
        float dc = ({conc_max} - {conc_min})/{tab_divs}
        float ca_conc = {conc_min}
        call KCdb7 TABCREATE  Z {tab_divs} {conc_min} {conc_max}
        float const_state

        for (i = 0; i <= ({tab_divs}); i = i + 1)
                
            // Equation is in different set of units...
            ca_conc = ca_conc * 0.000001

            if (ca_conc < 0.00025 )
                const_state =  {ca_conc / 0.00025} 
            else
                const_state =  1
            end
                
            // Converting back...
            ca_conc = ca_conc * 1000000
            
            setfield KCdb7 Z_A->table[{i}] {0}
            setfield KCdb7 Z_B->table[{i}] {const_state}
            
            ca_conc= ca_conc + dc
        end
        tweaktau KCdb7 Z
        
        addfield KCdb7 addmsg1
        setfield KCdb7 addmsg1  "../Ca_db7  . CONCEN Ca"
end


//========================================================================
//             Tabulated Ca-dependent K AHP Channel,gK(AHP) 2003/05
//========================================================================

/* This is a tabchannel which gets the calcium concentration from Ca_hip_conc
   in order to calculate the activation of its Z gate.  It is set up much
   like the Ca channel, except that the A and B tables have values which are
   functions of concentration, instead of voltage.
*/
function make_KAHPs7
        if ({exists KAHPs7})
            return
        end
        create tabchannel KAHPs7
        setfield KAHPs7 \ 
            Ek              -0.095 \
            Ik              0  \
            Zpower          1
        
        setfield KAHPs7 \
            Gbar 1 \
            Gk              0 
        float tab_divs = 1041

        float c
        float conc_min = 0
        float conc_max = 1000

        float dc = ({conc_max} - {conc_min})/{tab_divs}
        float ca_conc = {conc_min}

        call KAHPs7 TABCREATE Z {tab_divs} {conc_min} {conc_max}

        for (c = 0; c <= ({tab_divs}); c = c + 1)
            //alpha
            float alpha
            float v    
            v = v * 1000 // temporarily set v to units of equation...
            ca_conc = ca_conc * 0.000001 //  set Ca conc to units of equation 

            if (ca_conc < 0.0001 )
                alpha =  ca_conc/0.01 
            else
                alpha =  0.01
            end
            v = v * 0.001 // reset v
            ca_conc = ca_conc * 1000000 // resetting ca_conc 
            
            // Set correct units of alpha
            alpha = alpha * 1000
            
            // beta
            float beta
            v = v * 1000 // temporarily set v to units of equation...
            ca_conc = ca_conc * 0.000001 //  set Ca conc to units of equation
            beta = 0.001
            v = v * 0.001 // reset v
            ca_conc = ca_conc * 1000000 // resetting ca_conc 
            
            // correct units of beta
            beta = beta * 1000

            // alpha and beta 

            float tau = 1/(alpha + beta)
            
            setfield KAHPs7 Z_A->table[{c}] {alpha}
            setfield KAHPs7 Z_B->table[{c}] {alpha + beta}
                    ca_conc = ca_conc + dc
                
        end // end of for (c = 0; c <= ({tab_divs}); c = c + 1)
        setfield KAHPs7 Z_conc 1
        setfield KAHPs7 Z_A->calc_mode 1 Z_B->calc_mode 1

        addfield KAHPs7 addmsg1
        setfield KAHPs7  \
                addmsg1        "../Ca_s7 . CONCEN Ca"
end


function make_KAHPd7
        if ({exists KAHPd7})
            return
        end
        create tabchannel KAHPd7
        setfield KAHPd7 \ 
            Ek              -0.095 \
            Ik              0  \
            Zpower          1
        
        setfield KAHPd7 \
            Gbar 1 \
            Gk              0 
        float tab_divs = 1041

        float c
        float conc_min = 0
        float conc_max = 1000
        float dc = ({conc_max} - {conc_min})/{tab_divs}
        float ca_conc = {conc_min}

        call KAHPd7 TABCREATE Z {tab_divs} {conc_min} {conc_max}

        for (c = 0; c <= ({tab_divs}); c = c + 1)
                    
            // alpha
            float alpha
            float v    
                        
            v = v * 1000 // temporarily set v to units of equation...
            ca_conc = ca_conc * 0.000001 // set ca_conc to  units of equation...
            if (ca_conc < 0.0001 )
                alpha =  ca_conc/0.01 
            else
                alpha =  0.01
            end
            v = v * 0.001 // reset v
            ca_conc = ca_conc * 1000000 // resetting ca_conc 
            
            // Set correct units of alpha
            alpha = alpha * 1000
            
            // beta

            float beta
            v = v * 1000 // temporarily set v to units of equation...
            ca_conc = ca_conc * 0.000001 // set ca_conc to  units of equation...
            beta = 0.001
            v = v * 0.001 // reset v
            ca_conc = ca_conc * 1000000 // resetting ca_conc 
            
            // correct units of beta
            beta = beta * 1000

            //alpha & beata

            float tau = 1/(alpha + beta)
            
            setfield KAHPd7 Z_A->table[{c}] {alpha}
            setfield KAHPd7 Z_B->table[{c}] {alpha + beta}
                    ca_conc = ca_conc + dc
                
        end // end of for (c = 0; c <= ({tab_divs}); c = c + 1)
                
        setfield KAHPd7 Z_conc 1
        setfield KAHPd7 Z_A->calc_mode 1 Z_B->calc_mode 1

        addfield KAHPd7 addmsg1
        setfield KAHPd7  \
                addmsg1        "../Ca_d7 . CONCEN Ca"
end


function make_KAHPdb7
        if ({exists KAHPdb7})
            return
        end
        create tabchannel KAHPdb7
        setfield KAHPdb7 \ 
            Ek              -0.095 \
            Ik              0  \
            Zpower          1
        
        setfield KAHPdb7 \
            Gbar 1 \
            Gk              0 

        float tab_divs = 1041
        float c
        float conc_min = 0
        float conc_max = 1000

        float dc = ({conc_max} - {conc_min})/{tab_divs}
        float ca_conc = {conc_min}
            
        call KAHPdb7 TABCREATE Z {tab_divs} {conc_min} {conc_max}
            
        for (c = 0; c <= ({tab_divs}); c = c + 1)
            //  alpha
            float alpha
            float v    
                        
            v = v * 1000 // temporarily set v to units of equation...
            ca_conc = ca_conc * 0.000001 //set ca_conc to units of equation...
            if (ca_conc < 0.0001 )
                alpha =  ca_conc/0.01 
            else
                alpha =  0.01
            end
            v = v * 0.001 // reset v
            ca_conc = ca_conc * 1000000 // resetting ca_conc 
            
            // correct units of alpha
            alpha = alpha * 1000

            
            //  beta
            float beta

            v = v * 1000 // temporarily set v to units of equation...
            ca_conc = ca_conc * 0.000001 //set ca_cnonc to to units of equation...
            beta = 0.001
            v = v * 0.001 // reset v
            ca_conc = ca_conc * 1000000 // resetting ca_conc 
            
            // correct units of beta
            beta = beta * 1000

            // alpha and beta
            float tau = 1/(alpha + beta)
            
            setfield KAHPdb7 Z_A->table[{c}] {alpha}
            setfield KAHPdb7 Z_B->table[{c}] {alpha + beta}
                    ca_conc = ca_conc + dc
                
        end // end of for (c = 0; c <= ({tab_divs}); c = c + 1)
                
        setfield KAHPdb7 Z_conc 1
        setfield KAHPdb7 Z_A->calc_mode 1 Z_B->calc_mode 1

        addfield KAHPdb7 addmsg1
        setfield KAHPdb7  \
                addmsg1        "../Ca_db7 . CONCEN Ca"
end
