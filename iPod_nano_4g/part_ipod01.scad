include <iPod_nano_4gen_bike_mount.scad>

$fn=32;

rotate([90,0,0])
difference() {
    /*
    translate([0,0,-1]) cube([65,1,12],center=true);
    iPodShape();
    */
    //union() {
    hull() {
        cube([65,80,15], center=true);
        translate([0,0,-7-9/2]) cube([20,30,9],center=true);
    }
    translate([0,50-80/2+5,0]) cube([53,100,7.2], center=true);
    //translate([0,50-80/2+5,1]) iPodShape();
    translate([0,0,25]) hull() {
        for(x=[-44/2+4/2,44/2-4/2]) {
            for(y=[-62/2+4/2,62/2-4/2]) {
                translate([x,y,0]) rotate([0,0,0]) cylinder(r=4/2,h=50,center=true);
            }
        }
    }
    translate([52.5/2-8,-62/2+0.5,0]) rotate([90,0,0]) cylinder(r1=9,r2=12,h=10+2);
    translate([0,0,-11]) union(){
        translate([0,0,50]) cylinder(r=6.2, h=100, center=true);
        translate([0,0,0]) cylinder(r=3.1, h=100, center=true);
    }
}

