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
float EREST_ACT = -0.060 /* hippocampal cell resting potl */
float ENAP5RSa = 0.115 + EREST_ACT // 0.055
float EKP5RSa = -0.015 + EREST_ACT // -0.075
float ECAP5RSa = 0.140 + EREST_ACT // 0.080
float EARP5RSa = 0.025 + EREST_ACT // -0.035
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
function make_NaF23
        str chanpath = "NaF23"
        if ({exists NaF23})
            return
        end
        create tabchannel NaF23
        setfield NaF23 \ 
            Ek              0.05 \
            Ik              0  \
            Xpower          3 \
            Ypower          1
        
        setfield NaF23 \
            Gbar 1875 \
            Gk              0 

        float tab_divs = 741
        float v_min = -0.12
        float v_max = 0.06
        float v, dv, i
            
        // X table for gate m
        float dv = ({v_max} - {v_min})/{tab_divs}
        call NaF23 TABCREATE X {tab_divs} {v_min} {v_max}
        v = {v_min}

        for (i = 0; i <= ({tab_divs}); i = i + 1)
            
            // tau
            float tau
                        
            v = v * 1000 // temporarily set v to units of equation...
            if (v  < -26.5 )
                tau =  0.025 + 0.14 * { exp { {v + 26.5} / 10} } 
            else
                tau =  0.02 + 0.145 * { exp { -1 * {v + 26.5} / 10.0} }
            end
            v = v * 0.001 // reset v
            
            // correct units of tau
            tau = tau * 0.001


            // inf
            float inf

            v = v * 1000 // temporarily set v to units of equation...
            inf =  1 / { 1 + {exp { { -v - 34.5} / 10}} } 
            v = v * 0.001 // reset v
            
            // alpha and beta
            
            float alpha
            float beta
            alpha = inf / tau   
            beta = (1- inf)/tau
            setfield NaF23 X_A->table[{i}] {alpha}
            setfield NaF23 X_B->table[{i}] {alpha + beta}
            v = v + dv

        end // end of for (i = 0; i <= ({tab_divs}); i = i + 1)
            
        setfield NaF23 X_A->calc_mode 1 X_B->calc_mode 1
                    
        // Y table for gate h

        float dv = ({v_max} - {v_min})/{tab_divs}
        call NaF23 TABCREATE Y {tab_divs} {v_min} {v_max}
        v = {v_min}
        for (i = 0; i <= ({tab_divs}); i = i + 1)
            
            // tau
            float tau
                        
            v = v * 1000 // v to units of equation...
            tau = 0.15 + 1.15 / { 1 + { exp {{ v + 37 } / 15} } }
            v = v * 0.001 // reset v
            
            // correct units of tau
            tau = tau * 0.001

            // inf
            float inf
                
            v = v * 1000 // v to units of equation...
            inf = 1 / { 1 + {exp {{ v + 62.9 } / 10.7}} }
            v = v * 0.001 // reset v
            

            // alpha and beta 
            float alpha
            float beta
            alpha = inf / tau   
            beta = (1- inf)/tau
            setfield NaF23 Y_A->table[{i}] {alpha}
            setfield NaF23 Y_B->table[{i}] {alpha + beta}
            v = v + dv
        end // end of for (i = 0; i <= ({tab_divs}); i = i + 1)
        setfield NaF23 Y_A->calc_mode 1 Y_B->calc_mode 1
end

//========================================================================
//        Tabchannel gNa-persistent (non-inactivating), gNa(P) 2005/03
//========================================================================
function make_NaP23
        str chanpath = "NaP23"

        if ({exists {chanpath}})
            return
        end
        create tabchannel {chanpath}
        setfield {chanpath} \ 
            Ek              0.05 \
            Ik              0  \
            Xpower          1
        
        setfield {chanpath} \
            Gbar 1 \
            Gk              0 

        float tab_divs = 741
        float v_min = -0.12
        float v_max = 0.06
        float v, dv, i
            
        // X table for gate m
        float dv = ({v_max} - {v_min})/{tab_divs}
        call {chanpath} TABCREATE X {tab_divs} {v_min} {v_max}
        v = {v_min}

        for (i = 0; i <= ({tab_divs}); i = i + 1)
            
            // tau
            float tau

            v = v * 1000 // v to units of equation
            if (v < -40 )
                tau =  0.025 + 0.14 * {exp {{ v + 40 }/10}} 
            else
                tau =  0.02 + 0.145 * {exp {-1 * {v + 40}/ 10}}
            end
            v = v * 0.001 // reset v
            
            // correct units of tau
            tau = tau * 0.001

            // inf
            float inf
                
            // A = 1, B = -10, Vhalf = -48, in physiol units
            // A = 1, B = -0.01, Vhalf = -0.048

            inf = 1 / ( {exp {(v + 0.048) / -0.01}} + 1)

            //alpha and beta 
            float alpha
            float beta
            alpha = inf / tau   
            beta = (1- inf)/tau
            
            setfield {chanpath} X_A->table[{i}] {alpha}
            setfield {chanpath} X_B->table[{i}] {alpha + beta}
            v = v + dv

        end // end of for (i = 0; i <= ({tab_divs}); i = i + 1)
        setfield {chanpath} X_A->calc_mode 1 X_B->calc_mode 1
end

//========================================================================
//        Tabchannel Anomalous Rectifier, gAR 2005/03
//========================================================================
function make_AR23
        if ({exists AR23})
            return
        end
        create tabchannel AR23
        setfield AR23 \ 
            Ek              -0.035 \
            Ik              0  \
            Xpower          1
        
        setfield AR23 \
            Gbar 2.5 \
            Gk              0 
        
        float tab_divs = 741
        float v_min = -0.12

        float v_max = 0.06

        float v, dv, i
            
        // X table for gate m

        float dv = ({v_max} - {v_min})/{tab_divs}
            
        call AR23 TABCREATE X {tab_divs} {v_min} {v_max}
                
        v = {v_min}

        for (i = 0; i <= ({tab_divs}); i = i + 1)
            
            // tau
            float tau
            v = v * 1000 // temporarily set v to units of equation...
            tau = 1 /{{exp {-14.6 - {0.086 * v} }} + {exp {-1.87 + {0.07 * v}}}}
            v = v * 0.001 // reset v
            // Set correct units of tau
            tau = tau * 0.001
            // Looking at rate: inf

            float inf
            // A = 1, B = 5.5, Vhalf = -75, in physiol. units
            inf = 1 / ( {exp {(v + 0.075) / 0.0055}} + 1)

            // alpha and beta 
            float alpha
            float beta
            alpha = inf / tau   
            beta = (1- inf)/tau
            
            setfield AR23 X_A->table[{i}] {alpha}
            setfield AR23 X_B->table[{i}] {alpha + beta}
            v = v + dv

        end // end of for (i = 0; i <= ({tab_divs}); i = i + 1)
            
        setfield AR23 X_A->calc_mode 1 X_B->calc_mode 1
end

//========================================================================
//                Tabchannel gK-delayed rectifier, gK(DR) 2005/03
//========================================================================
function make_KDR23
        str chanpath = "KDR23"
        if ({exists KDR23})
            return
        end
        create tabchannel KDR23
        setfield KDR23 \ 
            Ek              -0.095 \
            Ik              0  \
            Xpower          4
        
        setfield KDR23 \
            Gbar 1250 \
            Gk              0 

        float tab_divs = 741
        float v_min = -0.12

        float v_max = 0.06

        float v, dv, i
            
        // Creating table for gate m, using name X for it here

        float dv = ({v_max} - {v_min})/{tab_divs}
            
        call KDR23 TABCREATE X {tab_divs} {v_min} {v_max}
                
        v = {v_min}

            

        for (i = 0; i <= ({tab_divs}); i = i + 1)
            
            // Looking at rate: tau
                

            float tau
                
                        
            // Found a generic form of rate equation for tau, using expression: v < -10 ? 0.25 + 4.35 * (exp (( v + 10 )/10)) : 0.25 + 4.35 * (exp ((- v - 10)/ 10))
            // Will translate this for GENESIS compatibility...
                    
            // Equation (and all ChannelML file values) in Physiological Units but this script in SI Units
            

            v = v * 1000 // temporarily set v to units of equation...
            

            if (v < -10 )
                tau =  0.25 + 4.35 * {exp {{ v + 10 }/10}} 
            else
                tau =  0.25 + 4.35 * {exp {{- v - 10}/ 10}}
            end
        
            
            v = v * 0.001 // reset v
            
            // Set correct units of tau
            tau = tau * 0.001

            // inf
            float inf
            // A = 1, B = -10, Vhalf = -29.5, in physiol. units
            // A = 1, B = -0.01, Vhalf = -0.0295
            inf = 1 / ( {exp {(v + 0.0295) / -0.01}} + 1)
            
            // alpha and beta 
            float alpha
            float beta
            alpha = inf / tau   
            beta = (1- inf)/tau
            
            setfield KDR23 X_A->table[{i}] {alpha}
            setfield KDR23 X_B->table[{i}] {alpha + beta}
            v = v + dv

        end // end of for (i = 0; i <= ({tab_divs}); i = i + 1)
            
        setfield KDR23 X_A->calc_mode 1 X_B->calc_mode 1
end

//========================================================================
//                Tabchannel gK-transient, gK(A) 2005/03
//========================================================================
function make_KA23
        if ({exists KA23})
            return
        end
        create tabchannel KA23
        setfield KA23 \ 
            Ek              -0.095 \
            Ik              0  \
            Xpower          4 \
            Ypower          1
        setfield KA23 \
            Gbar 300 \
            Gk              0 

        float tab_divs = 741
        float v_min = -0.12
        float v_max = 0.06
        float v, dv, i
            
        // X table for gate m
        float dv = ({v_max} - {v_min})/{tab_divs}
        call KA23 TABCREATE X {tab_divs} {v_min} {v_max}
        v = {v_min}
        for (i = 0; i <= ({tab_divs}); i = i + 1)
            
            // tau
            float tau

            v = v * 1000 // v to units of equation...
            tau = 0.185 + 0.5 / {{exp {{ v + 35.8 }/19.7}} + {exp {{-v - 79.7}/12.7}}}
            v = v * 0.001 // reset v
            
            // correct units of tau
            tau = tau * 0.001

            // inf
            float inf
                
            // A = 1, B = -8.5, Vhalf = -60, in p. units
            // A = 1, B = -0.0085, Vhalf = -0.06
            inf = 1 / ( {exp {(v + 0.06) / -0.0085}} + 1)
        
            // alpha and beta
            
            float alpha
            float beta
            alpha = inf / tau   
            beta = (1- inf)/tau
            
            setfield KA23 X_A->table[{i}] {alpha}
            setfield KA23 X_B->table[{i}] {alpha + beta}
            v = v + dv
        end // end of for (i = 0; i <= ({tab_divs}); i = i + 1)
            
        setfield KA23 X_A->calc_mode 1 X_B->calc_mode 1
                    
        // Creating table for gate h, using name Y for it here
        float dv = ({v_max} - {v_min})/{tab_divs}
        call KA23 TABCREATE Y {tab_divs} {v_min} {v_max}
        v = {v_min}

        for (i = 0; i <= ({tab_divs}); i = i + 1)
            
            // tau
            float tau
                
            v = v * 1000 // temporarily set v to units of equation...
            if (v < -63.0 )
                tau =  0.5 / {{exp {{ v + 46 }/5}} + {exp {{ -v - 238 }/37.5}}} 
            else
                tau =  9.5
            end
            v = v * 0.001 // reset v
            
            // correct units of tau
            tau = tau * 0.001

            // inf
            float inf

            // A = 1, B = 6, Vhalf = -78, in units: Physiological Units
            // A = 1, B = 0.006, Vhalf = -0.078
            inf = 1 / ( {exp {(v + 0.078) / 0.006}} + 1)

            // alpha and beta 
            float alpha
            float beta
            alpha = inf / tau   
            beta = (1- inf)/tau
            
            setfield KA23 Y_A->table[{i}] {alpha}
            setfield KA23 Y_B->table[{i}] {alpha + beta}
            v = v + dv

        end // end of for (i = 0; i <= ({tab_divs}); i = i + 1)
        setfield KA23 Y_A->calc_mode 1 Y_B->calc_mode 1
end

//========================================================================
//                Tabchannel gK2-slow, gK2 2005/03
//========================================================================
function make_K223
        if ({exists K223})
            return
        end
        create tabchannel K223
        setfield K223 \ 
            Ek              -0.095 \
            Ik              0  \
            Xpower          1 \
            Ypower          1
        
        setfield K223 \
            Gbar 1 \
            Gk              0 

        float tab_divs = 741
        float v_min = -0.12
        float v_max = 0.06
        float v, dv, i
        //X table for gate m
        float dv = ({v_max} - {v_min})/{tab_divs}
        call K223 TABCREATE X {tab_divs} {v_min} {v_max}
        v = {v_min}
        for (i = 0; i <= ({tab_divs}); i = i + 1)

            // tau
            float tau

            v = v * 1000 // V to units of equation
            tau = 4.95 + 0.5 / { {exp { {v - 81} / 25.6}} + {exp { {- v - 132} / 18 }}}
            v = v * 0.001 // reset v
            
            // tau correct units
            tau = tau * 0.001

            // inf
            float inf

            // A = 1, B = -17, Vhalf = -10, in p. units
            // A = 1, B = -0.017, Vhalf = -0.01

            inf = 1 / ( {exp {(v + 0.01) / -0.017}} + 1)
        
            // alpha and beta
            
            float alpha
            float beta
            alpha = inf / tau   
            beta = (1- inf)/tau
            
            setfield K223 X_A->table[{i}] {alpha}
            setfield K223 X_B->table[{i}] {alpha + beta}
            v = v + dv
        end // end of for (i = 0; i <= ({tab_divs}); i = i + 1)
            
        setfield K223 X_A->calc_mode 1 X_B->calc_mode 1
                    
        // Y table for gate h

        float dv = ({v_max} - {v_min})/{tab_divs}
            
        call K223 TABCREATE Y {tab_divs} {v_min} {v_max}
                
        v = {v_min}
        for (i = 0; i <= ({tab_divs}); i = i + 1)
            
            // tau
            float tau
            v = v * 1000 // V to units of equation
            tau = 60 + 0.5 / {{exp {{ v - 1.33 }/200}} + {exp {{- v - 130}/ 7.1}}}
            v = v * 0.001 // reset v
            
            // correct units of tau
            tau = tau * 0.001

            // inf
            float inf
            // A = 1, B = 10.6, Vhalf = -58, in units: Physiological Units
            // A = 1, B = 0.0106, Vhalf = -0.058
            inf = 1 / ( {exp {(v + 0.058) / 0.0106}} + 1)
            
            // alpha and beta 
            float alpha
            float beta
            alpha = inf / tau   
            beta = (1- inf)/tau
            
            setfield K223 Y_A->table[{i}] {alpha}
            setfield K223 Y_B->table[{i}] {alpha + beta}
            v = v + dv

        end // end of for (i = 0; i <= ({tab_divs}); i = i + 1)
        setfield K223 Y_A->calc_mode 1 Y_B->calc_mode 1
end

//========================================================================
//           Tabchannel gK-muscarinic receptor supressed, gK(M) 2005/03
//========================================================================
function make_KM23
        if ({exists KM23})
            return
        end
        create tabchannel KM23
        setfield KM23 \ 
            Ek              -0.095 \
            Ik              0  \
            Xpower          1
        
        setfield KM23 \
            Gbar 75 \
            Gk              0 

        float tab_divs = 741
        float v_min = -0.12
        float v_max = 0.06
        float v, dv, i
            
        // X table for gate m
        float dv = ({v_max} - {v_min})/{tab_divs}
        call KM23 TABCREATE X {tab_divs} {v_min} {v_max}
        v = {v_min}

        for (i = 0; i <= ({tab_divs}); i = i + 1)
            
            // alpha
            float alpha

            // A = 0.02, B = -5, Vhalf = -20, in units: Physiological Units
            // A = 20, B = -0.005, Vhalf = -0.02

            alpha = 20 / ( {exp {(v + 0.02) / -0.005}} + 1)
        
            //  beta
                

            float beta
            // A = 0.01, B = -18, Vhalf = -43, in physiol. units
            // A = 10, B = -0.018, Vhalf = -0.043

            beta = 10 * {exp {(v + 0.043) / -0.018}}

            // alpha and beta
            float tau = 1/(alpha + beta)
            
            setfield KM23 X_A->table[{i}] {alpha}
            setfield KM23 X_B->table[{i}] {alpha + beta}
            v = v + dv

        end // end of for (i = 0; i <= ({tab_divs}); i = i + 1)
            
        setfield KM23 X_A->calc_mode 1 X_B->calc_mode 1
end

//========================================================================
//          Tabchannel gCa(L)-low threshold, transient, gCa(L) 2005/03
//========================================================================

function make_CaL23
        if ({exists CaL23})
            return
        end
        create tabchannel CaL23
        setfield CaL23 \ 
            Ek              0.125 \
            Ik              0  \
            Xpower          2 \
            Ypower          1
        
        setfield CaL23 \
            Gbar 1 \
            Gk              0 
        
        float tab_divs = 741
        float v_min = -0.12
        float v_max = 0.06
        float v, dv, i
            
        // X table for gate m
        float dv = ({v_max} - {v_min})/{tab_divs}
        call CaL23 TABCREATE X {tab_divs} {v_min} {v_max}
        v = {v_min}

        for (i = 0; i <= ({tab_divs}); i = i + 1)
            
            // tau
            float tau
            v = v * 1000 // temporarily set v to units of equation...
            tau = 0.204 + 0.333 / { {exp {{15.8 + v} / 18.2 }} + {exp {{- v - 131} / 16.7}} }
            
            v = v * 0.001 // reset v
            
            // Set correct units of tau
            tau = tau * 0.001

            // inf
            float inf
                
            // A = 1, B = -6.2, Vhalf = -56.0, in physiol. units
            // A = 1, B = -0.0062, Vhalf = -0.056
            inf = 1 / ( {exp {(v + 0.056) / -0.0062}} + 1)
        
            // alpha and beta
            
            float alpha
            float beta
            alpha = inf / tau   
            beta = (1- inf)/tau
            
            setfield CaL23 X_A->table[{i}] {alpha}
            setfield CaL23 X_B->table[{i}] {alpha + beta}
            v = v + dv

        end // end of for (i = 0; i <= ({tab_divs}); i = i + 1)
            
        setfield CaL23 X_A->calc_mode 1 X_B->calc_mode 1
                    
        // X table for gate h

        float dv = ({v_max} - {v_min})/{tab_divs}
            
        call CaL23 TABCREATE Y {tab_divs} {v_min} {v_max}
        v = {v_min}


        for (i = 0; i <= ({tab_divs}); i = i + 1)
            // tau
            float tau
            v = v * 1000 // v to units of equation
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
            // A = 1, B = 4, Vhalf = -80, in physiol. units
            // A = 1, B = 0.004, Vhalf = -0.08
            inf = 1 / ( {exp {(v + 0.08 ) / 0.004}} + 1)
            
            // alpha and beta 
            
            float alpha
            float beta
            alpha = inf / tau   
            beta = (1- inf)/tau
            
            setfield CaL23 Y_A->table[{i}] {alpha}
            setfield CaL23 Y_B->table[{i}] {alpha + beta}
                
            v = v + dv
        end // end of for (i = 0; i <= ({tab_divs}); i = i + 1)
        setfield CaL23 Y_A->calc_mode 1 Y_B->calc_mode 1
end

//==========================================================================
//            Tabchannel gCaH-high threshold calcium, gCa(L) "long" 2003/05
//==========================================================================
function make_CaH23
        if ({exists CaH23})
            return
        end
        
        create tabchannel CaH23
        setfield CaH23 \ 
            Ek              0.125 \
            Ik              0  \
            Xpower          2
        
        setfield CaH23 \
            Gbar 5 \
            Gk              0 

        float tab_divs = 741
        float v_min = -0.12

        float v_max = 0.06

        float v, dv, i
            
        // X table for gate m
        float dv = ({v_max} - {v_min})/{tab_divs}
        call CaH23 TABCREATE X {tab_divs} {v_min} {v_max}
        v = {v_min}

        for (i = 0; i <= ({tab_divs}); i = i + 1)
            
            // alpha
            float alpha

            // A = 1.6, B = -13.888889, Vhalf = 5, in p.u.
            // A = 1600, B = -0.013888889000000001, Vhalf = 0.005
            alpha = 1600 / ( {exp {(v - 0.005) / -0.013888889000000001}} + 1)


            // beta
            float beta
            // A = 0.1, B = -5, Vhalf = -8.9, in units: Physiological Units
            // A = 100, B = -0.005, Vhalf = -0.0089

            if ( {abs {(v + 0.0089)/ -0.005}} < 1e-6)
                beta = 100 * (1 + (v + 0.0089)/-0.005/2)
            else
                beta = 100 * ((v + 0.0089) / -0.005) /(1 - {exp {-1 * (v + 0.0089)/-0.005}})
            end


            // alpha and beta & tables

            float tau = 1/(alpha + beta)
            
            setfield CaH23 X_A->table[{i}] {alpha}
            setfield CaH23 X_B->table[{i}] {alpha + beta}
            v = v + dv
        end // end of for (i = 0; i <= ({tab_divs}); i = i + 1)
            
        setfield CaH23 X_A->calc_mode 1 X_B->calc_mode 1
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
function make_Ca_s23
        if ({exists Ca_s23})
            return
        end
        create Ca_concen Ca_s23
        // params for Ca pool 
        setfield Ca_s23 \
            tau                   { 1.0 / 10 }    \
            Ca_base               0
        addfield Ca_s23 addmsg1
        setfield Ca_s23 \
                addmsg1        "../CaH23 . I_Ca Ik"
        addfield Ca_s23 addmsg2
        setfield Ca_s23 \
                addmsg2        "../CaL23 . I_Ca Ik"
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
function make_Ca_d23
        if ({exists Ca_d23})
            return
        end
        create Ca_concen Ca_d23
        //  params for a Ca pool
        setfield Ca_d23 \
            tau                   { 1.0 / 75 }    \
            Ca_base               0
        addfield Ca_d23 addmsg1
        setfield Ca_d23 \
                addmsg1        "../CaH23 . I_Ca Ik"
        addfield Ca_d23 addmsg2
        setfield Ca_d23 \
                addmsg2        "../CaL23 . I_Ca Ik"
end


function make_Ca_db23
        if ({exists Ca_db23})
            return
        end
        create Ca_concen Ca_db23
        //  params for a Ca pool
        setfield Ca_db23 \
            tau                   { 1.0 / 20 }    \
            Ca_base               0
        addfield Ca_db23 addmsg1
        setfield Ca_db23 \
                addmsg1        "../CaH23 . I_Ca Ik"
        addfield Ca_db23 addmsg2
        setfield Ca_db23 \
                addmsg2        "../CaL23 . I_Ca Ik"
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
function make_KCs23
        if ({exists KCs23})
            return
        end
        create tabchannel KCs23

        setfield KCs23 \ 
            Ek              -0.095 \
            Ik              0  \
            Xpower          1 \
            Zpower          1
        setfield KCs23 \
            Gbar 120 \
            Gk              0 

        float tab_divs = 1041
        float v_min = -0.12
        float v_max = 0.14
        float v, dv, i
            
        // X table for gate m
        float dv = ({v_max} - {v_min})/{tab_divs}
        call KCs23 TABCREATE X {tab_divs} {v_min} {v_max}
        v = {v_min}

        for (i = 0; i <= ({tab_divs}); i = i + 1)
            
            // alpha
            float alpha

            v = v * 1000 // v to units of equation...
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

            v = v * 1000 // v to units of equation
            alpha = alpha * 0.001 // alpha to units of equations

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
            setfield KCs23 X_A->table[{i}] {alpha}
            setfield KCs23 X_B->table[{i}] {alpha + beta}
            v = v + dv

        end // end of for (i = 0; i <= ({tab_divs}); i = i + 1)
            
        setfield KCs23 X_A->calc_mode 1 X_B->calc_mode 1
                    
        // Adding voltage independent concentration term
        
        float conc_min = 0
        float conc_max = 1000
        float dc = ({conc_max} - {conc_min})/{tab_divs}
        float ca_conc = {conc_min}
        call KCs23 TABCREATE  Z {tab_divs} {conc_min} {conc_max}
        float const_state
        for (i = 0; i <= ({tab_divs}); i = i + 1)
                
            ca_conc = ca_conc * 0.000001 //ca_conc to units of equations

            if (ca_conc < 0.00025 )
                const_state =  {ca_conc / 0.00025} 
            else
                const_state =  1
            end
                
            ca_conc = ca_conc * 1000000 //rest ca_conc
            
            setfield KCs23 Z_A->table[{i}] {0}
            setfield KCs23 Z_B->table[{i}] {const_state}
            ca_conc= ca_conc + dc
        end
        tweaktau KCs23 Z

        addfield KCs23 addmsg1
        setfield KCs23 addmsg1  "../Ca_s23  . CONCEN Ca"
end


function make_KCd23
        if ({exists KCd23})
            return
        end
        create tabchannel KCd23
        setfield KCd23 \ 
            Ek              -0.095 \
            Ik              0  \
            Xpower          1 \
            Zpower          1
        setfield KCd23 \
            Gbar 120 \
            Gk              0 

        float tab_divs = 1041
        float v_min = -0.12
        float v_max = 0.14
        float v, dv, i
            
        // X table for gate m
        float dv = ({v_max} - {v_min})/{tab_divs}
        call KCd23 TABCREATE X {tab_divs} {v_min} {v_max}
        v = {v_min}

        for (i = 0; i <= ({tab_divs}); i = i + 1)

            // alpha
            float alpha
                        
            v = v * 1000 // v to units of equation
            if (v < -10 )
                alpha =  {2 / 37.95} * { exp { {{v + 50 } / 11} - {{ v + 53.5} / 27} } } 
            else
                alpha =  2 * {exp { { {-1 * v} - 53.5 } / 27 }}
            end
            v = v * 0.001 // reset v
            
            // crrect units of alpha
            alpha = alpha * 1000
            
            //  beta
            float beta

            v = v * 1000 // v to units of equation
            alpha = alpha * 0.001 // temp. to units of equation
            
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
            setfield KCd23 X_A->table[{i}] {alpha}
            setfield KCd23 X_B->table[{i}] {alpha + beta}
            v = v + dv

        end // end of for (i = 0; i <= ({tab_divs}); i = i + 1)
            
        setfield KCd23 X_A->calc_mode 1 X_B->calc_mode 1
                    
        // Adding voltage independent concentration term
        
        float conc_min = 0
        float conc_max = 1000
        float dc = ({conc_max} - {conc_min})/{tab_divs}
        float ca_conc = {conc_min}
        call KCd23 TABCREATE  Z {tab_divs} {conc_min} {conc_max}
        float const_state
        for (i = 0; i <= ({tab_divs}); i = i + 1)
                
            ca_conc = ca_conc * 0.000001 // ca_conc to units of equation
            if (ca_conc < 0.00025 )
                const_state =  {ca_conc / 0.00025} 
            else
                const_state =  1
            end
            ca_conc = ca_conc * 1000000 //reset ca_conc

            setfield KCd23 Z_A->table[{i}] {0}
            setfield KCd23 Z_B->table[{i}] {const_state}
            
            ca_conc= ca_conc + dc
        end
             
        tweaktau KCd23 Z
        
        addfield KCd23 addmsg1
        setfield KCd23 addmsg1  "../Ca_d23  . CONCEN Ca"

end

function make_KCdb23
        if ({exists KCdb23})
            return
        end
        create tabchannel KCdb23
        setfield KCdb23 \ 
            Ek              -0.095 \
            Ik              0  \
            Xpower          1 \
            Zpower          1
        setfield KCdb23 \
            Gbar 120 \
            Gk              0 

        float tab_divs = 1041
        float v_min = -0.12
        float v_max = 0.14
        float v, dv, i
            
        // X table for gate m
        float dv = ({v_max} - {v_min})/{tab_divs}
        call KCdb23 TABCREATE X {tab_divs} {v_min} {v_max}
        v = {v_min}

        for (i = 0; i <= ({tab_divs}); i = i + 1)

            // alpha
            float alpha
                        
            v = v * 1000 // v to units of equation
            if (v < -10 )
                alpha =  {2 / 37.95} * { exp { {{v + 50 } / 11} - {{ v + 53.5} / 27} } } 
            else
                alpha =  2 * {exp { { {-1 * v} - 53.5 } / 27 }}
            end
            v = v * 0.001 // reset v
            
            // crrect units of alpha
            alpha = alpha * 1000
            
            //  beta
            float beta

            v = v * 1000 // v to units of equation
            alpha = alpha * 0.001 // temp. to units of equation
            
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
            setfield KCdb23 X_A->table[{i}] {alpha}
            setfield KCdb23 X_B->table[{i}] {alpha + beta}
            v = v + dv

        end // end of for (i = 0; i <= ({tab_divs}); i = i + 1)
            
        setfield KCdb23 X_A->calc_mode 1 X_B->calc_mode 1
                    
        // Adding voltage independent concentration term
        
        float conc_min = 0
        float conc_max = 1000
        float dc = ({conc_max} - {conc_min})/{tab_divs}
        float ca_conc = {conc_min}
        call KCdb23 TABCREATE  Z {tab_divs} {conc_min} {conc_max}
        float const_state
        for (i = 0; i <= ({tab_divs}); i = i + 1)
                
            ca_conc = ca_conc * 0.000001 // ca_conc to units of equation
            if (ca_conc < 0.00025 )
                const_state =  {ca_conc / 0.00025} 
            else
                const_state =  1
            end
            ca_conc = ca_conc * 1000000 //reset ca_conc

            setfield KCdb23 Z_A->table[{i}] {0}
            setfield KCdb23 Z_B->table[{i}] {const_state}
            
            ca_conc= ca_conc + dc
        end
             
        tweaktau KCdb23 Z
        
        addfield KCdb23 addmsg1
        setfield KCdb23 addmsg1  "../Ca_db23  . CONCEN Ca"

end


//========================================================================
//             Tabulated Ca-dependent K AHP Channel,gK(AHP) 2003/05
//========================================================================

/* This is a tabchannel which gets the calcium concentration from Ca_hip_conc
   in order to calculate the activation of its Z gate.  It is set up much
   like the Ca channel, except that the A and B tables have values which are
   functions of concentration, instead of voltage.
*/
function make_KAHPs23
        str chanpath = "KAHPs23"

        if ({exists KAHPs23})
            return
        end
        create tabchannel KAHPs23
        setfield KAHPs23 \ 
            Ek              -0.095 \
            Ik              0  \
            Zpower          1
        
        setfield KAHPs23 \
            Gbar 1 \
            Gk              0 

        float tab_divs = 1041
        float c
        float conc_min = 0
        float conc_max = 1000

        float dc = ({conc_max} - {conc_min})/{tab_divs}
        float ca_conc = {conc_min}
            
        call KAHPs23 TABCREATE Z {tab_divs} {conc_min} {conc_max}

        for (c = 0; c <= ({tab_divs}); c = c + 1)
                    
            //  alpha
            float alpha
            float v    
                        
            v = v * 1000 // v to units of equation
            ca_conc = ca_conc * 0.000001 //ca_conc to units of equation
            if (ca_conc < 0.0001 )
                alpha =  ca_conc/0.01 
            else
                alpha =  0.01
            end
            v = v * 0.001 // reset v
            ca_conc = ca_conc * 1000000 // resetting ca_conc 

            // correct units of alpha
            alpha = alpha * 1000

            // beta
            float beta
            v = v * 1000 // v to units of equation
            ca_conc = ca_conc * 0.000001 // ca_conc to units of equation
            beta = 0.001

            v = v * 0.001 // reset v
            ca_conc = ca_conc * 1000000 // resetting ca_conc 
            
            // correct units of beta
            beta = beta * 1000

            // alpha and beta-> tables

            float tau = 1/(alpha + beta)
            
            setfield KAHPs23 Z_A->table[{c}] { alpha}
            setfield KAHPs23 Z_B->table[{c}] {alpha + beta}
                    ca_conc = ca_conc + dc
                
        end // end of for (c = 0; c <= ({tab_divs}); c = c + 1)
                
        setfield KAHPs23 Z_conc 1
        setfield KAHPs23 Z_A->calc_mode 1 Z_B->calc_mode 1

        addfield KAHPs23 addmsg1
        setfield KAHPs23  \
                addmsg1        "../Ca_s23 . CONCEN Ca"
end


function make_KAHPd23
        if ({exists KAHPd23})
            return
        end
        create tabchannel KAHPd23
        setfield KAHPd23 \ 
            Ek              -0.095 \
            Ik              0  \
            Zpower          1
        
        setfield KAHPd23 \
            Gbar 1 \
            Gk              0 

        float tab_divs = 1041

        float c
        float conc_min = 0
        float conc_max = 1000
        float dc = ({conc_max} - {conc_min})/{tab_divs}
        float ca_conc = {conc_min}
            
        call KAHPd23 TABCREATE Z {tab_divs} {conc_min} {conc_max}
        for (c = 0; c <= ({tab_divs}); c = c + 1)
                    
            //  alpha

            float alpha
            float v    

            v = v * 1000 // v to units of equation
            ca_conc = ca_conc * 0.000001 // ca_conc to units of equation

            if (ca_conc < 0.0001 )
                alpha =  ca_conc/0.01 
            else
                alpha =  0.01
            end
            v = v * 0.001 // reset v
            ca_conc = ca_conc * 1000000 // resetting ca_conc 
            
            //  units of alpha
            alpha = alpha * 1000

            // beta
            float beta
                        
            v = v * 1000 // v to units of equation...
            ca_conc = ca_conc * 0.000001 // ca_conc to units of equation

            beta = 0.001
            v = v * 0.001 // reset v
            ca_conc = ca_conc * 1000000 // resetting ca_conc 

            
            // correct units of beta
            beta = beta * 1000

            // alpha and beta & tables

            float tau = 1/(alpha + beta)
            setfield KAHPd23 Z_A->table[{c}] {alpha}
            setfield KAHPd23 Z_B->table[{c}] {alpha + beta}
                    ca_conc = ca_conc + dc
        end // end of for (c = 0; c <= ({tab_divs}); c = c + 1)
                
        setfield KAHPd23 Z_conc 1
        setfield KAHPd23 Z_A->calc_mode 1 Z_B->calc_mode 1

        addfield KAHPd23 addmsg1
        setfield KAHPd23  \
                addmsg1        "../Ca_d23 . CONCEN Ca"
end

function make_KAHPdb23
        if ({exists KAHPdb23})
            return
        end
        create tabchannel KAHPdb23
        setfield KAHPdb23 \ 
            Ek              -0.095 \
            Ik              0  \
            Zpower          1
        
        setfield KAHPdb23 \
            Gbar 1 \
            Gk              0 

        float tab_divs = 1041

        float c
        float conc_min = 0
        float conc_max = 1000
        float dc = ({conc_max} - {conc_min})/{tab_divs}
        float ca_conc = {conc_min}
            
        call KAHPdb23 TABCREATE Z {tab_divs} {conc_min} {conc_max}
        for (c = 0; c <= ({tab_divs}); c = c + 1)
                    
            //  alpha

            float alpha
            float v    

            v = v * 1000 // v to units of equation
            ca_conc = ca_conc * 0.000001 // ca_conc to units of equation

            if (ca_conc < 0.0001 )
                alpha =  ca_conc/0.01 
            else
                alpha =  0.01
            end
            v = v * 0.001 // reset v
            ca_conc = ca_conc * 1000000 // resetting ca_conc 
            
            //  units of alpha
            alpha = alpha * 1000

            // beta
            float beta
                        
            v = v * 1000 // v to units of equation...
            ca_conc = ca_conc * 0.000001 // ca_conc to units of equation

            beta = 0.001
            v = v * 0.001 // reset v
            ca_conc = ca_conc * 1000000 // resetting ca_conc 

            
            // correct units of beta
            beta = beta * 1000

            // alpha and beta & tables

            float tau = 1/(alpha + beta)
            setfield KAHPdb23 Z_A->table[{c}] {alpha}
            setfield KAHPdb23 Z_B->table[{c}] {alpha + beta}
                    ca_conc = ca_conc + dc
        end // end of for (c = 0; c <= ({tab_divs}); c = c + 1)
                
        setfield KAHPdb23 Z_conc 1
        setfield KAHPdb23 Z_A->calc_mode 1 Z_B->calc_mode 1

        addfield KAHPdb23 addmsg1
        setfield KAHPdb23  \
                addmsg1        "../Ca_db23 . CONCEN Ca"
end

