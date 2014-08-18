$fn=50;

difference() {
    union() {
        translate([0,0,4]) cylinder(r1=4, r2=4, h=14);
        cylinder(r1=8, r2=4, h=4);
    }
    translate([0,0,-1]) cylinder(r=1.5, h=20);
}
