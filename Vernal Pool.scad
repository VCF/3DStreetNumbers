// Text block for signage
// Charles Tilford, 2019
// License: CC BY-NC-SA 4.0
//   https://creativecommons.org/licenses/by-nc-sa/4.0/

line1="Vernal";     // The text to print
line2="Pool";     // The text to print

// Units are in mm, except for height of letter

// How many inches high should text be?
inchesHigh=1.5;
// How thick/deep should text be (mm)?
depth=2;

// Character coordinates just center the letter
charX=-30;    // Character X coord
charY=-36;    // Character Y coord
topScrew=30;  // Top screw Y coord
botScrew=-28; // Bottom screw Y coord
height=8;     // Thickness of character

// Font to print in. Your system needs this
// installed, of course.

// Cursive font so the letters are all (mostly)
// attached within each word. Will glue to sign.
fName="LeckerliOne-Regular";
// https://fonts.google.com/specimen/Leckerli+One
// Designer: Gesine Todt
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

  // Both lines of text
translate([cX,cY+10,0])
  linear_extrude(height=depth, scale=1)
  text(line1, size=(75*scaleFactor),
       $fn=100, font=fName);
translate([cX,4*cY+10,0])
  linear_extrude(height=depth, scale=1)
  text(line2, size=(75*scaleFactor),
       $fn=100, font=fName);
// No holes. I'm going to just glue this

// Colors are just to aid visualization of
// void spaces. $fn is "feature number", ie how
// many polygons are devoted to object. The values
// above should be near your printing limit anyway.

// Developed in OpenSCAD
//    https://www.openscad.org/