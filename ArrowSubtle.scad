// Street Numbers for 3D printing
// Charles Tilford, 2019
// License: CC BY-NC-SA 4.0
//   https://creativecommons.org/licenses/by-nc-sa/4.0/

// Units are in mm, except for height of letter

// Width and length of arrow body:
bodyWid=30;
bodyLen=160;
// Width and length of arrow head:
arrWid=30;
arrHead=50;
// How thick/deep should object be (mm)?
depth=8;

// Character coordinates just center the letter
charX=0;    // Object X coord
charY=0;    // Object Y coord
topScrew=30;  // Top screw Y coord
botScrew=-28; // Bottom screw Y coord
height=8;     // Thickness of object
// Screw dimensions. Default presumes
// #6 sheet metal screw
screwWid=3.6; // Width of screw shaft
screwTop=6.78;// Width of screw head
screwCon=5.08;// Height of head 'cone'

// Thin floor below holes. My printer was
// struggling to have the hole 'border' stick
// to the stage. Just drill/screw thru it.
holeFloor=0.1; 

// ==========================================
// ===== All values below are auto-calculated
// ==========================================

// Where do we start drawing screw head cone?
oS=depth - (screwCon-.05);

difference() {
  // We use difference() to punch out the screw holes
  // in the shape
    
  // The object itself, 8mm thick
  union() {
    // Arrow bar
    translate([0,-bodyWid/2,0])
      linear_extrude(height=depth, scale=1)
      square([bodyLen,bodyWid], 0);
    // Arrow head
    linear_extrude(height=depth, scale=1)
      polygon([[bodyLen,arrWid],
               [bodyLen+arrHead,0],
               [bodyLen,0-arrWid]]);
  }
  
  // Body screw hole
  translate([bodyWid/2,0,oS]) color("red")
    cylinder(h=screwCon, d2=screwTop,
             d1=0, $fn=20);
   translate([bodyWid/2,0,oS])
    cylinder(h=20, d=screwWid, $fn=20);
  
  // Head screw hole
  translate([bodyLen,0,oS]) color("red")
    cylinder(h=screwCon, d2=screwTop,
             d1=0, $fn=20);
   translate([bodyLen,0,oS])
    cylinder(h=20, d=screwWid, $fn=20);
}

// Colors are just to aid visualization of
// void spaces. $fn is "featuer number", ie how
// many polygons are devoted to object. The values
// above should be near your printing limit anyway.

// Developed in OpenSCAD
//    https://www.openscad.org/