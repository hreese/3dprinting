include <hsc.scad>

difference() {
    translate([0,0,5]) cylinder(r=7, h=10, center=true);
    hsc_hole(r=4);
}

