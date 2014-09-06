$fn=100;

module strut() {
    difference() {
        difference() {
            union() {
                translate([0,0,0]) cube([10, 40, 60]);
                scale([1,0.5,1]) intersection() {
                    translate([0,0,0]) cylinder(r=10,h=60);
                    translate([0,-10,0]) cube([10, 20, 60]);
                }
            }
            translate([-1,40,70]) scale([1,3,6]) rotate([0,90,0]) cylinder(r=10, h=50);
        }
        translate([10-3.5, 0, 18]) cube([40, 3.5, 70]);
        translate([10/2, 35, 8]) screw();
        translate([10/2, 20, 8]) screw();
    }
}

module screw(r1=5/2, r2=8/2) {
    union() {
        translate([0,0,-100/2+1])cylinder(r=r1, h=100, center=true);
        translate([0,0,100/2]) cylinder(r=r2, h=100, center=true);
    }
}
