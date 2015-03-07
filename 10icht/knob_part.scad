// http://www.thingiverse.com/thing:9095 (Knurled surface finishing library)
include <knurledFinishLib_v2.scad>
include <MCAD/nuts_and_bolts.scad>

height = 25;
rbig = 9;

difference() {
    knurl(   
        k_cyl_hg = height,
        k_cyl_od = rbig*2,
        knurl_wd = 3.5,
        knurl_hg = 3.5,
        knurl_dp = 1.25,
        e_smooth = 1,
        s_smooth = 0);
    translate([0,0,height-14+0.05]) {
        cylinder(h=14, r=6/2, $fn=50);
    }
}

