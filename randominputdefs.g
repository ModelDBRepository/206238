// genesis
// randominputdefs.g

// Create Random Background Inputs

include P23RSa_raninput.g
include P23RSb_raninput.g
include P23RSc_raninput.g
include P23RSd_raninput.g


include B23FS_raninput.g

include P5IBa_raninput.g
include P5IBb_raninput.g
include P5IBc_raninput.g
include P5IBd_raninput.g

include B5FS_raninput.g

include P6RSa_raninput.g
include P6RSb_raninput.g

if ({columntype == 0})

     include P6RSc_raninput.g
     include P6RSd_raninput.g

end

include C23FS_raninput.g
include C5FS_raninput.g

include ST4RS_raninput.g

include I23LTS_raninput.g
include I5LTS_raninput.g

if ({thalamocortical == 1})
 
     include TCR_raninput.g
     include nRT_raninput.g

end

include P23FRBa_raninput.g
include P5RSa_raninput.g
