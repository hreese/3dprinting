// [ cylinder ]
// r1, r2: Radius an beiden Enden ODER
// r: wenn Radius gleich
// h: Höhe

translate([10,10,0]) cylinder(r=5, h=4);
translate([-10,10,0]) cylinder(r1=7, r2=1, h=7);
translate([10,-10,0]) cylinder(r=7, $fn=64);
translate([-10,-10,0]) cylinder(r=7, $fn=8);
