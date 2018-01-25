// genesis

echo ST4RS_raninput

// function for setting random network inputs

    int i,j,dex

    float randneur
    
    float CondmaxSPIKEAMPA=10e-9  //0.25e-9

    float Ranrate=200 //Random injection frequency

    for (i=1;i<=(ST4RS_NY);i=i+1)

        for (j=1;j<=(ST4RS_NX);j=j+1)

            randneur = { rand 0 1.0 }

            if ( {randneur <= 9*neuronfrac} )

                dex=(i-1)*ST4RS_NY+(j-1)

                ce /ST4RSnet/ST4RS[{dex}]/distdendNlonga

                make_Ex_chSPIKEAMPA
                setfield /ST4RSnet/ST4RS[{dex}]/distdendNlonga/Ex_chSPIKEAMPA gmax {CondmaxSPIKEAMPA}
                addmsg /ST4RSnet/ST4RS[{dex}]/distdendNlonga/Ex_chSPIKEAMPA /ST4RSnet/ST4RS[{dex}]/distdendNlonga CHANNEL Gk Ek
                addmsg /ST4RSnet/ST4RS[{dex}]/distdendNlonga /ST4RSnet/ST4RS[{dex}]/distdendNlonga/Ex_chSPIKEAMPA VOLTAGE Vm

                ce /

                create randomspike /randomspikeST4RS{dex}
                setfield ^ min_amp 1.0 max_amp 1.0 rate {Ranrate} reset 1 reset_value 0
                addmsg /randomspikeST4RS{dex} /ST4RSnet/ST4RS[{dex}]/distdendNlonga/Ex_chSPIKEAMPA SPIKE

                //create pulsegen /pulsegenST4RS{dex}
                //setfield ^ level1 {Ranrate} baselevel 0 width1 {stimlen} delay1 {interstimlen} trig_mode 0
                //addmsg /pulsegenST4RS{dex} /randomspikeST4RS{dex} RATE output
                //addmsg /netpulsegenST4RS /randomspikeST4RS{dex} RATE output

                setfield /ST4RSnet/ST4RS[{dex}]/distdendNlonga/Ex_chSPIKEAMPA synapse[0].delay 0 synapse[0].weight 1

            end

        end

    end
