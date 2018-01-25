// genesis

echo LFP8sASCIIwrite
//echo {narraycolumns}

for (j=0;j<={narraycolumns};j=j+1)

     do_asc_file /home/pol/Data/GenesisData/Neocortex/LFP8e{j}.dat{mynode} LFP{j} field LFP{j}file

end
