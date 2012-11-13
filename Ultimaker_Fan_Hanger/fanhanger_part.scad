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

w=5;
h=8;
l=70;
$fn=32;

rotate([0,180,0])
difference() {
    //cube([2*w+6, l, h]);
    translate([w+3, l/2,h/2]) round_edges_box_hull([2*w+6, l, h],r=2);
    translate([w, -w, -0.5]) cube([6, l, h+1]);
    translate([-0.5, -w-4, -0.5]) cube([6+1, l, h+1]);
    translate([0,4,h/2]) rotate([0,90,0]) cylinder(r=4/2, h=30);
    translate([w, -w-(w/2), -0.5]) translate([0,l,h+1]) rotate([0,0,-35]) translate([0,-l,-h-1]) cube([4, l, h+1]);
}

