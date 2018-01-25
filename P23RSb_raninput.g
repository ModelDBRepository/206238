// genesis

echo P23RSb_raninput

// function for setting random network inputs

    int i,j,dex

    float randneur
    
    float CondmaxSPIKEAMPA=10.0e-9

    float Ranrate=200 //Random injection frequency

    for (i=1;i<=(P23RSb_NY);i=i+1)

        for (j=1;j<=(P23RSb_NX);j=j+1)

            randneur = { rand 0 1.0 }

            if ( {randneur <= neuronfrac} )

                dex=(i-1)*P23RSb_NY+(j-1)

                ce /P23RSbnet/P23RSb[{dex}]/apdend3

                make_Ex_chSPIKEAMPA
                setfield /P23RSbnet/P23RSb[{dex}]/apdend3/Ex_chSPIKEAMPA gmax {CondmaxSPIKEAMPA}
                addmsg /P23RSbnet/P23RSb[{dex}]/apdend3/Ex_chSPIKEAMPA /P23RSbnet/P23RSb[{dex}]/apdend3 CHANNEL Gk Ek
                addmsg /P23RSbnet/P23RSb[{dex}]/apdend3 /P23RSbnet/P23RSb[{dex}]/apdend3/Ex_chSPIKEAMPA VOLTAGE Vm

                ce /

                create randomspike /randomspikeP23RSb{dex}
                setfield ^ min_amp 1.0 max_amp 1.0 rate {Ranrate} reset 1 reset_value 0
                addmsg /randomspikeP23RSb{dex} /P23RSbnet/P23RSb[{dex}]/apdend3/Ex_chSPIKEAMPA SPIKE
 
                //create pulsegen /pulsegenP23RSb{dex}
                //setfield ^ level1 {Ranrate} baselevel 0 width1 {stimlen} delay1 {interstimlen} trig_mode 0
                //addmsg /pulsegenP23RSb{dex} /randomspikeP23RSb{dex} RATE output
                //addmsg /netpulsegen /randomspikeP23RSb{dex} RATE output

                setfield /P23RSbnet/P23RSb[{dex}]/apdend3/Ex_chSPIKEAMPA synapse[0].delay 0 synapse[0].weight 1

            end

        end

    end
