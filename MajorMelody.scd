l = 0;

(
~chords = Pbind(

	\note, Pseq([[l,l+4,l+7,l+11], [l+2,l+5,l+9,l+12], [l+4,l+7,l+11,l+14],[l+5,l+9,l+12,l+16],[l+7,l+11,l+14,l+17],[l+9,l+12,l+16,l+19],[l+11,l+14,l+17, l+21],[l+12, l+16,l+19, l+23]], inf).collect(~chord = _),
	// this line here repeats over these sets of notes, aka chords
        \dur, 1
	// each chord plays for 1 second

);


~melody = Pbind(
        \note, Pn(Plazy { Pfin(4, Pshuf(~chord, inf)) }) + 12,
	// shuffles the notes in a chord, limits it to one output, puts it in a pattern, and assigns it the melody
	\dur, Prand([1,0.5,0.25], inf);
	//each chord plays eithr a quarter note, half note, or whole note
);

x = Ptpar([0, ~chords, 0, ~melody]).play
//makes so the events occur at the same time, with the 0's representing any delay.
)

x.stop;  