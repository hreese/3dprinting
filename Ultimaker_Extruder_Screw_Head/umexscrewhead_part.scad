// http://www.thingiverse.com/thing:9095 (Knurled surface finishing library)
include <knurledFinishLib.scad>

height = 10;
rbig = 9;
screw_r = 6.1/2;
screw_h = 20;
screw_head_h = 2;

module hexnut(r=screw_r, h = screw_h) {
    cylinder(r=r, h=h, $fn=6);
}

difference() {
    knurled_cyl(chg=height, cod=rbig*2,
                cwd=3.5, csh=3.5, cdp=1,
                fsh=1, smt=0);
    translate([0,0,screw_head_h]) {
        hexnut();
    }
}

translate([2.2*rbig,0,0]) difference() {
    hexnut(h=height-screw_head_h);
    translate([0,0,-height]) cylinder(r=3/2, h=2*height, $fn=50);
}
