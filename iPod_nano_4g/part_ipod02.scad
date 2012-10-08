//include <iPod_nano_4gen_bike_mount.scad>

//$fn=32;
//production=false;

ipod_n4_height=70;        // top to bottom when looking at the display
ipod_n4_width=53;        // left ro right when looking at the display
ipod_n4_edge_radius=5.3; // radius of circle describing the edge's radius

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

module haken(r1=3.5,r2=7, w=10) {
    translate([r2,0,0])
    rotate([90,0,180])
    intersection() {
        translate([0,0,-w]) cube(2*w, center=false);
        difference() {
            cylinder(r=r2, h=w, center=true,$fn=32);
            cylinder(r=r1, h=w+0.1, center=true, $fn=32);
        }

    }
}

module eckhaken(r1=3.5,r2=7) {
rotate([0,0,-90])
    intersection() {
        difference() {
            cube(r2+1);
            sphere(r=r1, center=true, $fn=32);
        }
        sphere(r=r2, center=true, $fn=32);
    }
}

module iPodStand (border=5, height=5, podx=ipod_n4_width, pody=ipod_n4_height, hole_r=ipod_n4_width/23, hole_spacing=3, no_hole_zone=[10,10]) {
    num_holes_x=floor((podx)/(2*hole_r+hole_spacing));
    num_holes_y=floor((pody)/(2*hole_r+hole_spacing));
    nhz_x = no_hole_zone[0]/2 + hole_r;
    nhz_y = no_hole_zone[1]/2 + hole_r;
    difference() {
        // baseplate
        union() {
            if ( production == true ) {
                round_edges_box([podx+2*border,pody+2*border,height], r=3, center=true);
            } else {
                cube([podx+2*border,pody+2*border,height], center=true);
            }
        }
        // base indent
            if ( production == true ) {
                translate([0,5,height/2]) round_edges_box([podx, pody+2*border, 2], r=1, only_bottom=true, center=true);
            } else {
                translate([0,5,height/2]) cube([podx, pody+2*border, 2], r=1, only_bottom=true, center=true);
            }
        // holes #1
        for(xc=[1:num_holes_x]) {
            for(yc=[1:num_holes_y]) {
                assign (x=-podx/2+xc*(hole_spacing+hole_r*2), y=-pody/2+yc*(hole_spacing+hole_r*2)) {
                    echo(x,abs(x), nhz_x);
                    if( abs(x) >= nhz_x || abs(y) >= nhz_y) {
                        translate([x,y,0]) cylinder(r=hole_r, h=height+2, center=true);
                    }
                }
            }
        }
        // hole for central screw
        translate([0,0,height/2-3]) cylinder(r=3.2, h=height, center=false);
        cylinder(r=1.5, h=12, center=true);
        // hole for earplug
        translate([18,-pody/2,0])
        rotate([90,0,0]) cylinder(r1=6,r2=10,h=border+0.1, center=false);
    }
    // upper clamps
    translate([-podx/2-3.5,0,height/2]) haken(r1=3.5, w=25);
    rotate([0,0,180]) translate([-podx/2-3.5,0,height/2]) haken(r1=3.5,w=25);
    translate([-15,0,0]) rotate([0,0,90]) translate([-pody/2-3.5,0,height/2]) haken(r1=3.5,w=10);
    //translate([podx/2-3.5,-pody/2+3.5,height/2]) eckhaken(r1=3.5);
}

iPodStand();
