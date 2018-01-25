// genesis
// netdefs.g

float connscale = 1.00

//P23RSa spatial connection scales

float P23RSa_P23RSa_destlim = {P23RSa_SEPX}*{P23RSa_NX}/2*connscale
float P23RSa_P23RSb_destlim = {P23RSb_SEPX}*{P23RSb_NX}/2*connscale
float P23RSa_P23RSc_destlim = {P23RSc_SEPX}*{P23RSc_NX}/2*connscale
float P23RSa_P23RSd_destlim = {P23RSd_SEPX}*{P23RSd_NX}/2*connscale
float P23RSa_B23FS_destlim = {B23FS_SEPX}*{B23FS_NX}/2*connscale
float P23RSa_P5IBa_destlim = {P5IBa_SEPX}*{P5IBa_NX}/2*connscale
float P23RSa_P5IBb_destlim = {P5IBb_SEPX}*{P5IBb_NX}/2*connscale
float P23RSa_P5IBc_destlim = {P5IBc_SEPX}*{P5IBc_NX}/2*connscale
float P23RSa_P5IBd_destlim = {P5IBd_SEPX}*{P5IBd_NX}/2*connscale
float P23RSa_B5FS_destlim = {B5FS_SEPX}*{B5FS_NX}/2*connscale
float P23RSa_P6RSa_destlim = {P6RSa_SEPX}*{P6RSa_NX}/2*connscale
float P23RSa_P6RSb_destlim = {P6RSb_SEPX}*{P6RSb_NX}/2*connscale
float P23RSa_P6RSc_destlim = {P6RSc_SEPX}*{P6RSc_NX}/2*connscale
float P23RSa_P6RSd_destlim = {P6RSd_SEPX}*{P6RSd_NX}/2*connscale
float P23RSa_C23FS_destlim = {C23FS_SEPX}*{C23FS_NX}/2*connscale
float P23RSa_C5FS_destlim = {C5FS_SEPX}*{C5FS_NX}/2*connscale
float P23RSa_ST4RS_destlim = {ST4RS_SEPX}*{ST4RS_NX}/2*connscale
float P23RSa_I23LTS_destlim = {I23LTS_SEPX}*{I23LTS_NX}/2*connscale
float P23RSa_I5LTS_destlim = {I5LTS_SEPX}*{I5LTS_NX}/2*connscale
float P23RSa_P23FRBa_destlim = {P23FRBa_SEPX}*{P23FRBa_NX}/2*connscale
float P23RSa_P5RSa_destlim = {P5RSa_SEPX}*{P5RSa_NX}/2*connscale

// Create network for P23RSa cells

include P23RSa_P23RSa.g
include P23RSa_P23RSb.g
include P23RSa_P23RSc.g
include P23RSa_P23RSd.g
include P23RSa_B23FS.g
include P23RSa_P5IBa.g
include P23RSa_P5IBb.g
include P23RSa_P5IBc.g
include P23RSa_P5IBd.g
include P23RSa_B5FS.g
include P23RSa_P6RSa.g
include P23RSa_P6RSb.g

if ({columntype == 0})

     include P23RSa_P6RSc.g
     include P23RSa_P6RSd.g

end

include P23RSa_C23FS.g
include P23RSa_C5FS.g
include P23RSa_ST4RS.g
include P23RSa_I23LTS.g
include P23RSa_I5LTS.g
include P23RSa_P23FRBa.g
include P23RSa_P5RSa.g
include P23RSa_output.g
include Neosyn_utils.g

//P23RSb spatial connection scales

float P23RSb_P23RSa_destlim = {P23RSa_SEPX}*{P23RSa_NX}/2*connscale
float P23RSb_P23RSb_destlim = {P23RSb_SEPX}*{P23RSb_NX}/2*connscale
float P23RSb_P23RSc_destlim = {P23RSc_SEPX}*{P23RSc_NX}/2*connscale
float P23RSb_P23RSd_destlim = {P23RSd_SEPX}*{P23RSd_NX}/2*connscale
float P23RSb_B23FS_destlim = {B23FS_SEPX}*{B23FS_NX}/2*connscale
float P23RSb_P5IBa_destlim = {P5IBa_SEPX}*{P5IBa_NX}/2*connscale
float P23RSb_P5IBb_destlim = {P5IBb_SEPX}*{P5IBb_NX}/2*connscale
float P23RSb_P5IBc_destlim = {P5IBc_SEPX}*{P5IBc_NX}/2*connscale
float P23RSb_P5IBd_destlim = {P5IBd_SEPX}*{P5IBd_NX}/2*connscale
float P23RSb_B5FS_destlim = {B5FS_SEPX}*{B5FS_NX}/2*connscale
float P23RSb_P6RSa_destlim = {P6RSa_SEPX}*{P6RSa_NX}/2*connscale
float P23RSb_P6RSb_destlim = {P6RSb_SEPX}*{P6RSb_NX}/2*connscale
float P23RSb_P6RSc_destlim = {P6RSc_SEPX}*{P6RSc_NX}/2*connscale
float P23RSb_P6RSd_destlim = {P6RSd_SEPX}*{P6RSd_NX}/2*connscale
float P23RSb_C23FS_destlim = {C23FS_SEPX}*{C23FS_NX}/2*connscale
float P23RSb_C5FS_destlim = {C5FS_SEPX}*{C5FS_NX}/2*connscale
float P23RSb_ST4RS_destlim = {ST4RS_SEPX}*{ST4RS_NX}/2*connscale
float P23RSb_I23LTS_destlim = {I23LTS_SEPX}*{I23LTS_NX}/2*connscale
float P23RSb_I5LTS_destlim = {I5LTS_SEPX}*{I5LTS_NX}/2*connscale
float P23RSb_P23FRBa_destlim = {P23FRBa_SEPX}*{P23FRBa_NX}/2*connscale
float P23RSb_P5RSa_destlim = {P5RSa_SEPX}*{P5RSa_NX}/2*connscale

// Create network for P23RSb cells

include P23RSb_P23RSa.g
include P23RSb_P23RSb.g
include P23RSb_P23RSc.g
include P23RSb_P23RSd.g
include P23RSb_B23FS.g
include P23RSb_P5IBa.g
include P23RSb_P5IBb.g
include P23RSb_P5IBc.g
include P23RSb_P5IBd.g
include P23RSb_B5FS.g
include P23RSb_P6RSa.g
include P23RSb_P6RSb.g

if ({columntype == 0})

     include P23RSb_P6RSc.g
     include P23RSb_P6RSd.g

end

include P23RSb_C23FS.g
include P23RSb_C5FS.g
include P23RSb_ST4RS.g
include P23RSb_I23LTS.g
include P23RSb_I5LTS.g
include P23RSb_P23FRBa.g
include P23RSb_P5RSa.g

//P23RSc spatial connection scales

float P23RSc_P23RSa_destlim = {P23RSa_SEPX}*{P23RSa_NX}/2*connscale
float P23RSc_P23RSb_destlim = {P23RSb_SEPX}*{P23RSb_NX}/2*connscale
float P23RSc_P23RSc_destlim = {P23RSc_SEPX}*{P23RSc_NX}/2*connscale
float P23RSc_P23RSd_destlim = {P23RSd_SEPX}*{P23RSd_NX}/2*connscale
float P23RSc_B23FS_destlim = {B23FS_SEPX}*{B23FS_NX}/2*connscale
float P23RSc_P5IBa_destlim = {P5IBa_SEPX}*{P5IBa_NX}/2*connscale
float P23RSc_P5IBb_destlim = {P5IBb_SEPX}*{P5IBb_NX}/2*connscale
float P23RSc_P5IBc_destlim = {P5IBc_SEPX}*{P5IBc_NX}/2*connscale
float P23RSc_P5IBd_destlim = {P5IBd_SEPX}*{P5IBd_NX}/2*connscale
float P23RSc_B5FS_destlim = {B5FS_SEPX}*{B5FS_NX}/2*connscale
float P23RSc_P6RSa_destlim = {P6RSa_SEPX}*{P6RSa_NX}/2*connscale
float P23RSc_P6RSb_destlim = {P6RSb_SEPX}*{P6RSb_NX}/2*connscale
float P23RSc_P6RSc_destlim = {P6RSc_SEPX}*{P6RSc_NX}/2*connscale
float P23RSc_P6RSd_destlim = {P6RSd_SEPX}*{P6RSd_NX}/2*connscale
float P23RSc_C23FS_destlim = {C23FS_SEPX}*{C23FS_NX}/2*connscale
float P23RSc_C5FS_destlim = {C5FS_SEPX}*{C5FS_NX}/2*connscale
float P23RSc_ST4RS_destlim = {ST4RS_SEPX}*{ST4RS_NX}/2*connscale
float P23RSc_I23LTS_destlim = {I23LTS_SEPX}*{I23LTS_NX}/2*connscale
float P23RSc_I5LTS_destlim = {I5LTS_SEPX}*{I5LTS_NX}/2*connscale
float P23RSc_P23FRBa_destlim = {P23FRBa_SEPX}*{P23FRBa_NX}/2*connscale
float P23RSc_P5RSa_destlim = {P5RSa_SEPX}*{P5RSa_NX}/2*connscale

// Create network for P23RSc cells

include P23RSc_P23RSa.g
include P23RSc_P23RSb.g
include P23RSc_P23RSc.g
include P23RSc_P23RSd.g
include P23RSc_B23FS.g
include P23RSc_P5IBa.g
include P23RSc_P5IBb.g
include P23RSc_P5IBc.g
include P23RSc_P5IBd.g
include P23RSc_B5FS.g
include P23RSc_P6RSa.g
include P23RSc_P6RSb.g

if ({columntype == 0})

     include P23RSc_P6RSc.g
     include P23RSc_P6RSd.g

end

include P23RSc_C23FS.g
include P23RSc_C5FS.g
include P23RSc_ST4RS.g
include P23RSc_I23LTS.g
include P23RSc_I5LTS.g
include P23RSc_P23FRBa.g
include P23RSc_P5RSa.g

//P23RSd spatial connection scales

float P23RSd_P23RSa_destlim = {P23RSa_SEPX}*{P23RSa_NX}/2*connscale
float P23RSd_P23RSb_destlim = {P23RSb_SEPX}*{P23RSb_NX}/2*connscale
float P23RSd_P23RSc_destlim = {P23RSc_SEPX}*{P23RSc_NX}/2*connscale
float P23RSd_P23RSd_destlim = {P23RSd_SEPX}*{P23RSd_NX}/2*connscale
float P23RSd_B23FS_destlim = {B23FS_SEPX}*{B23FS_NX}/2*connscale
float P23RSd_P5IBa_destlim = {P5IBa_SEPX}*{P5IBa_NX}/2*connscale
float P23RSd_P5IBb_destlim = {P5IBb_SEPX}*{P5IBb_NX}/2*connscale
float P23RSd_P5IBc_destlim = {P5IBc_SEPX}*{P5IBc_NX}/2*connscale
float P23RSd_P5IBd_destlim = {P5IBd_SEPX}*{P5IBd_NX}/2*connscale
float P23RSd_B5FS_destlim = {B5FS_SEPX}*{B5FS_NX}/2*connscale
float P23RSd_P6RSa_destlim = {P6RSa_SEPX}*{P6RSa_NX}/2*connscale
float P23RSd_P6RSb_destlim = {P6RSb_SEPX}*{P6RSb_NX}/2*connscale
float P23RSd_P6RSc_destlim = {P6RSc_SEPX}*{P6RSc_NX}/2*connscale
float P23RSd_P6RSd_destlim = {P6RSd_SEPX}*{P6RSd_NX}/2*connscale
float P23RSd_C23FS_destlim = {C23FS_SEPX}*{C23FS_NX}/2*connscale
float P23RSd_C5FS_destlim = {C5FS_SEPX}*{C5FS_NX}/2*connscale
float P23RSd_ST4RS_destlim = {ST4RS_SEPX}*{ST4RS_NX}/2*connscale
float P23RSd_I23LTS_destlim = {I23LTS_SEPX}*{I23LTS_NX}/2*connscale
float P23RSd_I5LTS_destlim = {I5LTS_SEPX}*{I5LTS_NX}/2*connscale
float P23RSd_P23FRBa_destlim = {P23FRBa_SEPX}*{P23FRBa_NX}/2*connscale
float P23RSd_P5RSa_destlim = {P5RSa_SEPX}*{P5RSa_NX}/2*connscale

// Create network for P23RSd cells

include P23RSd_P23RSa.g
include P23RSd_P23RSb.g
include P23RSd_P23RSc.g
include P23RSd_P23RSd.g
include P23RSd_B23FS.g
include P23RSd_P5IBa.g
include P23RSd_P5IBb.g
include P23RSd_P5IBc.g
include P23RSd_P5IBd.g
include P23RSd_B5FS.g
include P23RSd_P6RSa.g
include P23RSd_P6RSb.g

if ({columntype == 0})

     include P23RSd_P6RSc.g
     include P23RSd_P6RSd.g

end

include P23RSd_C23FS.g
include P23RSd_C5FS.g
include P23RSd_ST4RS.g
include P23RSd_I23LTS.g
include P23RSd_I5LTS.g
include P23RSd_P23FRBa.g
include P23RSd_P5RSa.g

//B23FS spatial connection scales

float B23FS_P23RSa_destlim = {P23RSa_SEPX}*{P23RSa_NX}/2*connscale
float B23FS_P23RSb_destlim = {P23RSb_SEPX}*{P23RSb_NX}/2*connscale
float B23FS_P23RSc_destlim = {P23RSc_SEPX}*{P23RSc_NX}/2*connscale
float B23FS_P23RSd_destlim = {P23RSd_SEPX}*{P23RSd_NX}/2*connscale
float B23FS_B23FS_destlim = {B23FS_SEPX}*{B23FS_NX}/2*connscale
float B23FS_C23FS_destlim = {C23FS_SEPX}*{C23FS_NX}/2*connscale
float B23FS_ST4RS_destlim = {ST4RS_SEPX}*{ST4RS_NX}/2*connscale
float B23FS_I23LTS_destlim = {I23LTS_SEPX}*{I23LTS_NX}/2*connscale
float B23FS_P23FRBa_destlim = {P23FRBa_SEPX}*{P23FRBa_NX}/2*connscale

// Create network for B23FS cells

include B23FS_P23RSa.g
include B23FS_P23RSb.g
include B23FS_P23RSc.g
include B23FS_P23RSd.g
include B23FS_B23FS.g
include B23FS_C23FS.g
include B23FS_ST4RS.g
include B23FS_I23LTS.g
include B23FS_P23FRBa.g

//P5IBa spatial connection scales

float P5IBa_P23RSa_destlim = {P23RSa_SEPX}*{P23RSa_NX}/2*connscale
float P5IBa_P23RSb_destlim = {P23RSb_SEPX}*{P23RSb_NX}/2*connscale
float P5IBa_P23RSc_destlim = {P23RSc_SEPX}*{P23RSc_NX}/2*connscale
float P5IBa_P23RSd_destlim = {P23RSd_SEPX}*{P23RSd_NX}/2*connscale
float P5IBa_B23FS_destlim = {B23FS_SEPX}*{B23FS_NX}/2*connscale
float P5IBa_P5IBa_destlim = {P5IBa_SEPX}*{P5IBa_NX}/2*connscale
float P5IBa_P5IBb_destlim = {P5IBb_SEPX}*{P5IBb_NX}/2*connscale
float P5IBa_P5IBc_destlim = {P5IBc_SEPX}*{P5IBc_NX}/2*connscale
float P5IBa_P5IBd_destlim = {P5IBd_SEPX}*{P5IBd_NX}/2*connscale
float P5IBa_B5FS_destlim = {B5FS_SEPX}*{B5FS_NX}/2*connscale
float P5IBa_P6RSa_destlim = {P6RSa_SEPX}*{P6RSa_NX}/2*connscale
float P5IBa_P6RSb_destlim = {P6RSb_SEPX}*{P6RSb_NX}/2*connscale
float P5IBa_P6RSc_destlim = {P6RSc_SEPX}*{P6RSc_NX}/2*connscale
float P5IBa_P6RSd_destlim = {P6RSd_SEPX}*{P6RSd_NX}/2*connscale
float P5IBa_C23FS_destlim = {C23FS_SEPX}*{C23FS_NX}/2*connscale
float P5IBa_C5FS_destlim = {C5FS_SEPX}*{C5FS_NX}/2*connscale
float P5IBa_ST4RS_destlim = {ST4RS_SEPX}*{ST4RS_NX}/2*connscale
float P5IBa_I23LTS_destlim = {I23LTS_SEPX}*{I23LTS_NX}/2*connscale
float P5IBa_I5LTS_destlim = {I5LTS_SEPX}*{I5LTS_NX}/2*connscale
float P5IBa_P23FRBa_destlim = {P23FRBa_SEPX}*{P23FRBa_NX}/2*connscale
float P5IBa_P5RSa_destlim = {P5RSa_SEPX}*{P5RSa_NX}/2*connscale

// Create network for P5IBa cells

include P5IBa_P23RSa.g
include P5IBa_P23RSb.g
include P5IBa_P23RSc.g
include P5IBa_P23RSd.g
include P5IBa_B23FS.g
include P5IBa_P5IBa.g
include P5IBa_P5IBb.g
include P5IBa_P5IBc.g
include P5IBa_P5IBd.g
include P5IBa_B5FS.g
include P5IBa_P6RSa.g
include P5IBa_P6RSb.g

if ({columntype == 0})

     include P5IBa_P6RSc.g
     include P5IBa_P6RSd.g

end

include P5IBa_C23FS.g
include P5IBa_C5FS.g
include P5IBa_ST4RS.g
include P5IBa_I23LTS.g
include P5IBa_I5LTS.g
include P5IBa_P23FRBa.g
include P5IBa_P5RSa.g

//P5IBb spatial connection scales

float P5IBb_P23RSa_destlim = {P23RSa_SEPX}*{P23RSa_NX}/2*connscale
float P5IBb_P23RSb_destlim = {P23RSb_SEPX}*{P23RSb_NX}/2*connscale
float P5IBb_P23RSc_destlim = {P23RSc_SEPX}*{P23RSc_NX}/2*connscale
float P5IBb_P23RSd_destlim = {P23RSd_SEPX}*{P23RSd_NX}/2*connscale
float P5IBb_B23FS_destlim = {B23FS_SEPX}*{B23FS_NX}/2*connscale
float P5IBb_P5IBa_destlim = {P5IBa_SEPX}*{P5IBa_NX}/2*connscale
float P5IBb_P5IBb_destlim = {P5IBb_SEPX}*{P5IBb_NX}/2*connscale
float P5IBb_P5IBc_destlim = {P5IBc_SEPX}*{P5IBc_NX}/2*connscale
float P5IBb_P5IBd_destlim = {P5IBd_SEPX}*{P5IBd_NX}/2*connscale
float P5IBb_B5FS_destlim = {B5FS_SEPX}*{B5FS_NX}/2*connscale
float P5IBb_P6RSa_destlim = {P6RSa_SEPX}*{P6RSa_NX}/2*connscale
float P5IBb_P6RSb_destlim = {P6RSb_SEPX}*{P6RSb_NX}/2*connscale
float P5IBb_P6RSc_destlim = {P6RSc_SEPX}*{P6RSc_NX}/2*connscale
float P5IBb_P6RSd_destlim = {P6RSd_SEPX}*{P6RSd_NX}/2*connscale
float P5IBb_C23FS_destlim = {C23FS_SEPX}*{C23FS_NX}/2*connscale
float P5IBb_C5FS_destlim = {C5FS_SEPX}*{C5FS_NX}/2*connscale
float P5IBb_ST4RS_destlim = {ST4RS_SEPX}*{ST4RS_NX}/2*connscale
float P5IBb_I23LTS_destlim = {I23LTS_SEPX}*{I23LTS_NX}/2*connscale
float P5IBb_I5LTS_destlim = {I5LTS_SEPX}*{I5LTS_NX}/2*connscale
float P5IBb_P23FRBa_destlim = {P23FRBa_SEPX}*{P23FRBa_NX}/2*connscale
float P5IBb_P5RSa_destlim = {P5RSa_SEPX}*{P5RSa_NX}/2*connscale

// Create network for P5IBb cells

include P5IBb_P23RSa.g
include P5IBb_P23RSb.g
include P5IBb_P23RSc.g
include P5IBb_P23RSd.g
include P5IBb_B23FS.g
include P5IBb_P5IBa.g
include P5IBb_P5IBb.g
include P5IBb_P5IBc.g
include P5IBb_P5IBd.g
include P5IBb_B5FS.g
include P5IBb_P6RSa.g
include P5IBb_P6RSb.g

if ({columntype == 0})

     include P5IBb_P6RSc.g
     include P5IBb_P6RSd.g

end

include P5IBb_C23FS.g
include P5IBb_C5FS.g
include P5IBb_ST4RS.g
include P5IBb_I23LTS.g
include P5IBb_I5LTS.g
include P5IBb_P23FRBa.g
include P5IBb_P5RSa.g

//P5IBc spatial connection scales

float P5IBc_P23RSa_destlim = {P23RSa_SEPX}*{P23RSa_NX}/2*connscale
float P5IBc_P23RSb_destlim = {P23RSb_SEPX}*{P23RSb_NX}/2*connscale
float P5IBc_P23RSc_destlim = {P23RSc_SEPX}*{P23RSc_NX}/2*connscale
float P5IBc_P23RSd_destlim = {P23RSd_SEPX}*{P23RSd_NX}/2*connscale
float P5IBc_B23FS_destlim = {B23FS_SEPX}*{B23FS_NX}/2*connscale
float P5IBc_P5IBa_destlim = {P5IBa_SEPX}*{P5IBa_NX}/2*connscale
float P5IBc_P5IBb_destlim = {P5IBb_SEPX}*{P5IBb_NX}/2*connscale
float P5IBc_P5IBc_destlim = {P5IBc_SEPX}*{P5IBc_NX}/2*connscale
float P5IBc_P5IBd_destlim = {P5IBd_SEPX}*{P5IBd_NX}/2*connscale
float P5IBc_B5FS_destlim = {B5FS_SEPX}*{B5FS_NX}/2*connscale
float P5IBc_P6RSa_destlim = {P6RSa_SEPX}*{P6RSa_NX}/2*connscale
float P5IBc_P6RSb_destlim = {P6RSb_SEPX}*{P6RSb_NX}/2*connscale
float P5IBc_P6RSc_destlim = {P6RSc_SEPX}*{P6RSc_NX}/2*connscale
float P5IBc_P6RSd_destlim = {P6RSd_SEPX}*{P6RSd_NX}/2*connscale
float P5IBc_C23FS_destlim = {C23FS_SEPX}*{C23FS_NX}/2*connscale
float P5IBc_C5FS_destlim = {C5FS_SEPX}*{C5FS_NX}/2*connscale
float P5IBc_ST4RS_destlim = {ST4RS_SEPX}*{ST4RS_NX}/2*connscale
float P5IBc_I23LTS_destlim = {I23LTS_SEPX}*{I23LTS_NX}/2*connscale
float P5IBc_I5LTS_destlim = {I5LTS_SEPX}*{I5LTS_NX}/2*connscale
float P5IBc_P23FRBa_destlim = {P23FRBa_SEPX}*{P23FRBa_NX}/2*connscale
float P5IBc_P5RSa_destlim = {P5RSa_SEPX}*{P5RSa_NX}/2*connscale

// Create network for P5IBc cells

include P5IBc_P23RSa.g
include P5IBc_P23RSb.g
include P5IBc_P23RSc.g
include P5IBc_P23RSd.g
include P5IBc_B23FS.g
include P5IBc_P5IBa.g
include P5IBc_P5IBb.g
include P5IBc_P5IBc.g
include P5IBc_P5IBd.g
include P5IBc_B5FS.g
include P5IBc_P6RSa.g
include P5IBc_P6RSb.g

if ({columntype == 0})

     include P5IBc_P6RSc.g
     include P5IBc_P6RSd.g

end

include P5IBc_C23FS.g
include P5IBc_C5FS.g
include P5IBc_ST4RS.g
include P5IBc_I23LTS.g
include P5IBc_I5LTS.g
include P5IBc_P23FRBa.g
include P5IBc_P5RSa.g

//P5IBd spatial connection scales

float P5IBd_P23RSa_destlim = {P23RSa_SEPX}*{P23RSa_NX}/2*connscale
float P5IBd_P23RSb_destlim = {P23RSb_SEPX}*{P23RSb_NX}/2*connscale
float P5IBd_P23RSc_destlim = {P23RSc_SEPX}*{P23RSc_NX}/2*connscale
float P5IBd_P23RSd_destlim = {P23RSd_SEPX}*{P23RSd_NX}/2*connscale
float P5IBd_B23FS_destlim = {B23FS_SEPX}*{B23FS_NX}/2*connscale
float P5IBd_P5IBa_destlim = {P5IBa_SEPX}*{P5IBa_NX}/2*connscale
float P5IBd_P5IBb_destlim = {P5IBb_SEPX}*{P5IBb_NX}/2*connscale
float P5IBd_P5IBc_destlim = {P5IBc_SEPX}*{P5IBc_NX}/2*connscale
float P5IBd_P5IBd_destlim = {P5IBd_SEPX}*{P5IBd_NX}/2*connscale
float P5IBd_B5FS_destlim = {B5FS_SEPX}*{B5FS_NX}/2*connscale
float P5IBd_P6RSa_destlim = {P6RSa_SEPX}*{P6RSa_NX}/2*connscale
float P5IBd_P6RSb_destlim = {P6RSb_SEPX}*{P6RSb_NX}/2*connscale
float P5IBd_P6RSc_destlim = {P6RSc_SEPX}*{P6RSc_NX}/2*connscale
float P5IBd_P6RSd_destlim = {P6RSd_SEPX}*{P6RSd_NX}/2*connscale
float P5IBd_C23FS_destlim = {C23FS_SEPX}*{C23FS_NX}/2*connscale
float P5IBd_C5FS_destlim = {C5FS_SEPX}*{C5FS_NX}/2*connscale
float P5IBd_ST4RS_destlim = {ST4RS_SEPX}*{ST4RS_NX}/2*connscale
float P5IBd_I23LTS_destlim = {I23LTS_SEPX}*{I23LTS_NX}/2*connscale
float P5IBd_I5LTS_destlim = {I5LTS_SEPX}*{I5LTS_NX}/2*connscale
float P5IBd_P23FRBa_destlim = {P23FRBa_SEPX}*{P23FRBa_NX}/2*connscale
float P5IBd_P5RSa_destlim = {P5RSa_SEPX}*{P5RSa_NX}/2*connscale

// Create network for P5IBd cells

include P5IBd_P23RSa.g
include P5IBd_P23RSb.g
include P5IBd_P23RSc.g
include P5IBd_P23RSd.g
include P5IBd_B23FS.g
include P5IBd_P5IBa.g
include P5IBd_P5IBb.g
include P5IBd_P5IBc.g
include P5IBd_P5IBd.g
include P5IBd_B5FS.g
include P5IBd_P6RSa.g
include P5IBd_P6RSb.g

if ({columntype == 0})

     include P5IBd_P6RSc.g
     include P5IBd_P6RSd.g

end

include P5IBd_C23FS.g
include P5IBd_C5FS.g
include P5IBd_ST4RS.g
include P5IBd_I23LTS.g
include P5IBd_I5LTS.g
include P5IBd_P23FRBa.g
include P5IBd_P5RSa.g

//B5FS spatial connection scales

float B5FS_P5IBa_destlim = {P5IBa_SEPX}*{P5IBa_NX}/2*connscale
float B5FS_P5IBb_destlim = {P5IBb_SEPX}*{P5IBb_NX}/2*connscale
float B5FS_P5IBc_destlim = {P5IBc_SEPX}*{P5IBc_NX}/2*connscale
float B5FS_P5IBd_destlim = {P5IBd_SEPX}*{P5IBd_NX}/2*connscale
float B5FS_B5FS_destlim = {B5FS_SEPX}*{B5FS_NX}/2*connscale
float B5FS_P6RSa_destlim = {P6RSa_SEPX}*{P6RSa_NX}/2*connscale
float B5FS_P6RSb_destlim = {P6RSb_SEPX}*{P6RSb_NX}/2*connscale
float B5FS_P6RSc_destlim = {P6RSc_SEPX}*{P6RSc_NX}/2*connscale
float B5FS_P6RSd_destlim = {P6RSd_SEPX}*{P6RSd_NX}/2*connscale
float B5FS_C5FS_destlim = {C5FS_SEPX}*{C5FS_NX}/2*connscale
float B5FS_ST4RS_destlim = {ST4RS_SEPX}*{ST4RS_NX}/2*connscale
float B5FS_I5LTS_destlim = {I5LTS_SEPX}*{I5LTS_NX}/2*connscale
float B5FS_P5RSa_destlim = {P5RSa_SEPX}*{P5RSa_NX}/2*connscale

// Create network for B5FS cells

include B5FS_P5IBa.g
include B5FS_P5IBb.g
include B5FS_P5IBc.g
include B5FS_P5IBd.g
include B5FS_B5FS.g
include B5FS_P6RSa.g
include B5FS_P6RSb.g

if ({columntype == 0})

     include B5FS_P6RSc.g
     include B5FS_P6RSd.g

end

include B5FS_C5FS.g
include B5FS_ST4RS.g
include B5FS_I5LTS.g
include B5FS_P5RSa.g

//P6RSa spatial connection scales

float P6RSa_P23RSa_destlim = {P23RSa_SEPX}*{P23RSa_NX}/2*connscale
float P6RSa_P23RSb_destlim = {P23RSb_SEPX}*{P23RSb_NX}/2*connscale
float P6RSa_P23RSc_destlim = {P23RSc_SEPX}*{P23RSc_NX}/2*connscale
float P6RSa_P23RSd_destlim = {P23RSd_SEPX}*{P23RSd_NX}/2*connscale
float P6RSa_B23FS_destlim = {B23FS_SEPX}*{B23FS_NX}/2*connscale
float P6RSa_P5IBa_destlim = {P5IBa_SEPX}*{P5IBa_NX}/2*connscale
float P6RSa_P5IBb_destlim = {P5IBb_SEPX}*{P5IBb_NX}/2*connscale
float P6RSa_P5IBc_destlim = {P5IBc_SEPX}*{P5IBc_NX}/2*connscale
float P6RSa_P5IBd_destlim = {P5IBd_SEPX}*{P5IBd_NX}/2*connscale
float P6RSa_B5FS_destlim = {B5FS_SEPX}*{B5FS_NX}/2*connscale
float P6RSa_P6RSa_destlim = {P6RSa_SEPX}*{P6RSa_NX}/2*connscale
float P6RSa_P6RSb_destlim = {P6RSb_SEPX}*{P6RSb_NX}/2*connscale
float P6RSa_P6RSc_destlim = {P6RSc_SEPX}*{P6RSc_NX}/2*connscale
float P6RSa_P6RSd_destlim = {P6RSd_SEPX}*{P6RSd_NX}/2*connscale
float P6RSa_C23FS_destlim = {C23FS_SEPX}*{C23FS_NX}/2*connscale
float P6RSa_C5FS_destlim = {C5FS_SEPX}*{C5FS_NX}/2*connscale
float P6RSa_ST4RS_destlim = {ST4RS_SEPX}*{ST4RS_NX}/2*connscale
float P6RSa_I23LTS_destlim = {I23LTS_SEPX}*{I23LTS_NX}/2*connscale
float P6RSa_I5LTS_destlim = {I5LTS_SEPX}*{I5LTS_NX}/2*connscale
float P6RSa_TCR_destlim = {TCR_SEPX}*{TCR_NX}/2*connscale
float P6RSa_nRT_destlim = {nRT_SEPX}*{nRT_NX}/2*connscale
float P6RSa_P23FRBa_destlim = {P23FRBa_SEPX}*{P23FRBa_NX}/2*connscale
float P6RSa_P5RSa_destlim = {P5RSa_SEPX}*{P5RSa_NX}/2*connscale

// Create network for P6RSa cells

include P6RSa_P23RSa.g
include P6RSa_P23RSb.g
include P6RSa_P23RSc.g
include P6RSa_P23RSd.g
include P6RSa_B23FS.g
include P6RSa_P5IBa.g
include P6RSa_P5IBb.g
include P6RSa_P5IBc.g
include P6RSa_P5IBd.g
include P6RSa_B5FS.g
include P6RSa_P6RSa.g
include P6RSa_P6RSb.g

if ({columntype == 0})

     include P6RSa_P6RSc.g
     include P6RSa_P6RSd.g

end

include P6RSa_C23FS.g
include P6RSa_C5FS.g
include P6RSa_ST4RS.g
include P6RSa_I23LTS.g
include P6RSa_I5LTS.g

if ({thalamocortical == 1})
     include P6RSa_TCR.g
     include P6RSa_nRT.g
end

include P6RSa_P23FRBa.g
include P6RSa_P5RSa.g

//P6RSb spatial connection scales

float P6RSb_P23RSa_destlim = {P23RSa_SEPX}*{P23RSa_NX}/2*connscale
float P6RSb_P23RSb_destlim = {P23RSb_SEPX}*{P23RSb_NX}/2*connscale
float P6RSb_P23RSc_destlim = {P23RSc_SEPX}*{P23RSc_NX}/2*connscale
float P6RSb_P23RSd_destlim = {P23RSd_SEPX}*{P23RSd_NX}/2*connscale
float P6RSb_B23FS_destlim = {B23FS_SEPX}*{B23FS_NX}/2*connscale
float P6RSb_P5IBa_destlim = {P5IBa_SEPX}*{P5IBa_NX}/2*connscale
float P6RSb_P5IBb_destlim = {P5IBb_SEPX}*{P5IBb_NX}/2*connscale
float P6RSb_P5IBc_destlim = {P5IBc_SEPX}*{P5IBc_NX}/2*connscale
float P6RSb_P5IBd_destlim = {P5IBd_SEPX}*{P5IBd_NX}/2*connscale
float P6RSb_B5FS_destlim = {B5FS_SEPX}*{B5FS_NX}/2*connscale
float P6RSb_P6RSa_destlim = {P6RSa_SEPX}*{P6RSa_NX}/2*connscale
float P6RSb_P6RSb_destlim = {P6RSb_SEPX}*{P6RSb_NX}/2*connscale
float P6RSb_P6RSc_destlim = {P6RSc_SEPX}*{P6RSc_NX}/2*connscale
float P6RSb_P6RSd_destlim = {P6RSd_SEPX}*{P6RSd_NX}/2*connscale
float P6RSb_C23FS_destlim = {C23FS_SEPX}*{C23FS_NX}/2*connscale
float P6RSb_C5FS_destlim = {C5FS_SEPX}*{C5FS_NX}/2*connscale
float P6RSb_ST4RS_destlim = {ST4RS_SEPX}*{ST4RS_NX}/2*connscale
float P6RSb_I23LTS_destlim = {I23LTS_SEPX}*{I23LTS_NX}/2*connscale
float P6RSb_I5LTS_destlim = {I5LTS_SEPX}*{I5LTS_NX}/2*connscale
float P6RSb_TCR_destlim = {TCR_SEPX}*{TCR_NX}/2*connscale
float P6RSb_nRT_destlim = {nRT_SEPX}*{nRT_NX}/2*connscale
float P6RSb_P23FRBa_destlim = {P23FRBa_SEPX}*{P23FRBa_NX}/2*connscale
float P6RSb_P5RSa_destlim = {P5RSa_SEPX}*{P5RSa_NX}/2*connscale

// Create network for P6RSb cells

include P6RSb_P23RSa.g
include P6RSb_P23RSb.g
include P6RSb_P23RSc.g
include P6RSb_P23RSd.g
include P6RSb_B23FS.g
include P6RSb_P5IBa.g
include P6RSb_P5IBb.g
include P6RSb_P5IBc.g
include P6RSb_P5IBd.g
include P6RSb_B5FS.g
include P6RSb_P6RSa.g
include P6RSb_P6RSb.g

if ({columntype == 0})

     include P6RSb_P6RSc.g
     include P6RSb_P6RSd.g

end

include P6RSb_C23FS.g
include P6RSb_C5FS.g
include P6RSb_ST4RS.g
include P6RSb_I23LTS.g
include P6RSb_I5LTS.g

if ({thalamocortical == 1})
     include P6RSb_TCR.g
     include P6RSb_nRT.g
end

include P6RSb_P23FRBa.g
include P6RSb_P5RSa.g

//P6RSc spatial connection scales

float P6RSc_P23RSa_destlim = {P23RSa_SEPX}*{P23RSa_NX}/2*connscale
float P6RSc_P23RSb_destlim = {P23RSb_SEPX}*{P23RSb_NX}/2*connscale
float P6RSc_P23RSc_destlim = {P23RSc_SEPX}*{P23RSc_NX}/2*connscale
float P6RSc_P23RSd_destlim = {P23RSd_SEPX}*{P23RSd_NX}/2*connscale
float P6RSc_B23FS_destlim = {B23FS_SEPX}*{B23FS_NX}/2*connscale
float P6RSc_P5IBa_destlim = {P5IBa_SEPX}*{P5IBa_NX}/2*connscale
float P6RSc_P5IBb_destlim = {P5IBb_SEPX}*{P5IBb_NX}/2*connscale
float P6RSc_P5IBc_destlim = {P5IBc_SEPX}*{P5IBc_NX}/2*connscale
float P6RSc_P5IBd_destlim = {P5IBd_SEPX}*{P5IBd_NX}/2*connscale
float P6RSc_B5FS_destlim = {B5FS_SEPX}*{B5FS_NX}/2*connscale
float P6RSc_P6RSa_destlim = {P6RSa_SEPX}*{P6RSa_NX}/2*connscale
float P6RSc_P6RSb_destlim = {P6RSb_SEPX}*{P6RSb_NX}/2*connscale
float P6RSc_P6RSc_destlim = {P6RSc_SEPX}*{P6RSc_NX}/2*connscale
float P6RSc_P6RSd_destlim = {P6RSd_SEPX}*{P6RSd_NX}/2*connscale
float P6RSc_C23FS_destlim = {C23FS_SEPX}*{C23FS_NX}/2*connscale
float P6RSc_C5FS_destlim = {C5FS_SEPX}*{C5FS_NX}/2*connscale
float P6RSc_ST4RS_destlim = {ST4RS_SEPX}*{ST4RS_NX}/2*connscale
float P6RSc_I23LTS_destlim = {I23LTS_SEPX}*{I23LTS_NX}/2*connscale
float P6RSc_I5LTS_destlim = {I5LTS_SEPX}*{I5LTS_NX}/2*connscale
float P6RSc_TCR_destlim = {TCR_SEPX}*{TCR_NX}/2*connscale
float P6RSc_nRT_destlim = {nRT_SEPX}*{nRT_NX}/2*connscale
float P6RSc_P23FRBa_destlim = {P23FRBa_SEPX}*{P23FRBa_NX}/2*connscale
float P6RSc_P5RSa_destlim = {P5RSa_SEPX}*{P5RSa_NX}/2*connscale

// Create network for P6RSc cells

if ({columntype == 0})

     include P6RSc_P23RSa.g
     include P6RSc_P23RSb.g
     include P6RSc_P23RSc.g
     include P6RSc_P23RSd.g
     include P6RSc_B23FS.g
     include P6RSc_P5IBa.g
     include P6RSc_P5IBb.g
     include P6RSc_P5IBc.g
     include P6RSc_P5IBd.g
     include P6RSc_B5FS.g
     include P6RSc_P6RSa.g
     include P6RSc_P6RSb.g
     include P6RSc_P6RSc.g
     include P6RSc_P6RSd.g
     include P6RSc_C23FS.g
     include P6RSc_C5FS.g
     include P6RSc_ST4RS.g
     include P6RSc_I23LTS.g
     include P6RSc_I5LTS.g

     if ({thalamocortical == 1})
          include P6RSc_TCR.g
          include P6RSc_nRT.g
     end

     include P6RSc_P23FRBa.g
     include P6RSc_P5RSa.g

end

//P6RSd spatial connection scales

float P6RSd_P23RSa_destlim = {P23RSa_SEPX}*{P23RSa_NX}/2*connscale
float P6RSd_P23RSb_destlim = {P23RSb_SEPX}*{P23RSb_NX}/2*connscale
float P6RSd_P23RSc_destlim = {P23RSc_SEPX}*{P23RSc_NX}/2*connscale
float P6RSd_P23RSd_destlim = {P23RSd_SEPX}*{P23RSd_NX}/2*connscale
float P6RSd_B23FS_destlim = {B23FS_SEPX}*{B23FS_NX}/2*connscale
float P6RSd_P5IBa_destlim = {P5IBa_SEPX}*{P5IBa_NX}/2*connscale
float P6RSd_P5IBb_destlim = {P5IBb_SEPX}*{P5IBb_NX}/2*connscale
float P6RSd_P5IBc_destlim = {P5IBc_SEPX}*{P5IBc_NX}/2*connscale
float P6RSd_P5IBd_destlim = {P5IBd_SEPX}*{P5IBd_NX}/2*connscale
float P6RSd_B5FS_destlim = {B5FS_SEPX}*{B5FS_NX}/2*connscale
float P6RSd_P6RSa_destlim = {P6RSa_SEPX}*{P6RSa_NX}/2*connscale
float P6RSd_P6RSb_destlim = {P6RSb_SEPX}*{P6RSb_NX}/2*connscale
float P6RSd_P6RSc_destlim = {P6RSc_SEPX}*{P6RSc_NX}/2*connscale
float P6RSd_P6RSd_destlim = {P6RSd_SEPX}*{P6RSd_NX}/2*connscale
float P6RSd_C23FS_destlim = {C23FS_SEPX}*{C23FS_NX}/2*connscale
float P6RSd_C5FS_destlim = {C5FS_SEPX}*{C5FS_NX}/2*connscale
float P6RSd_ST4RS_destlim = {ST4RS_SEPX}*{ST4RS_NX}/2*connscale
float P6RSd_I23LTS_destlim = {I23LTS_SEPX}*{I23LTS_NX}/2*connscale
float P6RSd_I5LTS_destlim = {I5LTS_SEPX}*{I5LTS_NX}/2*connscale
float P6RSd_TCR_destlim = {TCR_SEPX}*{TCR_NX}/2*connscale
float P6RSd_nRT_destlim = {nRT_SEPX}*{nRT_NX}/2*connscale
float P6RSd_P23FRBa_destlim = {P23FRBa_SEPX}*{P23FRBa_NX}/2*connscale
float P6RSd_P5RSa_destlim = {P5RSa_SEPX}*{P5RSa_NX}/2*connscale

// Create network for P6RSd cells

if ({columntype == 0})

     include P6RSd_P23RSa.g
     include P6RSd_P23RSb.g
     include P6RSd_P23RSc.g
     include P6RSd_P23RSd.g
     include P6RSd_B23FS.g
     include P6RSd_P5IBa.g
     include P6RSd_P5IBb.g
     include P6RSd_P5IBc.g
     include P6RSd_P5IBd.g
     include P6RSd_B5FS.g
     include P6RSd_P6RSa.g
     include P6RSd_P6RSb.g
     include P6RSd_P6RSc.g
     include P6RSd_P6RSd.g
     include P6RSd_C23FS.g
     include P6RSd_C5FS.g
     include P6RSd_ST4RS.g
     include P6RSd_I23LTS.g
     include P6RSd_I5LTS.g

     if ({thalamocortical == 1})
          include P6RSd_TCR.g
          include P6RSd_nRT.g 
     end

     include P6RSd_P23FRBa.g
     include P6RSd_P5RSa.g

end

//C23FS spatial connection scales

float C23FS_P23RSa_destlim = {P23RSa_SEPX}*{P23RSa_NX}/2*connscale
float C23FS_P23RSb_destlim = {P23RSb_SEPX}*{P23RSb_NX}/2*connscale
float C23FS_P23RSc_destlim = {P23RSc_SEPX}*{P23RSc_NX}/2*connscale
float C23FS_P23RSd_destlim = {P23RSd_SEPX}*{P23RSd_NX}/2*connscale
float C23FS_P5IBa_destlim = {P5IBa_SEPX}*{P5IBa_NX}/2*connscale
float C23FS_P5IBb_destlim = {P5IBb_SEPX}*{P5IBb_NX}/2*connscale
float C23FS_P5IBc_destlim = {P5IBc_SEPX}*{P5IBc_NX}/2*connscale
float C23FS_P5IBd_destlim = {P5IBd_SEPX}*{P5IBd_NX}/2*connscale
float C23FS_P6RSa_destlim = {P6RSa_SEPX}*{P6RSa_NX}/2*connscale
float C23FS_P6RSb_destlim = {P6RSb_SEPX}*{P6RSb_NX}/2*connscale
float C23FS_P6RSc_destlim = {P6RSc_SEPX}*{P6RSc_NX}/2*connscale
float C23FS_P6RSd_destlim = {P6RSd_SEPX}*{P6RSd_NX}/2*connscale
float C23FS_ST4RS_destlim = {ST4RS_SEPX}*{ST4RS_NX}/2*connscale
float C23FS_P23FRBa_destlim = {P23FRBa_SEPX}*{P23FRBa_NX}/2*connscale
float C23FS_P5RSa_destlim = {P5RSa_SEPX}*{P5RSa_NX}/2*connscale

// Create network for C23FS cells

include C23FS_P23RSa.g
include C23FS_P23RSb.g
include C23FS_P23RSc.g
include C23FS_P23RSd.g
include C23FS_P5IBa.g
include C23FS_P5IBb.g
include C23FS_P5IBc.g
include C23FS_P5IBd.g
include C23FS_P6RSa.g
include C23FS_P6RSb.g

if ({columntype == 0})

     include C23FS_P6RSc.g
     include C23FS_P6RSd.g

end

include C23FS_ST4RS.g
include C23FS_P23FRBa.g
include C23FS_P5RSa.g

//C5FS spatial connection scales

float C5FS_P23RSa_destlim = {P23RSa_SEPX}*{P23RSa_NX}/2*connscale
float C5FS_P23RSb_destlim = {P23RSb_SEPX}*{P23RSb_NX}/2*connscale
float C5FS_P23RSc_destlim = {P23RSc_SEPX}*{P23RSc_NX}/2*connscale
float C5FS_P23RSd_destlim = {P23RSd_SEPX}*{P23RSd_NX}/2*connscale
float C5FS_P5IBa_destlim = {P5IBa_SEPX}*{P5IBa_NX}/2*connscale
float C5FS_P5IBb_destlim = {P5IBb_SEPX}*{P5IBb_NX}/2*connscale
float C5FS_P5IBc_destlim = {P5IBc_SEPX}*{P5IBc_NX}/2*connscale
float C5FS_P5IBd_destlim = {P5IBd_SEPX}*{P5IBd_NX}/2*connscale
float C5FS_P6RSa_destlim = {P6RSa_SEPX}*{P6RSa_NX}/2*connscale
float C5FS_P6RSb_destlim = {P6RSb_SEPX}*{P6RSb_NX}/2*connscale
float C5FS_P6RSc_destlim = {P6RSc_SEPX}*{P6RSc_NX}/2*connscale
float C5FS_P6RSd_destlim = {P6RSd_SEPX}*{P6RSd_NX}/2*connscale
float C5FS_ST4RS_destlim = {ST4RS_SEPX}*{ST4RS_NX}/2*connscale
float C5FS_P23FRBa_destlim = {P23FRBa_SEPX}*{P23FRBa_NX}/2*connscale
float C5FS_P5RSa_destlim = {P5RSa_SEPX}*{P5RSa_NX}/2*connscale

// Create network for C5FS cells

include C5FS_P23RSa.g
include C5FS_P23RSb.g
include C5FS_P23RSc.g
include C5FS_P23RSd.g
include C5FS_P5IBa.g
include C5FS_P5IBb.g
include C5FS_P5IBc.g
include C5FS_P5IBd.g
include C5FS_P6RSa.g
include C5FS_P6RSb.g

if ({columntype == 0})

     include C5FS_P6RSc.g
     include C5FS_P6RSd.g

end

include C5FS_ST4RS.g
include C5FS_P23FRBa.g
include C5FS_P5RSa.g

//ST4RS spatial connection scales

float ST4RS_P23RSa_destlim = {P23RSa_SEPX}*{P23RSa_NX}/2*connscale
float ST4RS_P23RSb_destlim = {P23RSb_SEPX}*{P23RSb_NX}/2*connscale
float ST4RS_P23RSc_destlim = {P23RSc_SEPX}*{P23RSc_NX}/2*connscale
float ST4RS_P23RSd_destlim = {P23RSd_SEPX}*{P23RSd_NX}/2*connscale
float ST4RS_B23FS_destlim = {B23FS_SEPX}*{B23FS_NX}/2*connscale
float ST4RS_P5IBa_destlim = {P5IBa_SEPX}*{P5IBa_NX}/2*connscale
float ST4RS_P5IBb_destlim = {P5IBb_SEPX}*{P5IBb_NX}/2*connscale
float ST4RS_P5IBc_destlim = {P5IBc_SEPX}*{P5IBc_NX}/2*connscale
float ST4RS_P5IBd_destlim = {P5IBd_SEPX}*{P5IBd_NX}/2*connscale
float ST4RS_B5FS_destlim = {B5FS_SEPX}*{B5FS_NX}/2*connscale
float ST4RS_P6RSa_destlim = {P6RSa_SEPX}*{P6RSa_NX}/2*connscale
float ST4RS_P6RSb_destlim = {P6RSb_SEPX}*{P6RSb_NX}/2*connscale
float ST4RS_P6RSc_destlim = {P6RSc_SEPX}*{P6RSc_NX}/2*connscale
float ST4RS_P6RSd_destlim = {P6RSd_SEPX}*{P6RSd_NX}/2*connscale
float ST4RS_C23FS_destlim = {C23FS_SEPX}*{C23FS_NX}/2*connscale
float ST4RS_C5FS_destlim = {C5FS_SEPX}*{C5FS_NX}/2*connscale
float ST4RS_ST4RS_destlim = {ST4RS_SEPX}*{ST4RS_NX}/2*connscale
float ST4RS_I23LTS_destlim = {I23LTS_SEPX}*{I23LTS_NX}/2*connscale
float ST4RS_I5LTS_destlim = {I5LTS_SEPX}*{I5LTS_NX}/2*connscale
float ST4RS_P23FRBa_destlim = {P23FRBa_SEPX}*{P23FRBa_NX}/2*connscale
float ST4RS_P5RSa_destlim = {P5RSa_SEPX}*{P5RSa_NX}/2*connscale

//Create network for ST4RS cells

include ST4RS_P23RSa.g
include ST4RS_P23RSb.g
include ST4RS_P23RSc.g
include ST4RS_P23RSd.g
include ST4RS_B23FS.g
include ST4RS_P5IBa.g
include ST4RS_P5IBb.g
include ST4RS_P5IBc.g
include ST4RS_P5IBd.g
include ST4RS_B5FS.g
include ST4RS_P6RSa.g
include ST4RS_P6RSb.g

if ({columntype == 0})

     include ST4RS_P6RSc.g
     include ST4RS_P6RSd.g

end

include ST4RS_C23FS.g
include ST4RS_C5FS.g
include ST4RS_ST4RS.g
include ST4RS_I23LTS.g
include ST4RS_I5LTS.g
include ST4RS_P23FRBa.g
include ST4RS_P5RSa.g

//I23LTS spatial connection scales

float I23LTS_P23RSa_destlim = {P23RSa_SEPX}*{P23RSa_NX}/2*connscale
float I23LTS_P23RSb_destlim = {P23RSb_SEPX}*{P23RSb_NX}/2*connscale
float I23LTS_P23RSc_destlim = {P23RSc_SEPX}*{P23RSc_NX}/2*connscale
float I23LTS_P23RSd_destlim = {P23RSd_SEPX}*{P23RSd_NX}/2*connscale
float I23LTS_B23FS_destlim = {B23FS_SEPX}*{B23FS_NX}/2*connscale
float I23LTS_P5IBa_destlim = {P5IBa_SEPX}*{P5IBa_NX}/2*connscale
float I23LTS_P5IBb_destlim = {P5IBb_SEPX}*{P5IBb_NX}/2*connscale
float I23LTS_P5IBc_destlim = {P5IBc_SEPX}*{P5IBc_NX}/2*connscale
float I23LTS_P5IBd_destlim = {P5IBd_SEPX}*{P5IBd_NX}/2*connscale
float I23LTS_B5FS_destlim = {B5FS_SEPX}*{B5FS_NX}/2*connscale
float I23LTS_P6RSa_destlim = {P6RSa_SEPX}*{P6RSa_NX}/2*connscale
float I23LTS_P6RSb_destlim = {P6RSb_SEPX}*{P6RSb_NX}/2*connscale
float I23LTS_P6RSc_destlim = {P6RSc_SEPX}*{P6RSc_NX}/2*connscale
float I23LTS_P6RSd_destlim = {P6RSd_SEPX}*{P6RSd_NX}/2*connscale
float I23LTS_C23FS_destlim = {C23FS_SEPX}*{C23FS_NX}/2*connscale
float I23LTS_C5FS_destlim = {C5FS_SEPX}*{C5FS_NX}/2*connscale
float I23LTS_ST4RS_destlim = {ST4RS_SEPX}*{ST4RS_NX}/2*connscale
float I23LTS_I23LTS_destlim = {I23LTS_SEPX}*{I23LTS_NX}/2*connscale
float I23LTS_I5LTS_destlim = {I5LTS_SEPX}*{I5LTS_NX}/2*connscale
float I23LTS_P23FRBa_destlim = {P23FRBa_SEPX}*{P23FRBa_NX}/2*connscale
float I23LTS_P5RSa_destlim = {P5RSa_SEPX}*{P5RSa_NX}/2*connscale

//Create network for I23LTS cells

include I23LTS_P23RSa.g
include I23LTS_P23RSb.g
include I23LTS_P23RSc.g
include I23LTS_P23RSd.g
include I23LTS_B23FS.g
include I23LTS_P5IBa.g
include I23LTS_P5IBb.g
include I23LTS_P5IBc.g
include I23LTS_P5IBd.g
include I23LTS_B5FS.g
include I23LTS_P6RSa.g
include I23LTS_P6RSb.g

if ({columntype == 0})

     include I23LTS_P6RSc.g
     include I23LTS_P6RSd.g

end

include I23LTS_C23FS.g
include I23LTS_C5FS.g
include I23LTS_ST4RS.g
include I23LTS_I23LTS.g
include I23LTS_I5LTS.g
include I23LTS_P23FRBa.g
include I23LTS_P5RSa.g

//I5LTS spatial connection scales

float I5LTS_P23RSa_destlim = {P23RSa_SEPX}*{P23RSa_NX}/2*connscale
float I5LTS_P23RSb_destlim = {P23RSb_SEPX}*{P23RSb_NX}/2*connscale
float I5LTS_P23RSc_destlim = {P23RSc_SEPX}*{P23RSc_NX}/2*connscale
float I5LTS_P23RSd_destlim = {P23RSd_SEPX}*{P23RSd_NX}/2*connscale
float I5LTS_B23FS_destlim = {B23FS_SEPX}*{B23FS_NX}/2*connscale
float I5LTS_P5IBa_destlim = {P5IBa_SEPX}*{P5IBa_NX}/2*connscale
float I5LTS_P5IBb_destlim = {P5IBb_SEPX}*{P5IBb_NX}/2*connscale
float I5LTS_P5IBc_destlim = {P5IBc_SEPX}*{P5IBc_NX}/2*connscale
float I5LTS_P5IBd_destlim = {P5IBd_SEPX}*{P5IBd_NX}/2*connscale
float I5LTS_B5FS_destlim = {B5FS_SEPX}*{B5FS_NX}/2*connscale
float I5LTS_P6RSa_destlim = {P6RSa_SEPX}*{P6RSa_NX}/2*connscale
float I5LTS_P6RSb_destlim = {P6RSb_SEPX}*{P6RSb_NX}/2*connscale
float I5LTS_P6RSc_destlim = {P6RSc_SEPX}*{P6RSc_NX}/2*connscale
float I5LTS_P6RSd_destlim = {P6RSd_SEPX}*{P6RSd_NX}/2*connscale
float I5LTS_C23FS_destlim = {C23FS_SEPX}*{C23FS_NX}/2*connscale
float I5LTS_C5FS_destlim = {C5FS_SEPX}*{C5FS_NX}/2*connscale
float I5LTS_ST4RS_destlim = {ST4RS_SEPX}*{ST4RS_NX}/2*connscale
float I5LTS_I23LTS_destlim = {I23LTS_SEPX}*{I23LTS_NX}/2*connscale
float I5LTS_I5LTS_destlim = {I5LTS_SEPX}*{I5LTS_NX}/2*connscale
float I5LTS_P23FRBa_destlim = {P23FRBa_SEPX}*{P23FRBa_NX}/2*connscale
float I5LTS_P5RSa_destlim = {P5RSa_SEPX}*{P5RSa_NX}/2*connscale

//Create network for I5LTS cells

include I5LTS_P23RSa.g
include I5LTS_P23RSb.g
include I5LTS_P23RSc.g
include I5LTS_P23RSd.g
include I5LTS_B23FS.g
include I5LTS_P5IBa.g
include I5LTS_P5IBb.g
include I5LTS_P5IBc.g
include I5LTS_P5IBd.g
include I5LTS_B5FS.g
include I5LTS_P6RSa.g
include I5LTS_P6RSb.g

if ({columntype == 0})

     include I5LTS_P6RSc.g
     include I5LTS_P6RSd.g

end

include I5LTS_C23FS.g
include I5LTS_C5FS.g
include I5LTS_ST4RS.g
include I5LTS_I23LTS.g
include I5LTS_I5LTS.g
include I5LTS_P23FRBa.g
include I5LTS_P5RSa.g

//TCR spatial connection scales

float TCR_P23RSa_destlim = {P23RSa_SEPX}*{P23RSa_NX}/2*connscale
float TCR_P23RSb_destlim = {P23RSb_SEPX}*{P23RSb_NX}/2*connscale
float TCR_P23RSc_destlim = {P23RSc_SEPX}*{P23RSc_NX}/2*connscale
float TCR_P23RSd_destlim = {P23RSd_SEPX}*{P23RSd_NX}/2*connscale
float TCR_B23FS_destlim = {B23FS_SEPX}*{B23FS_NX}/2*connscale
float TCR_P5IBa_destlim = {P5IBa_SEPX}*{P5IBa_NX}/2*connscale
float TCR_P5IBb_destlim = {P5IBb_SEPX}*{P5IBb_NX}/2*connscale
float TCR_P5IBc_destlim = {P5IBc_SEPX}*{P5IBc_NX}/2*connscale
float TCR_P5IBd_destlim = {P5IBd_SEPX}*{P5IBd_NX}/2*connscale
float TCR_B5FS_destlim = {B5FS_SEPX}*{B5FS_NX}/2*connscale
float TCR_P6RSa_destlim = {P6RSa_SEPX}*{P6RSa_NX}/2*connscale
float TCR_P6RSb_destlim = {P6RSb_SEPX}*{P6RSb_NX}/2*connscale
float TCR_P6RSc_destlim = {P6RSc_SEPX}*{P6RSc_NX}/2*connscale
float TCR_P6RSd_destlim = {P6RSd_SEPX}*{P6RSd_NX}/2*connscale
float TCR_C23FS_destlim = {C23FS_SEPX}*{C23FS_NX}/2*connscale
float TCR_C5FS_destlim = {C5FS_SEPX}*{C5FS_NX}/2*connscale
float TCR_ST4RS_destlim = {ST4RS_SEPX}*{ST4RS_NX}/2*connscale
float TCR_nRT_destlim = {nRT_SEPX}*{nRT_NX}/2*connscale
float TCR_P23FRBa_destlim = {P23FRBa_SEPX}*{P23FRBa_NX}/2*connscale
float TCR_P5RSa_destlim = {P5RSa_SEPX}*{P5RSa_NX}/2*connscale

//Create network for TCR cells

if ({thalamocortical == 1})

     include TCR_P23RSa.g
     include TCR_P23RSb.g
     include TCR_P23RSc.g
     include TCR_P23RSd.g
     include TCR_B23FS.g
     include TCR_P5IBa.g
     include TCR_P5IBb.g
     include TCR_P5IBc.g
     include TCR_P5IBd.g
     include TCR_B5FS.g 
     include TCR_P6RSa.g
     include TCR_P6RSb.g

     if ({columntype == 0})

          include TCR_P6RSc.g
          include TCR_P6RSd.g

     end

     include TCR_C23FS.g
     include TCR_C5FS.g
     include TCR_ST4RS.g
     include TCR_nRT.g
     include TCR_P23FRBa.g
     include TCR_P5RSa.g

end

//nRT spatial connection scales

float nRT_TCR_destlim = {TCR_SEPX}*{TCR_NX}/2*connscale
float nRT_nRT_destlim = {nRT_SEPX}*{nRT_NX}/2*connscale

//Create network for nRT cells

if ({thalamocortical == 1})

     include nRT_TCR.g
     include nRT_nRT.g

end

//P23FRBa spatial connection scales

float P23FRBa_P23RSa_destlim = {P23RSa_SEPX}*{P23RSa_NX}/2*connscale
float P23FRBa_P23RSb_destlim = {P23RSb_SEPX}*{P23RSb_NX}/2*connscale
float P23FRBa_P23RSc_destlim = {P23RSc_SEPX}*{P23RSc_NX}/2*connscale
float P23FRBa_P23RSd_destlim = {P23RSd_SEPX}*{P23RSd_NX}/2*connscale
float P23FRBa_B23FS_destlim = {B23FS_SEPX}*{B23FS_NX}/2*connscale
float P23FRBa_P5IBa_destlim = {P5IBa_SEPX}*{P5IBa_NX}/2*connscale
float P23FRBa_P5IBb_destlim = {P5IBb_SEPX}*{P5IBb_NX}/2*connscale
float P23FRBa_P5IBc_destlim = {P5IBc_SEPX}*{P5IBc_NX}/2*connscale
float P23FRBa_P5IBd_destlim = {P5IBd_SEPX}*{P5IBd_NX}/2*connscale
float P23FRBa_B5FS_destlim = {B5FS_SEPX}*{B5FS_NX}/2*connscale
float P23FRBa_P6RSa_destlim = {P6RSa_SEPX}*{P6RSa_NX}/2*connscale
float P23FRBa_P6RSb_destlim = {P6RSb_SEPX}*{P6RSb_NX}/2*connscale
float P23FRBa_P6RSc_destlim = {P6RSc_SEPX}*{P6RSc_NX}/2*connscale
float P23FRBa_P6RSd_destlim = {P6RSd_SEPX}*{P6RSd_NX}/2*connscale
float P23FRBa_C23FS_destlim = {C23FS_SEPX}*{C23FS_NX}/2*connscale
float P23FRBa_C5FS_destlim = {C5FS_SEPX}*{C5FS_NX}/2*connscale
float P23FRBa_ST4RS_destlim = {ST4RS_SEPX}*{ST4RS_NX}/2*connscale
float P23FRBa_I23LTS_destlim = {I23LTS_SEPX}*{I23LTS_NX}/2*connscale
float P23FRBa_I5LTS_destlim = {I5LTS_SEPX}*{I5LTS_NX}/2*connscale
float P23FRBa_P23FRBa_destlim = {P23FRBa_SEPX}*{P23FRBa_NX}/2*connscale
float P23FRBa_P5RSa_destlim = {P5RSa_SEPX}*{P5RSa_NX}/2*connscale

// Create network for P23FRBa cells

include P23FRBa_P23RSa.g
include P23FRBa_P23RSb.g
include P23FRBa_P23RSc.g
include P23FRBa_P23RSd.g
include P23FRBa_B23FS.g
include P23FRBa_P5IBa.g
include P23FRBa_P5IBb.g
include P23FRBa_P5IBc.g
include P23FRBa_P5IBd.g
include P23FRBa_B5FS.g
include P23FRBa_P6RSa.g
include P23FRBa_P6RSb.g

if ({columntype == 0})

     include P23FRBa_P6RSc.g
     include P23FRBa_P6RSd.g

end

include P23FRBa_C23FS.g
include P23FRBa_C5FS.g
include P23FRBa_ST4RS.g
include P23FRBa_I23LTS.g
include P23FRBa_I5LTS.g
include P23FRBa_P23FRBa.g
include P23FRBa_P5RSa.g

//P5RSa spatial connection scales

float P5RSa_P23RSa_destlim = {P23RSa_SEPX}*{P23RSa_NX}/2*connscale
float P5RSa_P23RSb_destlim = {P23RSb_SEPX}*{P23RSb_NX}/2*connscale
float P5RSa_P23RSc_destlim = {P23RSc_SEPX}*{P23RSc_NX}/2*connscale
float P5RSa_P23RSd_destlim = {P23RSd_SEPX}*{P23RSd_NX}/2*connscale
float P5RSa_B23FS_destlim = {B23FS_SEPX}*{B23FS_NX}/2*connscale
float P5RSa_P5IBa_destlim = {P5IBa_SEPX}*{P5IBa_NX}/2*connscale
float P5RSa_P5IBb_destlim = {P5IBb_SEPX}*{P5IBb_NX}/2*connscale
float P5RSa_P5IBc_destlim = {P5IBc_SEPX}*{P5IBc_NX}/2*connscale
float P5RSa_P5IBd_destlim = {P5IBd_SEPX}*{P5IBd_NX}/2*connscale
float P5RSa_B5FS_destlim = {B5FS_SEPX}*{B5FS_NX}/2*connscale
float P5RSa_P6RSa_destlim = {P6RSa_SEPX}*{P6RSa_NX}/2*connscale
float P5RSa_P6RSb_destlim = {P6RSb_SEPX}*{P6RSb_NX}/2*connscale
float P5RSa_P6RSc_destlim = {P6RSc_SEPX}*{P6RSc_NX}/2*connscale
float P5RSa_P6RSd_destlim = {P6RSd_SEPX}*{P6RSd_NX}/2*connscale
float P5RSa_C23FS_destlim = {C23FS_SEPX}*{C23FS_NX}/2*connscale
float P5RSa_C5FS_destlim = {C5FS_SEPX}*{C5FS_NX}/2*connscale
float P5RSa_ST4RS_destlim = {ST4RS_SEPX}*{ST4RS_NX}/2*connscale
float P5RSa_I23LTS_destlim = {I23LTS_SEPX}*{I23LTS_NX}/2*connscale
float P5RSa_I5LTS_destlim = {I5LTS_SEPX}*{I5LTS_NX}/2*connscale
float P5RSa_P23FRBa_destlim = {P23FRBa_SEPX}*{P23FRBa_NX}/2*connscale
float P5RSa_P5RSa_destlim = {P5RSa_SEPX}*{P5RSa_NX}/2*connscale

// Create network for P5RSa cells

include P5RSa_P23RSa.g
include P5RSa_P23RSb.g
include P5RSa_P23RSc.g
include P5RSa_P23RSd.g
include P5RSa_B23FS.g
include P5RSa_P5IBa.g
include P5RSa_P5IBb.g
include P5RSa_P5IBc.g
include P5RSa_P5IBd.g
include P5RSa_B5FS.g
include P5RSa_P6RSa.g
include P5RSa_P6RSb.g

if ({columntype == 0})

     include P5RSa_P6RSc.g
     include P5RSa_P6RSd.g

end

include P5RSa_C23FS.g
include P5RSa_C5FS.g
include P5RSa_ST4RS.g
include P5RSa_I23LTS.g
include P5RSa_I5LTS.g
include P5RSa_P23FRBa.g
include P5RSa_P5RSa.g
