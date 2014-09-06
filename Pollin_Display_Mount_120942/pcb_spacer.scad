$fn=100;

difference() {
    union() {
        translate([0,0,4]) cylinder(r1=4, r2=4, h=14);
        //cylinder(r1=8, r2=4, h=4);
        intersection() {
            sphere(r=8);
            translate([0,0,5]) cube([20,20,10], center=true);
        }
    }
    translate([0,0,-1]) cylinder(r=2.5, h=20);
}
