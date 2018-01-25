// genesis
//Gapdefs.g

// Create Gap Junctions

     include P23RSa_P23RSa_Gap.g
     include P23RSa_P23RSb_Gap.g
     include P23RSa_P23RSc_Gap.g
     include P23RSa_P23RSd_Gap.g

     include P23RSb_P23RSb_Gap.g
     include P23RSb_P23RSc_Gap.g
     include P23RSb_P23RSd_Gap.g

     include P23RSc_P23RSc_Gap.g
     include P23RSc_P23RSd_Gap.g

     include P23RSd_P23RSd_Gap.g

if ({columntype == 0})

     include B23FS_B23FS_Gap.g

end

if ({columntype == 1})

     include B23FS_B23FS_TraubGap.g

end

     include P5IBa_P5IBa_Gap.g
     include P5IBa_P5IBb_Gap.g
     include P5IBa_P5IBc_Gap.g
     include P5IBa_P5IBd_Gap.g

     include P5IBb_P5IBb_Gap.g
     include P5IBb_P5IBc_Gap.g
     include P5IBb_P5IBd_Gap.g

     include P5IBc_P5IBc_Gap.g
     include P5IBc_P5IBd_Gap.g

     include P5IBd_P5IBd_Gap.g

if ({columntype == 0})

     include B5FS_B5FS_Gap.g

end

if ({columntype == 1})

     include B5FS_B5FS_TraubGap.g

end

if ({columntype == 0})

     include P6RSa_P6RSa_Gap.g
     include P6RSa_P6RSb_Gap.g
     include P6RSa_P6RSc_Gap.g
     include P6RSa_P6RSd_Gap.g

     include P6RSb_P6RSb_Gap.g
     include P6RSb_P6RSc_Gap.g
     include P6RSb_P6RSd_Gap.g

     include P6RSc_P6RSc_Gap.g
     include P6RSc_P6RSd_Gap.g

     include P6RSd_P6RSd_Gap.g

end

if ({columntype == 1})

     include P6RSa_P6RSa_Gap.g
     include P6RSa_P6RSb_Gap.g

     include P6RSb_P6RSb_Gap.g

end

     include ST4RS_ST4RS_Gap.g

if ({columntype == 0})

     include I23LTS_I23LTS_Gap.g

end

if ({columntype == 1})

     include I23LTS_I23LTS_TraubGap.g

end

if ({columntype == 0})

     include I5LTS_I5LTS_Gap.g

end

if ({columntype == 1})

     include I5LTS_I5LTS_TraubGap.g

end

if ({thalamocortical == 1})

     if ({columntype == 0})

          include nRT_nRT_Gap.g

     end

     if ({columntype == 1})

          include nRT_nRT_TraubGap.g

     end

end

    include P5IBa_P5RSa_Gap.g
    include P5IBb_P5RSa_Gap.g
    include P5IBc_P5RSa_Gap.g
    include P5IBd_P5RSa_Gap.g

    include P5RSa_P5RSa_Gap.g

if ({columntype == 1})

          include P23RSa_P23FRBa_TraubGap.g //these give Error messages
          include P23RSb_P23FRBa_TraubGap.g
          include P23RSc_P23FRBa_TraubGap.g
          include P23RSd_P23FRBa_TraubGap.g 

end

if ({columntype == 0})

          include P23RSa_P23FRBa_Gap.g 
          include P23RSb_P23FRBa_Gap.g
          include P23RSc_P23FRBa_Gap.g
          include P23RSd_P23FRBa_Gap.g

end

    include P23FRBa_P23FRBa_Gap.g
