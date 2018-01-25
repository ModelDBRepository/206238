// genesis

echo C5FS_raninput

// function for setting random network inputs

if ({columntype == 0})

    int i,j,dex

    float randneur
    
    float CondmaxSPIKEAMPA=0.01e-9

    float Ranrate=200 //Random injection frequency

    for (i=1;i<=(C5FS_NY);i=i+1)

        for (j=1;j<=(C5FS_NX);j=j+1)

            randneur = { rand 0 1.0 }

            if ( {randneur <= neuronfrac} )

                dex=(i-1)*C5FS_NY+(j-1)

                ce /C5FSnet/C5FS[{dex}]/distdendNlonga

                make_Ex_chSPIKEAMPA
                setfield /C5FSnet/C5FS[{dex}]/distdendNlonga/Ex_chSPIKEAMPA gmax {CondmaxSPIKEAMPA}
                addmsg /C5FSnet/C5FS[{dex}]/distdendNlonga/Ex_chSPIKEAMPA /C5FSnet/C5FS[{dex}]/distdendNlonga CHANNEL Gk Ek
                addmsg /C5FSnet/C5FS[{dex}]/distdendNlonga /C5FSnet/C5FS[{dex}]/distdendNlonga/Ex_chSPIKEAMPA VOLTAGE Vm

                ce /

                create randomspike /randomspikeC5FS{dex}
                setfield ^ min_amp 1.0 max_amp 1.0 rate {Ranrate} reset 1 reset_value 0
                addmsg /randomspikeC5FS{dex} /C5FSnet/C5FS[{dex}]/distdendNlonga/Ex_chSPIKEAMPA SPIKE

                //create pulsegen /pulsegenC5FS{dex}
                //setfield ^ level1 {Ranrate} baselevel 0 width1 {stimlen} delay1 {interstimlen} trig_mode 0
                //addmsg /pulsegenC5FS{dex} /randomspikeC5FS{dex} RATE output
                //addmsg /netpulsegen /randomspikeC5FS{dex} RATE output

                setfield /C5FSnet/C5FS[{dex}]/distdendNlonga/Ex_chSPIKEAMPA synapse[0].delay 0 synapse[0].weight 1

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

    for (i=0;i<(C5FS_NY);i=i+1)

        jstartdex = {trunc {i/2}}*2-i+1

        for (j=jstartdex;j<(C5FS_NX);j=j+2)

            randneur = { rand 0 1.0 }

            if ( {randneur <= neuronfrac} )

                ce /C5FSnet/C5FS[{k}]/distdendNlonga

                make_Ex_chSPIKEAMPA
                setfield /C5FSnet/C5FS[{k}]/distdendNlonga/Ex_chSPIKEAMPA gmax {CondmaxSPIKEAMPA}
                addmsg /C5FSnet/C5FS[{k}]/distdendNlonga/Ex_chSPIKEAMPA /C5FSnet/C5FS[{k}]/distdendNlonga CHANNEL Gk Ek
                addmsg /C5FSnet/C5FS[{k}]/distdendNlonga /C5FSnet/C5FS[{k}]/distdendNlonga/Ex_chSPIKEAMPA VOLTAGE Vm

                ce /

                create randomspike /randomspikeC5FS{k}
                setfield ^ min_amp 1.0 max_amp 1.0 rate {Ranrate} reset 1 reset_value 0
                addmsg /randomspikeC5FS{k} /C5FSnet/C5FS[{k}]/distdendNlonga/Ex_chSPIKEAMPA SPIKE

                //create pulsegen /pulsegenC5FS{k}
                //setfield ^ level1 {Ranrate} baselevel 0 width1 {stimlen} delay1 {interstimlen} trig_mode 0
                //addmsg /pulsegenC5FS{k} /randomspikeC5FS{k} RATE output
                //addmsg /netpulsegen /randomspikeC5FS{k} RATE output

                setfield /C5FSnet/C5FS[{k}]/distdendNlonga/Ex_chSPIKEAMPA synapse[0].delay 0 synapse[0].weight 1

            end
   
            k=k+1

        end

    end

end
