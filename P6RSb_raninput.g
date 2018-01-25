// genesis

echo P6RSb_raninput

// function for setting random network inputs

    int i,j,dex

    float randneur
    
    float CondmaxSPIKEAMPA=1.0e-9

    float Ranrate=200 //Random injection frequency

    for (i=1;i<=(P6RSb_NY);i=i+1)

        for (j=1;j<=(P6RSb_NX);j=j+1)

            randneur = { rand 0 1.0 }

            // if ( {randneur <= neuronfrac} )
            if ( {randneur <= 1.0} )

                dex=(i-1)*P6RSb_NY+(j-1)

                ce /P6RSbnet/P6RSb[{dex}]/apdend3

                make_Ex_chSPIKEAMPA
                setfield /P6RSbnet/P6RSb[{dex}]/apdend3/Ex_chSPIKEAMPA gmax {CondmaxSPIKEAMPA}
                addmsg /P6RSbnet/P6RSb[{dex}]/apdend3/Ex_chSPIKEAMPA /P6RSbnet/P6RSb[{dex}]/apdend3 CHANNEL Gk Ek
                addmsg /P6RSbnet/P6RSb[{dex}]/apdend3 /P6RSbnet/P6RSb[{dex}]/apdend3/Ex_chSPIKEAMPA VOLTAGE Vm

                ce /

                create randomspike /randomspikeP6RSb{dex}
                setfield ^ min_amp 1.0 max_amp 1.0 rate {Ranrate} reset 1 reset_value 0
                addmsg /randomspikeP6RSb{dex} /P6RSbnet/P6RSb[{dex}]/apdend3/Ex_chSPIKEAMPA SPIKE

                //create pulsegen /pulsegenP6RSb{dex}
                //setfield ^ level1 {Ranrate} baselevel 0 width1 {stimlen} delay1 {interstimlen} trig_mode 0
                //addmsg /pulsegenP6RSb{dex} /randomspikeP6RSb{dex} RATE output
                //addmsg /netpulsegen /randomspikeP6RSb{dex} RATE output

                setfield /P6RSbnet/P6RSb[{dex}]/apdend3/Ex_chSPIKEAMPA synapse[0].delay 0 synapse[0].weight 1

            end

        end

    end
