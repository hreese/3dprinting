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
    knurl(   
        k_cyl_hg = height,
        k_cyl_od = rbig*2,
        knurl_wd = 3.5,
        knurl_hg = 3.5,
        knurl_dp = 1.25,
        e_smooth = 1,
        s_smooth = 0);
    translate([0,0,screw_head_h]) {
        scale([1,1,5]) nutHole(screw_m_value, tolerance=0.25);
    }
}

/*
translate([2.2*rbig,0,0])
intersection() {
    difference() {
        scale([1,1,height-screw_head_h]) nutHole(screw_m_value);
        translate([0,0,-height]) cylinder(r=3/2, h=2*height, $fn=50);
    }
    cylinder(h=height-screw_head_h, r=rbig);
}
*/
