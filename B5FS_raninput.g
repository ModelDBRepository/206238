// genesis

echo B5FS_raninput

// function for setting random network inputs

if ({columntype == 0})

    int i,j,dex

    float randneur
    
    float CondmaxSPIKEAMPA=0.01e-9

    float Ranrate=200 //Random injection frequency

    for (i=1;i<=(B5FS_NY);i=i+1)

        for (j=1;j<=(B5FS_NX);j=j+1)

            randneur = { rand 0 1.0 }

            if ( {randneur <= neuronfrac} )

                dex=(i-1)*B5FS_NY+(j-1)

                ce /B5FSnet/B5FS[{dex}]/distdendNlonga

                make_Ex_chSPIKEAMPA
                setfield /B5FSnet/B5FS[{dex}]/distdendNlonga/Ex_chSPIKEAMPA gmax {CondmaxSPIKEAMPA}
                addmsg /B5FSnet/B5FS[{dex}]/distdendNlonga/Ex_chSPIKEAMPA /B5FSnet/B5FS[{dex}]/distdendNlonga CHANNEL Gk Ek
                addmsg /B5FSnet/B5FS[{dex}]/distdendNlonga /B5FSnet/B5FS[{dex}]/distdendNlonga/Ex_chSPIKEAMPA VOLTAGE Vm

                ce /

                create randomspike /randomspikeB5FS{dex}
                setfield ^ min_amp 1.0 max_amp 1.0 rate {Ranrate} reset 1 reset_value 0
                addmsg /randomspikeB5FS{dex} /B5FSnet/B5FS[{dex}]/distdendNlonga/Ex_chSPIKEAMPA SPIKE

                //create pulsegen /pulsegenB5FS{dex}
                //setfield ^ level1 {Ranrate} baselevel 0 width1 {stimlen} delay1 {interstimlen} trig_mode 0
                //addmsg /pulsegenB5FS{dex} /randomspikeB5FS{dex} RATE output
                //addmsg /netpulsegen /randomspikeB5FS{dex} RATE output                

                setfield /B5FSnet/B5FS[{dex}]/distdendNlonga/Ex_chSPIKEAMPA synapse[0].delay 0 synapse[0].weight 1

            end

        end

    end

end

if ({columntype == 1})

    int i,j

    int k=0

    int jstartdex

    float randneur
    
    float CondmaxSPIKEAMPA=0.01e-9

    float Ranrate=200 //Random injection frequency

    for (i=0;i<(B5FS_NY);i=i+1)

        jstartdex = {trunc {i/2}}*2-i+1

        for (j=jstartdex;j<(B5FS_NX);j=j+2)

            randneur = { rand 0 1.0 }

            if ( {randneur <= neuronfrac} )

                ce /B5FSnet/B5FS[{k}]/distdendNlonga

                make_Ex_chSPIKEAMPA
                setfield /B5FSnet/B5FS[{k}]/distdendNlonga/Ex_chSPIKEAMPA gmax {CondmaxSPIKEAMPA}
                addmsg /B5FSnet/B5FS[{k}]/distdendNlonga/Ex_chSPIKEAMPA /B5FSnet/B5FS[{k}]/distdendNlonga CHANNEL Gk Ek
                addmsg /B5FSnet/B5FS[{k}]/distdendNlonga /B5FSnet/B5FS[{k}]/distdendNlonga/Ex_chSPIKEAMPA VOLTAGE Vm

                ce /

                create randomspike /randomspikeB5FS{k}
                setfield ^ min_amp 1.0 max_amp 1.0 rate {Ranrate} reset 1 reset_value 0
                addmsg /randomspikeB5FS{k} /B5FSnet/B5FS[{k}]/distdendNlonga/Ex_chSPIKEAMPA SPIKE

                //create pulsegen /pulsegenB5FS{k}
                //setfield ^ level1 {Ranrate} baselevel 0 width1 {stimlen} delay1 {interstimlen} trig_mode 0
                //addmsg /pulsegenB5FS{k} /randomspikeB5FS{k} RATE output
                //addmsg /netpulsegen /randomspikeB5FS{k} RATE output

                setfield /B5FSnet/B5FS[{k}]/distdendNlonga/Ex_chSPIKEAMPA synapse[0].delay 0 synapse[0].weight 1

            end
   
            k=k+1

        end

    end

end