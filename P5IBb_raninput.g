// genesis

echo P5IBb_raninput

// function for setting random network inputs

    int i,j,dex

    float randneur
    
    float CondmaxSPIKEAMPA=1.0e-9

    float Ranrate=200 //Random injection frequency

    for (i=1;i<=(P5IBb_NY);i=i+1)

        for (j=1;j<=(P5IBb_NX);j=j+1)

            randneur = { rand 0 1.0 }

            if ( {randneur <= neuronfrac} )

                dex=(i-1)*P5IBb_NY+(j-1)

                ce /P5IBbnet/P5IBb[{dex}]/apdend3

                make_Ex_chSPIKEAMPA
                setfield /P5IBbnet/P5IBb[{dex}]/apdend3/Ex_chSPIKEAMPA gmax {CondmaxSPIKEAMPA}
                addmsg /P5IBbnet/P5IBb[{dex}]/apdend3/Ex_chSPIKEAMPA /P5IBbnet/P5IBb[{dex}]/apdend3 CHANNEL Gk Ek
                addmsg /P5IBbnet/P5IBb[{dex}]/apdend3 /P5IBbnet/P5IBb[{dex}]/apdend3/Ex_chSPIKEAMPA VOLTAGE Vm

                ce /

                create randomspike /randomspikeP5IBb{dex}
                setfield ^ min_amp 1.0 max_amp 1.0 rate {Ranrate} reset 1 reset_value 0
                addmsg /randomspikeP5IBb{dex} /P5IBbnet/P5IBb[{dex}]/apdend3/Ex_chSPIKEAMPA SPIKE

                //create pulsegen /pulsegenP5IBb{dex}
                //setfield ^ level1 {Ranrate} baselevel 0 width1 {stimlen} delay1 {interstimlen} trig_mode 0
                //addmsg /pulsegenP5IBb{dex} /randomspikeP5IBb{dex} RATE output
                //addmsg /netpulsegen /randomspikeP5IBb{dex} RATE output

                setfield /P5IBbnet/P5IBb[{dex}]/apdend3/Ex_chSPIKEAMPA synapse[0].delay 0 synapse[0].weight 1

            end

        end

    end
