$fn=50;

//h1: height below buckle
//h2: height above buckle
//w:  width of groove
//angle: angle of groove at top
module cylinderCutoutShape(h1=50, h2=5, w=1, angle=45) {
    rotate([90,0,0])
    linear_extrude(height=120, center=true, twist=0)
    polygon(points=[
        [-w/2,0],
        [-w/2-(h2*sin(angle)/sin(90-angle)),h2],
        [w/2+(h2*sin(angle)/sin(90-angle)),h2],
        [w/2,0],
        [w/2,-h1],
        [-w/2,-h1]
        ]);
}

module hsc_hole(h=10, r=5, width=1, p=0.1, scale_factor=1.05) {
    l=r*p;  // länge endstücken
    union() {
        translate([0,0,h/2]) scale(scale_factor) cylinder(r=r, h=h, center=true);
        translate([0,0,l/2]) scale(scale_factor) cylinder(r1=r+l, r2=r, h=l, center=true);
        translate([0,0,l/2+h-3*l]) scale(scale_factor) cylinder(r1=r, r2=r+l, h=l, center=true);
        translate([0,0,l+h-2*l]) scale(scale_factor) cylinder(r1=r+l, r2=r, h=2*l, center=true);
    }
}

// nipple - socket
// h: height
// r: radius
// width: thickness (<r)
// p: ratio bead to radius
// slitp: percentage of slit (below bead)
module hsc_nipple(h=10, r=5, width=1, p=0.1, slitp=1.1, reinforce_base=true) {
    l=r*p;  // länge endstücken
    difference() {
        union() {
            difference() {
                union() {
                    translate([0,0,h/2]) cylinder(r=r, h=h, center=true);
                    translate([0,0,l/2]) cylinder(r1=r+l, r2=r, h=l, center=true);
                    translate([0,0,l/2+h-3*l]) cylinder(r1=r, r2=r+l, h=l, center=true);
                    translate([0,0,l+h-2*l]) cylinder(r1=r+l, r2=r, h=2*l, center=true);
                }
                translate([0,0,-1]) cylinder(r=r-width, h=h+2);
            }
            if (reinforce_base == true) {
                difference() {
                    cylinder(r=r-width/2,h=r,center=true);
                    translate([0,0,r/2]) sphere(r=r-width);
                }
            }
        }
        union() {
            translate([0,0,h-2*l]) cylinderCutoutShape(h1=h*slitp, h2=4*l, angle=25, w=3*l);
        }
    }
}

/*
cylinderCutoutShape();
*/
translate([0,15,0])
    union() {
    translate([0,0,1.5]) cylinder(r=6, h=3, center=true);
    translate([0,0,3]) hsc_nipple(r=4);
}

difference() {
    translate([0,0,5]) cylinder(r=7, h=10, center=true);
    hsc_hole(r=4);
}
