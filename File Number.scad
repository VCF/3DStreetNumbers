// Text block for signage
// Charles Tilford, 2019
// License: CC BY-NC-SA 4.0
//   https://creativecommons.org/licenses/by-nc-sa/4.0/

char="file number";     // The text to print

// Units are in mm, except for height of letter

// How many inches high should letter be?
inchesHigh=1;
// How thick/deep should letter be (mm)?
depth=2;

// Character coordinates just center the letter
charX=-30;    // Character X coord
charY=-36;    // Character Y coord

// Font to print in. Your system needs this
// installed, of course. If changed the hole
// positions almost certainly need to be
// changed, and maybe charX/charY.

// Cursive font so the letters are all (mostly)
// attached within each word. Will glue to sign.
fName="Pacifico-Regular";
// https://fonts.google.com/specimen/Pacifico/
// Designers: Vernon Adams, Jacques Le Bailly,
//            Botjo Nikoltchev, Ani Petrova

// ==========================================
// ===== All values below are auto-calculated
// ==========================================

// Scaled values
scaleFactor=inchesHigh / 3;
cX=charX * scaleFactor;
cY=charY * scaleFactor;

// The character itself, 8mm thick
translate([cX,cY+10,0])
  linear_extrude(height=depth, scale=1)
  text(char, size=(75*scaleFactor),
       $fn=100, font=fName);
// No holes. I'm going to just glue this

// Colors are just to aid visualization of
// void spaces. $fn is "feature number", ie how
// many polygons are devoted to object. The values
// above should be near your printing limit anyway.

// Developed in OpenSCAD
//    https://www.openscad.org/