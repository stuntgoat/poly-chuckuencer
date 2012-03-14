 
// TODO:
// create an array for each pulse index on/off cycle
// an array of volume. Can we dynamically fade volume???
// an array for function to sync at pulse index

"../audio/hey.wav" => string hey;
"../audio/hi.wav" => string hi;
"../audio/ho.wav" => string ho;

fun void sequence(int duration, string filename) {
    SndBuf buf => dac;    
    filename => buf.read;

    while(true) {
	0 => buf.pos;
        duration::ms => now;
    }
}

spork ~ sequence(500, hey);
spork ~ sequence(600, hi);
spork ~ sequence(700, ho);

while( true )
    1::second => now;
