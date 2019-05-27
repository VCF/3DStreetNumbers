# 3D Printed Street Sign Numbers

I needed street numbers for both my driveway and house, 15 in
total. At big-box hardware stores these things are _pricey_. This
seemed like a perfect use of a 3D printer; Cura estimates that a 3"
high number "8" will take 17 grams of ABS and cost `$0.34`.

All characters are defined using SCAD, such that you can change the
size and/or thickness of the characters (default 3" high) and
hopefully the screw holes will be automatically relocated to the
appropriate place. You can also change the font, but you'll almost
certainly have to reposition the screw holes.

* Default Font: Open Sans Extrabold by Steve Matteson
  * https://fonts.google.com/specimen/Open+Sans
* Designed with OpenSCAD
  * https://www.openscad.org/

Note: [SCAD is not a programming language][NoProg]. This means if you
try someting like `scaledVal = scaledVal * scalingFactor` you'll end
up frustrated and 20 minutes poorer.

[NoProg]: http://forum.openscad.org/A-A-1-td11385.html
