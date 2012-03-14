// example sndbuf from website

// if( me.args() ) me.arg(0) => filename;

"./audio/hey.wav" => string hey;
"./audio/hi.wav" => string hi;
"./audio/ho.wav" => string ho;

// create an array for each pulse on/off cycle
// an array of volume
// an array for 




// fun void sequence(int duration, int pulse, string filename) {
fun void sequence(int duration, string filename) {
    SndBuf buf => dac;    
    filename => buf.read;

    while(true) {
	0 => buf.pos;
        duration::ms => now;
    }
}

spork ~ sequence(500, hey);
// 250::ms => now;
spork ~ sequence(600, hi);
spork ~ sequence(700, ho);
while( true )
    1::second => now;

// infinite time loop - children shreds leave with parent shred
// while( true )
//     1::second => now;


// // the patch 

// // load the file
// hey => buf.read;



// Std.rand2f(.2,.9) => buf.gain;		
// // time loop
// while( true ) {
//     0 => buf.pos;
//     Std.rand2f(.2,.9) => buf.gain;
//     Std.rand2f(.5,1.5) => buf.rate;
//     100::ms => now;
// }




// open 3 files

// create a sequence pattern for each 


// play them















