//include <iPod_nano_4gen_bike_mount.scad>

$fn=12;

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
    translate(sf) hull() {
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


round_edges_box([65,75,15], r=2, fb=6, only_bottom=true, center=true);
