module round_edges_box_primitives(boundingbox=[1,1,1], r=0.1) {
    x=boundingbox[0];
    y=boundingbox[1];
    z=boundingbox[2];
    xb=x/2-r;
    yb=y/2-r;
    zb=z/2-r;
    union() {
        // round corners
        for(x1=[-xb,xb]) {
            for(y1=[-yb,yb]) {
                for(z1=[-zb,zb]) {
                    translate([x1,y1,z1]) sphere(r=r, center=true);
                }
            }
        }
        // round edges
        translate([0,-yb,-zb]) rotate([0,90,0]) cylinder(r=r, h=x-2*r, center=true);
        translate([0,-yb,zb])  rotate([0,90,0]) cylinder(r=r, h=x-2*r, center=true);
        translate([0,yb,-zb])  rotate([0,90,0]) cylinder(r=r, h=x-2*r, center=true);
        translate([0,yb,zb])   rotate([0,90,0]) cylinder(r=r, h=x-2*r, center=true);
        translate([-xb,0,-zb]) rotate([90,0,0]) cylinder(r=r, h=y-2*r, center=true);
        translate([-xb,0,zb])  rotate([90,0,0]) cylinder(r=r, h=y-2*r, center=true);
        translate([xb,0,-zb])  rotate([90,0,0]) cylinder(r=r, h=y-2*r, center=true);
        translate([xb,0,zb])   rotate([90,0,0]) cylinder(r=r, h=y-2*r, center=true);
        translate([-xb,-yb,0]) rotate([0,0,0]) cylinder(r=r, h=z-2*r, center=true);
        translate([-xb,yb,0])  rotate([0,0,0]) cylinder(r=r, h=z-2*r, center=true);
        translate([xb,-yb,0])  rotate([0,0,0]) cylinder(r=r, h=z-2*r, center=true);
        translate([xb,yb,0])   rotate([0,0,0]) cylinder(r=r, h=z-2*r, center=true);
        // infill
        cube([x-2*r,y,z-2*r], center=true);
        cube([x,y-2*r,z-2*r], center=true);
        cube([x-2*r,y-2*r,z], center=true);
    }
}

