include <hsc.scad>

translate([0,15,0])
    union() {
    translate([0,0,1.5]) cylinder(r=6, h=3, center=true);
    translate([0,0,3]) hsc_pin(r=4);
}

