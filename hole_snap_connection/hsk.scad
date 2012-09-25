$fn=360;

//h1: height below buckle
//h2: height above buckle
//w:  width of groove
//angle: angle of groove at top
module cylinderCutoutShape(h1=50, h2=5, w=1, angle=45) {
    rotate([90,0,0]) scale([1,1,10]) polygon(points=[
        [-w/2,0],
        [-w/2-(h2*sin(angle)/sin(90-angle)),h2],
        [w/2+(h2*sin(angle)/sin(90-angle)),h2],
        [w/2,0],
        [w/2,-h1],
        [-w/2,-h1]
        ]);
}

//cylinderCutoutShape();

_hsc_body(h=10, r=5) {
}

// nipple - socket
// h: height
// r: radius
// width: thickness (<r)
// p: ratio bead to radius
// slitp: percentage of slit (below bead)
module nipple(h=10, r=5, width=1, p=0.1, slitp=1.1) {
    l=r*p;  // länge endstücken
    difference() {
        union() {
            translate([0,0,h/2]) cylinder(r=r, h=h, center=true);
            translate([0,0,l/2]) cylinder(r1=r+l, r2=r, h=l, center=true);
            translate([0,0,l/2+h-3*l]) cylinder(r1=r, r2=r+l, h=l, center=true);
            translate([0,0,l+h-2*l]) cylinder(r1=r+l, r2=r, h=2*l, center=true);
        }
        union() {
            translate([0,0,-1]) cylinder(r=r-width, h=h+2);
            //%cylinderCutoutShape(h1=h*slitp, h2=4*l, w=2*r, angle=45)
            translate([0,0,h-2*l]) cylinderCutoutShape(h1=h*slitp, h2=4*l, angle=25, w=3*l);
        }
    }
}

nipple();

