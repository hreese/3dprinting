//include <iPod_nano_4gen_bike_mount.scad>

$fn=16;
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
module ipodStandBottom(ipx=ipod_n4_width, ipy=ipod_n4_height, width=4, border=8) {
    cx=20;
    cy=24;
    cz=8;
    rotate([0,180,0]) difference() {
        union() {
            //round_edges_box([2*border+ipx, 2*border+ipy, width], r=2, center=true);
            cube([2*border+ipx, 2*border+ipy, width], center=true);
            difference() {
                translate([0,0,-cz/2-width/2]) cube([cx,cy,cz*1.01], center=true);
                translate([0,-cy/2,-cz-width/2]) rotate([0,90,0]) scale([1,0.5,1]) cylinder(r=cz, h=1.1*cx, center=true, $fn=36);
                translate([0,cy/2,-cz-width/2]) rotate([0,90,0]) scale([1,0.5,1]) cylinder(r=cz, h=1.1*cx, center=true, $fn=36);
                translate([-cx/2,0,-cz-width/2]) rotate([90,0,0]) scale([0.5,1,1]) cylinder(r=cz, h=1.1*cy, center=true, $fn=36);
                translate([cx/2,0,-cz-width/2]) rotate([90,0,0]) scale([0.5,1,1]) cylinder(r=cz, h=1.1*cy, center=true, $fn=36);
            }
        }
        // hole for central screw
        translate([0,0,width/2-3]) cylinder(r=3.2, h=2*width, center=false);
        cylinder(r=1.5, h=62, center=true);
        // hole for earplug
        //translate([18,-ipy/2+0.5,0]) rotate([90,0,0]) cylinder(r1=9,r2=9,h=border+1, center=false);
        translate([18,(-ipy-border+width)/2,0]) cube([20,border+width+1,50], center=true);
        // holes to reduce material usage
        for( rot = [0:90:359] ) {
            rotate([0,0,rot]) translate([20,0,0]) cylinder(r=6, h=2*width, center=true);
        }
        // klebelöcher
        translate([(ipx+border)/2,ipy/3,0])   cylinder(r=2.2, h=2*width, center=true);
        translate([(ipx+border)/2,-ipy/3,0])  cylinder(r=2.2, h=2*width, center=true);
        translate([-(ipx+border)/2,ipy/3,0])  cylinder(r=2.2, h=2*width, center=true);
        translate([-(ipx+border)/2,-ipy/3,0]) cylinder(r=2.2, h=2*width, center=true);
    }
}

ipodStandBottom();
