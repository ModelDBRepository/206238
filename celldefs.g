// genesis
// Neocortex - netdef.g

// Define P23RSa cells

include P23RSaprotodefs.g

// Build the cell from a parameter file using the cell reader
readcell P23RSacell3Dpk.p /P23RSa

//pk Steady bias current for excitability level/heterogeneity (if randomized)
str tempChanName
foreach tempChanName ({el /P23RSa/#})
    setfield {tempChanName} Em -0.07
end
setfield /P23RSa/soma inject 0.2e-9

P23RSa_synapsedefs

//setfield /P23RSa/apdend3 inject 0.0

delete /library

// Define P23RSb cells

include P23RSbprotodefs.g

// Build the cell from a parameter file using the cell reader
readcell P23RSbcell3Dpk.p /P23RSb

//pk Steady bias current for excitability level/heterogeneity (if randomized)
//str tempChanName
foreach tempChanName ({el /P23RSb/#})
    setfield {tempChanName} Em -0.07
end
setfield /P23RSb/soma inject 0.2e-9

P23RSb_synapsedefs

delete /library

// Define P23RSc cells

include P23RScprotodefs.g 

// Build the cell from a parameter file using the cell reader
readcell P23RSccell3Dpk.p /P23RSc

//pk Steady bias current for excitability level/heterogeneity (if randomized)
//str tempChanName
foreach tempChanName ({el /P23RSc/#})
    setfield {tempChanName} Em -0.07 
end
setfield /P23RSc/soma inject 0.2e-9

P23RSc_synapsedefs

delete /library

// Define P23RSd cells

include P23RSdprotodefs.g

// Build the cell from a parameter file using the cell reader
readcell P23RSdcell3Dpk.p /P23RSd

//pk Steady bias current for excitability level/heterogeneity (if randomized)
//str tempChanName
foreach tempChanName ({el /P23RSd/#})
    setfield {tempChanName} Em -0.07 
end
setfield /P23RSd/soma inject 0.2e-9

P23RSd_synapsedefs

delete /library

// Define B23FS cells

include B23FSprotodefs.g

// Build the cell from a parameter file using the cell reader
readcell B23FScell3Dpk.p /B23FS

B23FS_synapsedefs

delete /library

// Define P5IBa cells

include P5IBaprotodefs.g

// Build the cell from a parameter file using the cell reader
readcell P5IBacell3Dpk.p /P5IBa

P5IBa_synapsedefs

delete /library

// Define P5IBb cells

include P5IBbprotodefs.g

// Build the cell from a parameter file using the cell reader
readcell P5IBbcell3Dpk.p /P5IBb

P5IBb_synapsedefs

delete /library

// Define P5IBc cells
    
include P5IBcprotodefs

// Build the cell from a parameter file using the cell reader
readcell P5IBccell3Dpk.p /P5IBc

P5IBc_synapsedefs

delete /library 

// Define P5IBd cells

include P5IBdprotodefs.g

// Build the cell from a parameter file using the cell reader
readcell P5IBdcell3Dpk.p /P5IBd

P5IBd_synapsedefs

delete /library

// Define B5FS cells

include B5FSprotodefs.g

// Build the cell from a parameter file using the cell reader
readcell B5FScell3Dpk.p /B5FS

B5FS_synapsedefs

delete /library

// Define P6RSa cells

include P6RSaprotodefs.g

// Build the cell from a parameter file using the cell reader
readcell P6RSacell3Dpk.p /P6RSa

P6RSa_synapsedefs

delete /library

// Define P6RSb cells

include P6RSbprotodefs.g

// Build the cell from a parameter file using the cell reader
readcell P6RSbcell3Dpk.p /P6RSb

P6RSb_synapsedefs

delete /library

if ({columntype == 0})

     // Define P6RSc cells

     include P6RScprotodefs.g

     // Build the cell from a parameter file using the cell reader
     readcell P6RSccell3Dpk.p /P6RSc

     P6RSc_synapsedefs

     delete /library

     // Define P6RSd cells

     include P6RSdprotodefs.g

     // Build the cell from a parameter file using the cell reader
     readcell P6RSdcell3Dpk.p /P6RSd

     P6RSd_synapsedefs

     delete /library

end

// Define C23FS cells

include C23FSprotodefs.g

// Build the cell from a parameter file using the cell reader
readcell C23FScell3Dpk.p /C23FS

C23FS_synapsedefs

delete /library

// Define C5FS cells

include C5FSprotodefs.g

// Build the cell from a parameter file using the cell reader
readcell C5FScell3Dpk.p /C5FS

C5FS_synapsedefs

delete /library

// Define ST4RS cells

include ST4RSprotodefs.g

// Build the cell from a parameter file using the cell reader
readcell ST4RScell3Dpk.p /ST4RS

//pk Steady bias current for excitability level/heterogeneity (if randomized)
//str tempChanName
/*foreach tempChanName ({el /ST4RS/#})
   setfield {tempChanName} inject -0.005e-9
end*/
setfield /ST4RS/soma inject -0.01e-9

ST4RS_synapsedefs

delete /library

// Define I23LTS cells

include I23LTSprotodefs.g

// Build the cell from a parameter file using the cell reader
readcell I23LTScell3Dpk.p /I23LTS

I23LTS_synapsedefs

delete /library

// Define I5LTS cells

include I5LTSprotodefs.g

// Build the cell from a parameter file using the cell reader
readcell I5LTScell3Dpk.p /I5LTS

I5LTS_synapsedefs

delete /library

// Define TCR cells

if ({thalamocortical == 1})

     include TCRprotodefs.g

// Build the cell from a parameter file using the cell reader

     readcell TCRcellpk.p /TCR

     TCR_synapsedefs

     delete /library

     include nRTprotodefs.g

// Build the cell from a parameter file using the cell reader

     readcell nRTcellpk.p /nRT

     nRT_synapsedefs

     delete /library

end

// Define P23FRBa cells

include P23FRBaprotodefs.g

// Build the cell from a parameter file using the cell reader
readcell P23FRBacell3Dpk.p /P23FRBa

//pk Steady bias current for excitability level/heterogeneity (if randomized)
//str tempChanName
foreach tempChanName ({el /P23FRBa/#})
    setfield {tempChanName} inject -0.01e-9
end

P23FRBa_synapsedefs

delete /library

// Define P5RSa cells

include P5RSaprotodefs.g

// Build the cell from a parameter file using the cell reader
readcell P5RSacell3Dpk.p /P5RSa

P5RSa_synapsedefs

delete /library
