 
// TODO:
// create an array for each pulse on/off cycle
// an array of volume
// an array for 

"../audio/hey.wav" => string hey;
"../audio/hi.wav" => string hi;
"../audio/ho.wav" => string ho;


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
spork ~ sequence(600, hi);
spork ~ sequence(700, ho);

while( true )
    1::second => now;
