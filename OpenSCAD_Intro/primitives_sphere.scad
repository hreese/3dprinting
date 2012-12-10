// [ sphere ]
// r: radius
// $fa: Angle in degrees
// $fs: Angle in mm
// $fn: Resolution 
translate([-10,0,0]) sphere(r = 5, center=true, $fn=32);
translate([0,0,0]) sphere(r = 2, center=true, $fn=128);
translate([10,0,0]) sphere(r = 5, center=false, $fn=5);

