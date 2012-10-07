//include <iPod_nano_4gen_bike_mount.scad>

$fn=32;

module round_edges_box(boundingbox=[1,1,1], r=0.1, only_bottom=false, center=false) {
    if( center == false ) {
        translate([boundingbox[0]/2, boundingbox[1]/2, boundingbox[2]/2]) round_edges_box_hull(boundingbox=boundingbox, r=r, only_bottom=only_bottom);
    } else {
        round_edges_box_hull(boundingbox=boundingbox, r=r, only_bottom=only_bottom);
    }
}

module round_edges_box_hull(boundingbox=[1,1,1], r=0.1, only_bottom=false) {
    x=boundingbox[0]/2;
    y=boundingbox[1]/2;
    z=boundingbox[2]/2;
    hull() {
        for(x1=[-x+r,x-r]) {
            for(y1=[-y+r,y-r]) {
                for(z1=[-z+r,z-r]) {
                    if( only_bottom == true && z1>0) {
                        translate([x1,y1,z1]) cylinder(r=r, h=r*2, center=true);
                    } else {
                        translate([x1,y1,z1]) sphere(r=r, center=true);
                    }
                }
            }
        }
    }
}

/**
iPod-Stuff starts here
*/

module haken() {
    rotate([90,0,0])
    intersection() {
        translate([0,0,-15]) cube([30,30,30], center=false);
        difference() {
            cylinder(r=7, h=10, center=true,$fn=32);
            cylinder(r=3.5, h=10*1.05, center=true, $fn=32);
        }

    }
}

height=5;
difference() {
    // baseplate
    union() {
        round_edges_box([75,85,height], r=3, center=true);
        // left, right, down
        //translate([75/2,0,0]) cylinder(r=5, h=height, center=true);
        //translate([-75/2,0,0]) cylinder(r=5, h=height, center=true);
        //translate([-20,-85/2,0]) cylinder(r=5, h=height, center=true);
    }
    // base indent
    translate([0,5,height/2]) round_edges_box([65, 85, 2], r=1, only_bottom=true, center=true);
    // holes #1
    for(x_h=[-25:10:25]) {
        for(y_h=[-30:10:30]) {
            if(abs(x_h) + abs(y_h) > 10) {
            translate([x_h,y_h,0]) cylinder(r1=2, r2=4, h=12, center=true);
            }
        }
    }
    // hole for central screw
    translate([0,0,height/2-3]) cylinder(r=3.2, h=height, center=false);
    cylinder(r=1.5, h=12, center=true);
    // hole for earplug
    translate([18,-85/2,height/2+4]) rotate([90,0,0]) cylinder(r1=10,r2=15,h=12, center=true);
}

translate([75/2-7-3.5/2,0,height/2]) haken();
rotate([0,0,180]) translate([75/2-7-3.5/2,0,height/2]) haken();
translate([-18,0,0]) rotate([0,0,270]) translate([85/2-7-3.5/2,0,height/2]) haken();

