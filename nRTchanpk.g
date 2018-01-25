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
// And for LTS and FS interneurons - Cunningham et al. PNAS 2004;101:7152-7157.

// CONSTANTS
float EREST_ACT = -0.088 /* cell resting potential */
float ENAnRT = 0.138 + EREST_ACT //  0.05
float EKnRT = -0.012 + EREST_ACT // -0.1
float ECAnRT = 0.213 + EREST_ACT //  0.125
float EARnRT = 0.048  + EREST_ACT // -0.04
float SOMA_A = 3.320e-9          // soma area in square meters

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
function make_NaF21

        if ({exists NaF21})
            return
        end
        
        create tabchannel NaF21

        setfield NaF21 \ 
            Ek              {ENAnRT} \
            Ik              0  \
            Xpower          3 \
            Ypower          1
        
        setfield NaF21 \
            Gbar            1 \
            Gk              0 
                
        float tab_divs = 741
        float v_min = -0.12
        float v_max = 0.06
        float v, dv, i
            
        float dv = ({v_max} - {v_min})/{tab_divs}
            
        call NaF21 TABCREATE X {tab_divs} {v_min} {v_max}
                
        v = {v_min}

        for (i = 0; i <= ({tab_divs}); i = i + 1)
            
            // Looking at rate: tau
            float tau

            v = v * 1000 // temporarily set v to units of equation...
            if ({ v } < -30 )
                tau =  0.0125 + 0.1525 * { exp { {v + 30} / 10} } 
            else
                tau =  0.02 + 0.145 * { exp { {-v - 30} / 10 } }
            end
            v = v * 0.001 // reset v
            
            // Set correct units of tau
            tau = tau * 0.001
            // Looking at rate: inf

            float inf
            v = v * 1000 // temporarily set v to units of equation...
            inf =  1 / { 1 + {exp { { -v - 38} / 10}} } 
            v = v * 0.001 // reset v

            // Working out the "real" alpha and beta expressions from the tau and inf
            
            float alpha
            float beta
            alpha = inf / tau   
            beta = (1- inf)/tau
            
            setfield NaF21 X_A->table[{i}] {alpha}
            setfield NaF21 X_B->table[{i}] {alpha + beta}
                
            v = v + dv

        end // end of for (i = 0; i <= ({tab_divs}); i = i + 1)
            
        setfield NaF21 X_A->calc_mode 1 X_B->calc_mode 1
                    
        // Creating table for gate h, using name Y for it here

        float dv = ({v_max} - {v_min})/{tab_divs}
            
        call NaF21 TABCREATE Y {tab_divs} {v_min} {v_max}
                
        v = {v_min}

        for (i = 0; i <= ({tab_divs}); i = i + 1)
            // Looking at rate: tau
            float tau
            v = v * 1000 // temporarily set v to units of equation...
            tau = 0.225 + 1.125 / { 1 + { exp {{ v + 37 } / 15} } }
            v = v * 0.001 // reset v
            
            // Set correct units of tau
            tau = tau * 0.001
            // Looking at rate: inf

            float inf
            v = v * 1000 // temporarily set v to units of equation...
            inf = 1 / { 1 + {exp {{  v + 58.3 } / 6.7}} }
            v = v * 0.001 // reset v

            // Working out the "real" alpha and beta expressions from the tau and inf
            
            float alpha
            float beta
            alpha = inf / tau   
            beta = (1- inf)/tau
            
            setfield NaF21 Y_A->table[{i}] {alpha}
            setfield NaF21 Y_B->table[{i}] {alpha + beta}
                
            v = v + dv

        end // end of for (i = 0; i <= ({tab_divs}); i = i + 1)
            
        setfield NaF21 Y_A->calc_mode 1 Y_B->calc_mode 1

end // end of NaF21 channel definition

//========================================================================
//        Tabchannel gNa-persistent (non-inactivating), gNa(P) 2005/03
//========================================================================
function make_NaP21

        str chanpath = "NaP21"

        if ({exists NaP21})
            return
        end
        
        create tabchannel NaP21

        setfield NaP21 \ 
            Ek              {ENAnRT} \ 
            Ik              0  \
            Xpower          3
        
        setfield NaP21 \
            Gbar 1875 \
            Gk              0 
        
        float tab_divs = 741
        float v_min = -0.12
        float v_max = 0.06
        float v, dv, i
            
        // X table for gate m

        float dv = ({v_max} - {v_min})/{tab_divs}
            
        call NaP21 TABCREATE X {tab_divs} {v_min} {v_max}
                
        v = {v_min}

            

        for (i = 0; i <= ({tab_divs}); i = i + 1)
            
            // Looking at rate: tau
            float tau

            v = v * 1000 // temporarily set v to units of equation...

            if ({ v + 10 } < -30 )
                tau =  0.025 + 0.14 * { exp {{v + 40} / 10} } 
            else
                tau =  0.02 + 0.145 * { exp {{-v - 40} / 10 } }
            end
            v = v * 0.001 // reset v
            
            // Set correct units of tau
            tau = tau * 0.001
            // Looking at rate: inf
                
            float inf
            v = v * 1000 // temporarily set v to units of equation...
            inf =  1 / { 1 + {exp { {{-v - 10} - 38} / 10}} } 
            v = v * 0.001 // reset v
            
            // Working out the "real" alpha and beta expressions from the tau and inf
            float alpha
            float beta
            alpha = inf / tau   
            beta = (1- inf)/tau
            
            setfield NaP21 X_A->table[{i}] {alpha}
            setfield NaP21 X_B->table[{i}] {alpha + beta}
            v = v + dv

        end // end of for (i = 0; i <= ({tab_divs}); i = i + 1)
            
        setfield NaP21 X_A->calc_mode 1 X_B->calc_mode 1

end // end of main channel definition

//========================================================================
//        Tabchannel Anomalous Rectifier, gAR 2005/03
//========================================================================
function make_AR21

        if ({exists AR21})
            return
        end
        
        create tabchannel AR21
        setfield AR21 \ 
            Ek              {EARnRT} \
            Ik              0  \
            Xpower          1
        
        setfield AR21 \
            Gbar 2.5 \
            Gk              0 
        
        float tab_divs = 741
        float v_min = -0.12
        float v_max = 0.06
        float v, dv, i
            
        float dv = ({v_max} - {v_min})/{tab_divs}
            
        call AR21 TABCREATE X {tab_divs} {v_min} {v_max}
                
        v = {v_min}

        for (i = 0; i <= ({tab_divs}); i = i + 1)
            
            // Looking at rate: tau

            float tau

            v = v * 1000 // temporarily set v to units of equation...
            tau = 1 /{{exp {-14.6 - {0.086 * v} }} + {exp {-1.87 + {0.07 * v}}}}
            v = v * 0.001 // reset v
            
            // Set correct units of tau
            tau = tau * 0.001
            // Looking at rate: inf
                

            float inf
            v = v * 1000 // temporarily set v to units of equation...
            inf = 1 / ( {exp {(v + 75) / 5.5}} + 1)
            v = v * 0.001 // reset v

            // Working out the "real" alpha and beta expressions from the tau and inf
            
            float alpha
            float beta
            alpha = inf / tau   
            beta = (1- inf)/tau
            
            
            setfield AR21 X_A->table[{i}] {alpha}
            setfield AR21 X_B->table[{i}] {alpha + beta}

                
            v = v + dv

        end // end of for (i = 0; i <= ({tab_divs}); i = i + 1)
            
        setfield AR21 X_A->calc_mode 1 X_B->calc_mode 1

end // end of main channel definition

//========================================================================
//                Tabchannel gK-delayed rectifier, gK(DR) 2005/03
//========================================================================
function make_KDR21

        if ({exists KDR21})
            return
        end
        
        create tabchannel KDR21

        setfield KDR21 \ 
            Ek              {EKnRT} \
            Ik              0  \
            Xpower          4
        
        setfield KDR21 \
            Gbar 1250 \
            Gk              0 
        

        float tab_divs = 741
        float v_min = -0.12
        float v_max = 0.06
        float v, dv, i
            
        float dv = ({v_max} - {v_min})/{tab_divs}
            
        call KDR21 TABCREATE X {tab_divs} {v_min} {v_max}
                
        v = {v_min}
        for (i = 0; i <= ({tab_divs}); i = i + 1)
            // Looking at rate: tau
            float tau
            v = v * 1000 // temporarily set v to units of equation...
            if (v <= -10 )
                tau =  0.25 + 4.35 * {exp {{ v + 10 }/10}} 
            else
                tau =  0.25 + 4.35 * {exp {{-v - 10}/ 10}}
            end
            v = v * 0.001 // reset v
            
            // Set correct units of tau
            tau = tau * 0.001
            // Looking at rate: inf
                
            float inf
            v = v * 1000 // temporarily set v to units of equation...
            inf = 1 / ( {exp {(-v - 27 ) / 11.5}} + 1)
            v = v * 0.001 // reset v
            
            // Working out the "real" alpha and beta expressions from the tau and inf
            
            float alpha
            float beta
            alpha = inf / tau   
            beta = (1- inf)/tau
            
            setfield KDR21 X_A->table[{i}] {alpha}
            setfield KDR21 X_B->table[{i}] {alpha + beta}
                
            v = v + dv

        end // end of for (i = 0; i <= ({tab_divs}); i = i + 1)
            
        setfield KDR21 X_A->calc_mode 1 X_B->calc_mode 1
end

//========================================================================
//                Tabchannel gK-transient, gK(A) 2005/03
//========================================================================
function make_KA21

        
        if ({exists KA21})
            return
        end
        
        create tabchannel KA21

        setfield KA21 \ 
            Ek              {EKnRT} \
            Ik              0  \
            Xpower          4 \
            Ypower          1
        
        setfield KA21 \
            Gbar 300 \
            Gk              0 

        float tab_divs = 741
        float v_min = -0.12
        float v_max = 0.06
        float v, dv, i
            

        float dv = ({v_max} - {v_min})/{tab_divs}
            
        call KA21 TABCREATE X {tab_divs} {v_min} {v_max}
                
        v = {v_min}

        for (i = 0; i <= ({tab_divs}); i = i + 1)
            
            // Looking at rate: tau

            float tau
            v = v * 1000 // temporarily set v to units of equation...
            tau = 0.185 + 0.5 / {{exp {{ v + 35.8 }/19.7}} + {exp {{-v - 79.7}/12.7}}}
            v = v * 0.001 // reset v
            
            // Set correct units of tau
            tau = tau * 0.001
            // Looking at rate: inf
                

            float inf
            float A, B, Vhalf

            inf = 1 / ( {exp {(-v - 0.06) / 0.0085}} + 1)
            
            // Working out the "real" alpha and beta expressions from the tau and inf
            
            float alpha
            float beta
            alpha = inf / tau   
            beta = (1- inf)/tau
            
            
            setfield KA21 X_A->table[{i}] {alpha}
            setfield KA21 X_B->table[{i}] {alpha + beta}

                
            v = v + dv

        end // end of for (i = 0; i <= ({tab_divs}); i = i + 1)
            
        setfield KA21 X_A->calc_mode 1 X_B->calc_mode 1
                    
        // Creating table for gate h, using name Y for it here

        float dv = ({v_max} - {v_min})/{tab_divs}
            
        call KA21 TABCREATE Y {tab_divs} {v_min} {v_max}
                
        v = {v_min}

        for (i = 0; i <= ({tab_divs}); i = i + 1)
            // Looking at rate: tau
            float tau
            v = v * 1000 // temporarily set v to units of equation...
            if (v < -63.0 )
                tau =  0.5 / {{exp {{ v + 46 }/5}} + {exp {{ -v - 238 }/37.5}}} 
            else
                tau =  9.5
            end
            v = v * 0.001 // reset v
            
            // Set correct units of tau
            tau = tau * 0.001
            // Looking at rate: inf

            float inf
                
            float A, B, Vhalf
                             
            inf = 1 / ( {exp {(v + 0.078) / 0.006}} + 1)

            // Working out the "real" alpha and beta expressions from the tau and inf
            
            float alpha
            float beta
            alpha = inf / tau   
            beta = (1- inf)/tau
            
            
            setfield KA21 Y_A->table[{i}] {alpha}
            setfield KA21 Y_B->table[{i}] {alpha + beta}
            v = v + dv

        end // end of for (i = 0; i <= ({tab_divs}); i = i + 1)
            
        setfield KA21 Y_A->calc_mode 1 Y_B->calc_mode 1
end


//========================================================================
//                Tabchannel gK2-slow, gK2 2005/03
//========================================================================
function make_K221

        if ({exists K221})
            return
        end
        create tabchannel K221

        setfield K221 \ 
            Ek              {EKnRT} \
            Ik              0  \
            Xpower          1 \
            Ypower          1
        
        setfield K221 \
            Gbar 1 \
            Gk              0 

        float tab_divs = 741
        float v_min = -0.12
        float v_max = 0.06
        float v, dv, i
            
        // X table for gate m

        float dv = ({v_max} - {v_min})/{tab_divs}
            
        call K221 TABCREATE X {tab_divs} {v_min} {v_max}
                
        v = {v_min}
        for (i = 0; i <= ({tab_divs}); i = i + 1)
            // Looking at rate: tau
            float tau
            v = v * 1000 // temporarily set v to units of equation...
            tau = 4.95 + 0.5 / { {exp { {v - 81} / 25.6}} + {exp { {-v - 132} / 18 }}}
            v = v * 0.001 // reset v
            
            // Set correct units of tau
            tau = tau * 0.001
            // Looking at rate: inf

            float inf
            float A, B, Vhalf

            inf = 1 / ( {exp {(-v - 0.01) / 0.017}} + 1)
        
            // Working out the "real" alpha and beta expressions from the tau and inf
            
            float alpha
            float beta
            alpha = inf / tau   
            beta = (1- inf)/tau
            
            
            setfield K221 X_A->table[{i}] {alpha}
            setfield K221 X_B->table[{i}] {alpha + beta}

                
            v = v + dv

        end // end of for (i = 0; i <= ({tab_divs}); i = i + 1)
            
        setfield K221 X_A->calc_mode 1 X_B->calc_mode 1
                    
        // Creating table for gate h, using name Y for it here

        float dv = ({v_max} - {v_min})/{tab_divs}
            
        call K221 TABCREATE Y {tab_divs} {v_min} {v_max}
                
        v = {v_min}

            

        for (i = 0; i <= ({tab_divs}); i = i + 1)
            // Looking at rate: tau
            float tau
                
            v = v * 1000 // temporarily set v to units of equation...
            tau = 60 + 0.5 / {{exp {{ v - 1.33 }/200}} + {exp {{-v - 130}/ 7.1}}}
            v = v * 0.001 // reset v
            
            // Set correct units of tau
            tau = tau * 0.001
            // Looking at rate: inf

            float inf
            float A, B, Vhalf
            
            inf = 1 / ( {exp {(v + 0.058) /0.0106}} + 1)
        
            // Working out the "real" alpha and beta expressions from the tau and inf
            
            float alpha
            float beta
            alpha = inf / tau   
            beta = (1- inf)/tau
            
            
            setfield K221 Y_A->table[{i}] {alpha}
            setfield K221 Y_B->table[{i}] {alpha + beta}

                
            v = v + dv

        end // end of for (i = 0; i <= ({tab_divs}); i = i + 1)
            
        setfield K221 Y_A->calc_mode 1 Y_B->calc_mode 1
end

//========================================================================
//           Tabchannel gK-muscarinic receptor supressed, gK(M) 2005/03
//========================================================================
function make_KM21

        str chanpath = "KM21"

        if ({exists KM21})
            return
        end
        
        create tabchannel KM21

        setfield KM21 \ 
            Ek              {EKnRT} \
            Ik              0  \
            Xpower          1
        
        setfield KM21 \
            Gbar 75 \
            Gk              0 

        
    

        float tab_divs = 741
        float v_min = -0.12
        float v_max = 0.06
        float v, dv, i
            
        // Creating table for gate m, using name X for it here

        float dv = ({v_max} - {v_min})/{tab_divs}
        call KM21 TABCREATE X {tab_divs} {v_min} {v_max}
        v = {v_min}

        for (i = 0; i <= ({tab_divs}); i = i + 1)
            // Looking at rate: alpha
            float alpha
            alpha = 20 / ( {exp {(-v - 0.02) / 0.005}} + 1)
            
            // Looking at rate: beta
            float beta
            beta = 10 * {exp {(-v - 0.043) / 0.018}}

            // Using the alpha and beta expressions to populate the tables

            float tau = 1/(alpha + beta)
            setfield KM21 X_A->table[{i}] {alpha}
            setfield KM21 X_B->table[{i}] {alpha + beta}
            v = v + dv

        end // end of for (i = 0; i <= ({tab_divs}); i = i + 1)
            
        setfield KM21 X_A->calc_mode 1 X_B->calc_mode 1
end

//========================================================================
//          Tabchannel gCa(L)-low threshold, transient, gCa(L) 2005/03
//========================================================================
function make_CaL21

        if ({exists CaL21})
            return
        end
        create tabchannel CaL21
        setfield CaL21 \ 
            Ek              {ECAnRT} \
            Ik              0  \
            Xpower          2 \
            Ypower          1
        
        setfield CaL21 \
            Gbar 1 \
            Gk              0 

        float tab_divs = 741
        float v_min = -0.12
        float v_max = 0.06

        float v, dv, i
            
        // X table for gate m

        float dv = ({v_max} - {v_min})/{tab_divs}
            
        call CaL21 TABCREATE X {tab_divs} {v_min} {v_max}
                
        v = {v_min}

            

        for (i = 0; i <= ({tab_divs}); i = i + 1)
            
            // Looking at rate: tau
                

            float tau
                
                        
            v = v * 1000 // temporarily set v to units of equation...
            tau = 1 + 0.33 / { {exp {{v + 27} / 10 }} + {exp {{- v - 102} / 15}} }
            v = v * 0.001 // reset v
            
            // Set correct units of tau
            tau = tau * 0.001
            // Looking at rate: inf
                

            float inf
            float A, B, Vhalf
            inf = 1 / ( {exp {(-v - 0.052) / 0.0074}} + 1)
        

            float alpha
            float beta
            alpha = inf / tau   
            beta = (1- inf)/tau
            
            
            setfield CaL21 X_A->table[{i}] {alpha}
            setfield CaL21 X_B->table[{i}] {alpha + beta}

                
            v = v + dv

        end // end of for (i = 0; i <= ({tab_divs}); i = i + 1)
            
        setfield CaL21 X_A->calc_mode 1 X_B->calc_mode 1
                    
        // Creating table for gate h, using name Y for it here

        float dv = ({v_max} - {v_min})/{tab_divs}
            
        call CaL21 TABCREATE Y {tab_divs} {v_min} {v_max}
                
        v = {v_min}

            

        for (i = 0; i <= ({tab_divs}); i = i + 1)
            
            // Looking at rate: tau
                

            float tau
                

            v = v * 1000 // temporarily set v to units of equation...
            tau = 28.3 + 0.33 / {{exp {{ v + 48}/ 4}} + {exp { { -v - 407} / 50 }} } 
            v = v * 0.001 // reset v
            
            // Set correct units of tau
            tau = tau * 0.001
            // Looking at rate: inf

            float inf
            inf = 1 / ( {exp {(v + 0.08) / 0.005}} + 1)

            // Working out the "real" alpha and beta expressions from the tau and inf
            
            float alpha
            float beta
            alpha = inf / tau   
            beta = (1- inf)/tau
            
            
            setfield CaL21 Y_A->table[{i}] {alpha}
            setfield CaL21 Y_B->table[{i}] {alpha + beta}
            v = v + dv

        end // end of for (i = 0; i <= ({tab_divs}); i = i + 1)
            
        setfield CaL21 Y_A->calc_mode 1 Y_B->calc_mode 1
end

//==========================================================================
//            Tabchannel gCaH-high threshold calcium, gCa(L) "long" 2003/05
//==========================================================================

function make_CaH21

        if ({exists CaH21})
            return
        end
        
        create tabchannel CaH21

        setfield CaH21 \ 
            Ek              {ECAnRT} \
            Ik              0  \
            Xpower          2
        
        setfield CaH21 \
            Gbar 5 \
            Gk              0 
    

        float tab_divs = 741
        float v_min = -0.12

        float v_max = 0.06
        float v, dv, i
            
        // X table for gate m

        float dv = ({v_max} - {v_min})/{tab_divs}
            
        call CaH21 TABCREATE X {tab_divs} {v_min} {v_max}
                
        v = {v_min}

        for (i = 0; i <= ({tab_divs}); i = i + 1)
            // Looking at rate: alpha
            float alpha
            alpha = 1600 / ( {exp {(v - 0.005) / -0.013888889000000001}} + 1)
        
            // Looking at rate: beta

            float beta
                             
            if ( {abs {(v + 0.0089)/ -0.005}} < 1e-6)
                beta = 100 * (1 + (v + 0.0089)/-0.005/2)
            else
                beta = 100 * ((v + 0.0089) / -0.005) /(1 - {exp {-1 * (v + 0.0089)/ -0.005}})
            end


            // Using the alpha and beta expressions to populate the tables
            float tau = 1/(alpha + beta)
            
            setfield CaH21 X_A->table[{i}] {alpha}
            setfield CaH21 X_B->table[{i}] {alpha + beta}
                    
            v = v + dv

        end // end of for (i = 0; i <= ({tab_divs}); i = i + 1)
            
        setfield CaH21 X_A->calc_mode 1 X_B->calc_mode 1
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
However, for the prototype channel we wlll use Traub's
corrected value for the soma.  (An error in the paper gives it as 17,402
rather than 17.402.)  In our units, this will be 17.402e12.

****************************************************************************/

function make_Ca_s21

        if ({exists Ca_s21})
            return
        end

        create Ca_concen Ca_s21

        setfield Ca_s21 \
            tau                   { 1.0 / 20 }    \
            Ca_base               0 
            //B      17.402e12     

        addfield Ca_s21 addmsg1
        setfield Ca_s21 \
                addmsg1        "../CaH21 . I_Ca Ik"
//        addfield Ca_s21 addmsg2
//        setfield Ca_s21 \
//                addmsg2        "../CaL21 . I_Ca Ik"
             
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

function make_Ca_d21

        if ({exists Ca_d21})
            return
        end
        create Ca_concen Ca_d21
                
        setfield Ca_d21 \
            tau                   { 1.0 / 20 }    \
            Ca_base               0 
            //B       17.402e12     

        addfield Ca_d21 addmsg1
        setfield Ca_d21 \
                addmsg1        "../CaH21 . I_Ca Ik"
//        addfield Ca_d21 addmsg2
//        setfield Ca_d21 \
//                addmsg2        "../CaL21 . I_Ca Ik"

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
function make_KCs21

        if ({exists KCs21})
            return
        end
        create tabchannel KCs21

        setfield KCs21 \ 
            Ek              {EKnRT} \
            Ik              0  \
            Xpower          1 \
            Zpower          1
            
        setfield KCs21 \
            Gbar 120 \
            Gk              0 

        float tab_divs = 1041
        float v_min = -0.12
        float v_max = 0.14
        float v, dv, i
            
        // X table for gate m

        float dv = ({v_max} - {v_min})/{tab_divs}
        call KCs21 TABCREATE X {tab_divs} {v_min} {v_max}
        v = {v_min}
            
        for (i = 0; i <= ({tab_divs}); i = i + 1)
            // Looking at rate: alpha
                
            float alpha

            v = v * 1000 // temporarily set v to units of equation...
            if (v < -10 )
                alpha =  {2 / 37.95} * { exp { {{v + 50 } / 11} - {{ v + 53.5} / 27} } } 
            else
                alpha =  2 * {exp { { {-1 * v} - 53.5 } / 27 }}
            end
            v = v * 0.001 // reset v
            
            // Set correct units of alpha
            alpha = alpha * 1000
            
            // Looking at rate: beta
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
            // Set correct units of beta
            beta = beta * 1000


            float tau = 1/(alpha + beta)
            setfield KCs21 X_A->table[{i}] {alpha}
            setfield KCs21 X_B->table[{i}] {alpha + beta}
            v = v + dv

        end // end of for (i = 0; i <= ({tab_divs}); i = i + 1)
            
        setfield KCs21 X_A->calc_mode 1 X_B->calc_mode 1
                    
        // voltage independent concentration term
        
        float conc_min = 0
        float conc_max = 1000

        float dc = ({conc_max} - {conc_min})/{tab_divs}
        float ca_conc = {conc_min}
        
        call KCs21 TABCREATE  Z {tab_divs} {conc_min} {conc_max}
        
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
            
            setfield KCs21 Z_A->table[{i}] {0}
            setfield KCs21 Z_B->table[{i}] {const_state}
            
            ca_conc= ca_conc + dc
        end
             
        tweaktau KCs21 Z

        addfield KCs21 addmsg1
        setfield KCs21 addmsg1  "../Ca_s21  . CONCEN Ca"
end


function make_KCd21

        if ({exists KCd21})
            return
        end
        create tabchannel KCd21 

        setfield KCd21 \ 
            Ek              {EKnRT} \
            Ik              0  \
            Xpower          1 \
            Zpower          1
        
        setfield KCd21 \
            Gbar 120 \
            Gk              0 


        float tab_divs = 1041
        float v_min = -0.12
        float v_max = 0.14
        float v, dv, i
            
        // X table for gate m

        float dv = ({v_max} - {v_min})/{tab_divs}
        call KCd21 TABCREATE X {tab_divs} {v_min} {v_max}
        v = {v_min}
        for (i = 0; i <= ({tab_divs}); i = i + 1)
            // Looking at rate: alpha
            float alpha
                        
            v = v * 1000 // temporarily set v to units of equation...
            if (v < -10 )
                alpha =  {2 / 37.95} * { exp { {{v + 50 } / 11} - {{ v + 53.5} / 27} } } 
            else
                alpha =  2 * {exp { { {-1 * v} - 53.5 } / 27 }}
            end
            v = v * 0.001 // reset v
            
            // Set correct units of alpha
            alpha = alpha * 1000

            
            // Looking at rate: beta
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
                        
            // Set correct units of beta
            beta = beta * 1000

            // alpha and beta expressions to populate the tables

            float tau = 1/(alpha + beta)
            
            setfield KCd21 X_A->table[{i}] {alpha}
            setfield KCd21 X_B->table[{i}] {alpha + beta}
            v = v + dv

        end // end of for (i = 0; i <= ({tab_divs}); i = i + 1)
            
        setfield KCd21 X_A->calc_mode 1 X_B->calc_mode 1
                    
        // voltage independent concentration term
        
        float conc_min = 0
        float conc_max = 1000
        float dc = ({conc_max} - {conc_min})/{tab_divs}
        float ca_conc = {conc_min}
        
        call KCd21 TABCREATE  Z {tab_divs} {conc_min} {conc_max}
        
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
            
            setfield KCd21 Z_A->table[{i}] {0}
            setfield KCd21 Z_B->table[{i}] {const_state}
            
            ca_conc= ca_conc + dc
        end
             
        tweaktau KCd21 Z

        addfield KCd21 addmsg1
        setfield KCd21 addmsg1  "../Ca_d21  . CONCEN Ca"
end


//========================================================================
//             Tabulated Ca-dependent K AHP Channel,gK(AHP) 2003/05
//========================================================================

/* This is a tabchannel which gets the calcium concentration from Ca_hip_conc
   in order to calculate the activation of its Z gate.  It is set up much
   like the Ca channel, except that the A and B tables have values which are
   functions of concentration, instead of voltage.
*/

function make_KAHPs21

        if ({exists KAHPs21})
            return
        end
        create tabchannel KAHPs21
        setfield KAHPs21 \ 
            Ek              {EKnRT} \
            Ik              0  \
            Zpower          1
        
        setfield KAHPs21 \
            Gbar 1 \
            Gk              0 

        float tab_divs = 1041

        // Channel is dependent on concentration of: Calcium, rate equations will involve variable: ca_conc
        float c
        float conc_min = 0
        float conc_max = 1000
        float dc = ({conc_max} - {conc_min})/{tab_divs}
        float ca_conc = {conc_min}
            
        call KAHPs21 TABCREATE Z {tab_divs} {conc_min} {conc_max}

        for (c = 0; c <= ({tab_divs}); c = c + 1)
            // Looking at rate: alpha

            float alpha
                        
           // Equation depends on concentration, so converting that too... 
            ca_conc = ca_conc * 0.000001

            if (ca_conc < 0.0005 )
                alpha =  ca_conc/0.05 
            else
                alpha =  0.01
            end
            ca_conc = ca_conc * 1000000 // resetting ca_conc 
            
            // Set correct units of alpha
            alpha = alpha * 1000

            // Looking at rate: beta

            float beta
                        
           // Equation depends on concentration, so converting that too... 
            ca_conc = ca_conc * 0.000001
            beta = 0.001
            ca_conc = ca_conc * 1000000 // resetting ca_conc 

            // Set correct units of beta
            beta = beta * 1000

            // Using the alpha and beta expressions to populate the tables

            float tau = 1/(alpha + beta)
            
            setfield KAHPs21 Z_A->table[{c}] {alpha}
            setfield KAHPs21 Z_B->table[{c}] {alpha + beta}
                    ca_conc = ca_conc + dc
                
        end // end of for (c = 0; c <= ({tab_divs}); c = c + 1)
                
        setfield KAHPs21 Z_conc 1
        setfield KAHPs21 Z_A->calc_mode 1 Z_B->calc_mode 1
                    
        addfield KAHPs21 addmsg1
        setfield KAHPs21 addmsg1    "../Ca_s21 . CONCEN Ca"
end


function make_KAHPd21

        if ({exists KAHPd21})
            return
        end
        create tabchannel KAHPd21 
        setfield KAHPd21 \ 
            Ek              {EKnRT} \
            Ik              0  \
            Zpower          1
        
        setfield KAHPd21 \
            Gbar 1 \
            Gk              0 
        

        float tab_divs = 1041
        // Channel is dependent on concentration of: Calcium, rate equations will involve variable: ca_conc
        float c
        float conc_min = 0
        float conc_max = 1000
        float dc = ({conc_max} - {conc_min})/{tab_divs}
        float ca_conc = {conc_min}

            
        call KAHPd21 TABCREATE Z {tab_divs} {conc_min} {conc_max}
        for (c = 0; c <= ({tab_divs}); c = c + 1)
            // Looking at rate: alpha

            float alpha
                
           // Equation depends on concentration, so converting  
            ca_conc = ca_conc * 0.000001

            if (ca_conc < 0.0005 )
                alpha =  ca_conc/0.05 
            else
                alpha =  0.01
            end
            ca_conc = ca_conc * 1000000 // resetting ca_conc 

            // Set correct units of alpha
            alpha = alpha * 1000

            // Looking at rate: beta

            float beta
           // Equation depends on concentration, so converting  
            ca_conc = ca_conc * 0.000001
            beta = 0.001
            ca_conc = ca_conc * 1000000 // resetting ca_conc 
            
            // Set correct units of beta
            beta = beta * 1000

            // alpha and beta expressions to populate the tables

            float tau = 1/(alpha + beta)
            
            setfield KAHPd21 Z_A->table[{c}] {alpha}
            setfield KAHPd21 Z_B->table[{c}] {alpha + beta}
                    ca_conc = ca_conc + dc
                
        end // end of for (c = 0; c <= ({tab_divs}); c = c + 1)
                
        setfield KAHPd21 Z_conc 1
        setfield KAHPd21 Z_A->calc_mode 1 Z_B->calc_mode 1
                    
        addfield KAHPd21 addmsg1
        setfield KAHPd21 addmsg1    "../Ca_d21 . CONCEN Ca"
end

function make_pas

      // passive leak conductance
        str chanpath = "pas"

        if ({exists pas})
            return
        end

        create leakage pas

        setfield pas \       
            Ek             -0.075\
            Ik              0

        setfield {chanpath} Gk 3
end


