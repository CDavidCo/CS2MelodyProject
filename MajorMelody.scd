l = 0;
g = l-12;

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


~basstones = Pbind(
        \note, Pseq([[g], [g+2], [g+4],[g+5],[g+7],[g+9,],[g+11],[g+12]], inf),
	// repeats bass tones
	\dur, 1
	//each chord plays for one second
);

x = Ptpar([0, ~chords, 0, ~melody, 0, ~basstones]).play
//makes so the events occur at the same time, with the 0's representing any delay.
)

x.stop;


