b = 0;
a = b-12;

~cadg = Pseq([[b,b+4,b+7,b+11],[b+9,b+12,b+16,b+19],[b+2,b+5,b+9,b+12],[b+7,b+11,b+14,b+17]]);
~cdgf = Pseq([[b,b+4,b+7,b+11], [b+2,b+5,b+9,b+12], [b+7,b+11,b+14,b+17],[b+5,b+9,b+12,b+16]]);
~cgaf = Pseq([[b,b+4,b+7,b+11], [b+7,b+11,b+14,b+17], [b+9,b+12,b+16,b+19],[b+11,b+14,b+17, b+21]]);

(

~chords = Pbind(

	\note, Pshuf([~cadg.collect(~chord = _), ~cdgf.collect(~chord = _), ~cgaf.collect(~chord = _)], inf),
	// this line here repeats over these sets of notes, aka chords
    \dur, 1,
	// each chord plays for 1 second

);

~melody = Pbind(
	\note, Pn(Plazy { Pfin(4,Pshuf(~chord, inf)) }) + 12,
	// shuffles the notes in a chord, limits it to one output, puts it in a pattern, and assigns it the melody
	\dur, Prand([0.5,0.25,], inf);
	//each chord plays eithr a quarter note, half note, or whole note
);


x = Ptpar([0, ~chords, 0, ~melody]).play


)


//makes so the events occur at the same time, with the 0's representing any delay.

x.stop;