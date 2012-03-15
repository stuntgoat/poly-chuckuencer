// on_off_sequence.ck

fun string[] strings_from_filename(string filename) { 
    // create an on/off array with a filename 
    FileIO fio;
    string str;
    0 => int counter;
    string tmp_array[1000]; // up to 1000 vars, just in case.
    fio.open(filename, FileIO.READ);
    if(!fio.good()) {
	cherr <= "can't open file: " <= filename <= " for reading..." <= IO.nl();
	me.exit();
    }
    while(fio => str) { // acquire the length of strings separated by spaces
	str => tmp_array[counter];
	counter++;
    }
    string strings[counter];
    for (0 => int i; i < counter; i++) {
	tmp_array[i] => strings[i];
    }
    return strings;
}

fun void sequence(float duration, string filename) {
    SndBuf buf => dac;    
    filename => buf.read;
    while(true) {
	0 => buf.pos;
        duration::ms => now;
	// put the on on/off sequence into an array and iterate over the array
	// playing with on bit "1" and silence with off bit "0"
    }
}

// TODO: return a data structure from a file that contains a list of files
fun void  play_sequences(string filename) {
    // within filename is a list of files to parse and load in to sequence()
    string sequences[][];
    strings_from_filename(filename) @=> string data[];
    for (0 => int i; i < data.size(); i++) {
	// load each filename and create a sequence object to play
	if (i % 2 == 0) {
	    spork ~ sequence(Std.atof(data[i]), data[i+1]);
	}
    }
    while( true ) {
	2::second => now;
    }
}

play_sequences("/Users/hyperneato/py/polymetro/chuck_test");




