// http://www.thingiverse.com/thing:9095 (Knurled surface finishing library)
include <knurledFinishLib_v2.scad>
include <MCAD/nuts_and_bolts.scad>

height = 10;
rbig = 9;
screw_r = 6.1/2;
screw_h = 20;
screw_head_h = 2;
screw_m_value = 3;

difference() {
    knurled_cyl(chg=height, cod=rbig*2,
                cwd=3.5, csh=3.5, cdp=1.25,
                fsh=2, smt=0);
    translate([0,0,screw_head_h]) {
        scale([1,1,5]) nutHole(screw_m_value);
    }
}

translate([2.2*rbig,0,0])
intersection() {
    difference() {
        scale([1,1,height-screw_head_h]) nutHole(screw_m_value);
        translate([0,0,-height]) cylinder(r=3/2, h=2*height, $fn=50);
    }
    cylinder(h=height-screw_head_h, r=rbig);
}
