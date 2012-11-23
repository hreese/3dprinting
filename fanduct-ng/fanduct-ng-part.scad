$fn=64;
y1 = 25;
x1 = 10;

union() {
    // original
    rotate([0,0,180]) translate([43,0,0]) mirror([0,1,0]) import(filename="fan-duct.stl");
    // anbau
    translate([0,-23.8,4.45]) rotate([0,-32,0]) {
        difference() {
            // platte
            cube([22+6,50,4.05]);
            // ausschnitt
            translate([22+6-x1/2,0,-1]) {
                translate([0,y1/2,0]) cube([x1,50-y1,10]);
                translate([x1/2,y1/2,0]) cylinder(r=x1/2, h=10);
                translate([x1/2,50-y1+y1/2,0]) cylinder(r=x1/2, h=10);
            }
            // bohrlöcher
            translate([22+2, 3.5/2+2.5,-1]) cylinder(r=3.5/2,h=10);
            translate([22+2, 50-3.5/2-2.5,-1]) cylinder(r=3.5/2,h=10);
        }
        // stützen
        translate([7,11.3,4]) cube([15,2.2,12]);
        translate([7,36.3,4]) cube([15,2.2,16]);
    }
}
