// genesis

//Overall simulation parameters

float tmax = 10 
float dt = 5.0e-5		// sec
floatformat %g
float refresh_factor = 10.0

// Seeding the random number generator used later in the input pattern.
// Seeding with a defined number (integer) allows one to reproduce
// 'random' patterns from one simulation to the next.   Seeding
// without a defined seed gives different results each time you run
// the simulation.

randseed 34521

// setting the simulation clocks

setclock	0 {dt}		        // sec
setclock	1 {dt * refresh_factor} // sec
setclock        2 1.0
// Distributed Processing Setup

int display = 1		// display neurons and graphs
int output = 1		// don't dump neural output to a file

// Thalamocortical and Gaps flags
int thalamocortical
int gaps

gaps = 1   // Gap junction flag
thalamocortical = 1 // TC flag

int batch = (display == 0)	// we are running interactively

echo Genesis started at {getdate}
echo "display = " {display}
echo "output = " {output}
echo "batch = " {batch}
echo ""

// variables
int i_am_Q1, i_am_Q2, i_am_Q3, i_am_Q4	// booleans indicating what cells are assigned
int i_am_Q5, i_am_Q6, i_am_Q7, i_am_Q8  //   to this node
int i_am_Q9, i_am_Q10,i_am_Q11, i_am_Q12
int i_am_Q13, i_am_Q14, i_am_Q15, i_am_Q16

int Nnodes = 81
int sqrtNnodes = 9

// START UP
paron -parallel -nodes {Nnodes} -output /home/pol/NeoDiff/o.out \
   	-executable nxpgenesis
//setfield /post msg_hang_time 100000	// set a very long timeout in case
					// we need to do debugging

// Label nodes (whereami)

i_am_Q1 = {mynode} == 0
i_am_Q2 = {mynode} == 1
i_am_Q3 = {mynode} == 2
i_am_Q4 = {mynode} == 3
i_am_Q5 = {mynode} == 4
i_am_Q6 = {mynode} == 5
i_am_Q7 = {mynode} == 6
i_am_Q8 = {mynode} == 7
i_am_Q9 = {mynode} == 8
i_am_Q10 = {mynode} == 9
i_am_Q11 = {mynode} == 10
i_am_Q12 = {mynode} == 11
i_am_Q13 = {mynode} == 12
i_am_Q14 = {mynode} == 13
i_am_Q15 = {mynode} == 14
i_am_Q16 = {mynode} == 15

echo I am node {mynode}
echo Completed startup at {getdate}

// Neocortex - Setup / Global Variables

int probedex
int probedex2
int gridsize
float sqrtgrdsz
float neuronfrac // Percentage of neurons receiving background

// Flags for minicolumnar architecture

int columntype       // 0 = standard column, all cell types represented in each Minicolumn
                     // 1 = Traub like columns

columntype = 1

// Load Network cell spacings and cell numbers

include netparams.g

// Central Q1 P23RSa current injection

float Q1_P23RSa_centralinj = 0.0

gridsize = P23RSa_NX*P23RSa_NY
probedex = gridsize/2
probedex2 = probedex/2

//===============================
//      Function Definitions
//===============================

function step_tmax
    step {tmax} -time
end

//===============================
//          Data Out
//===============================

function do_asc_file(diskpath, srcpath, field, fd)

        create asc_file /{fd}
        setfield /{fd} filename {diskpath} flush 1 leave_open 1 append 0 float_format %0.9g

        addmsg {srcpath} /{fd}  SAVE {field}

end

//===============================
//    Spike Class  Data Out ASCII
//===============================

function do_classasc_file(diskpath, srcpath, classdex, Nelements, field, fd)

        int Nelements, classdex
        int i

        create asc_file /{fd}
        setfield /{fd} filename {diskpath} flush 1 leave_open 1 append 0 float_format %0.9g

        for (i=1;i<={Nelements};i=i+1)

            addmsg {srcpath}[{i-1}]/soma/spk{classdex} /{fd}  SAVE {field}
        
        end

end

//================================
//    Spike Class  Data Out Binary
//================================

function do_classasc_filebin(diskpath, srcpath, classdex, Nelements, field, fd)

        int Nelements, classdex
        int i

        create disk_out /{fd}
        setfield /{fd} filename {diskpath} flush 1 leave_open 1 append 0

        for (i=1;i<={Nelements};i=i+1)

            addmsg {srcpath}[{i-1}]/soma/spk{classdex} /{fd}  SAVE {field}
        
        end

end


//===============================
//      Set up Network
//===============================

//Table of synaptic conductances

include syncond.g

// Load cell definitions

include celldefs.g

// Define soma SPIKE outputs

include spikedefs

// CREATE NETWORK CONNECTIONS

// Network definitions

barrierall

P23RSa
P23RSb
P23RSc
P23RSd
B23FS
P5IBa
P5IBb
P5IBc
P5IBd
B5FS
P6RSa
P6RSb

if ({columntype == 0})

     P6RSc
     P6RSd

end

C23FS
C5FS
ST4RS
I23LTS
I5LTS

if ({thalamocortical == 1})
     TCR
     nRT
end

P23FRBa
P5RSa

barrierall

// Synaptic weight decay parameters and delays

barrierall
include synapticprobsTraub.g
barrierall

barrierall
include synapticdelays.g
barrierall

barrierall
include axonaldelays.g
barrierall

//Establish Wiring

include netdefs.g

barrierall

echo Made it past netdefs.g! {mynode}

// Create Gap Junctions

if ({gaps == 1})

     barrierall
     include Gapdefs.g
     barrierall

end

// Create Random Background Inputs

include synchansSPIKEs.g

neuronfrac=0.005

include randominputdefs.g

// Output and diagnostics

// Local field potential calculation

include LFP16s.g

//Setup messages for Data File writing

if ( {output == 1} )

    // LFP data write

    include LFP8sASCIIwrite.g

    // Spike Class Output Binary

    include BinarySpikeClasswrite.g

end


check
reset // This initialises and gets everything ready to go.

barrier
step_tmax // Run the sim to time tmax
