// Street Numbers for 3D printing
// Charles Tilford, 2019
// License: CC BY-NC-SA 4.0
//   https://creativecommons.org/licenses/by-nc-sa/4.0/

char="B";     // The number/letter to print

// Units are in mm, except for height of letter

// How many inches high should letter be?
inchesHigh=3;
// How thick/deep should letter be (mm)?
depth=8;

// Character coordinates just center the letter
charX=-30;    // Character X coord
charY=-36;    // Character Y coord
topScrew=30;  // Top screw Y coord
botScrew=-28; // Bottom screw Y coord
height=8;     // Thickness of character
// Screw dimensions. Default presumes
// #6 sheet metal screw
screwWid=3.6; // Width of screw shaft
screwTop=6.78;// Width of screw head
screwCon=5.08;// Height of head 'cone'

// Font to print in. Your system needs this
// installed, of course. If changed the hole
// positions almost certainly need to be
// changed, and maybe charX/charY.
fName="Open Sans Extrabold";
// https://fonts.google.com/specimen/Open+Sans
// Designer: Steve Matteson

// Thin floor below holes. My printer was
// struggling to have the hole 'border' stick
// to the stage. Just drill/screw thru it.
holeFloor=0.1; 

// ==========================================
// ===== All values below are auto-calculated
// ==========================================

// Scaled values
scaleFactor=inchesHigh / 3;
cX=charX * scaleFactor;
cY=charY * scaleFactor;
tS=topScrew * scaleFactor;
bS=botScrew * scaleFactor;
// Where do we start drawing screw head cone?
oS=depth - (screwCon-.05);

difference() {
  // We use difference() to punch out the screw holes
  // in the character
    
  // The character itself, 8mm thick
  translate([cX,cY,0])
    linear_extrude(height=depth, scale=1)
    text(char, size=(75*scaleFactor),
         $fn=100, font=fName);
    
  // Bottom screw hole
  translate([0,bS,oS]) color("red")
    cylinder(h=screwCon, d2=screwTop,
             d1=0, $fn=20);
   translate([0,bS,holeFloor])
    cylinder(h=20, d=screwWid, $fn=20);
    
  // Top screw hole
  translate([0,tS,oS]) color("red")
    cylinder(h=screwCon, d2=screwTop,
             d1=0, $fn=20);
  translate([0,tS,holeFloor])
    cylinder(h=20, d=screwWid, $fn=20);
}

// Colors are just to aid visualization of
// void spaces. $fn is "featuer number", ie how
// many polygons are devoted to object. The values
// above should be near your printing limit anyway.

// Developed in OpenSCAD
//    https://www.openscad.org/