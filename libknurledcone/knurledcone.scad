module knurled_cone( r1=4, r2=1, h = 5, dent_h = 1 ) {
    color("cyan", 0.3) cylinder(r1=r1, r2=r2, h=h, $fn=64);
    #translate([r1,0,0]) rotate([0,180+atan(h/(r1-r2)),0]) cylinder(r1=dent_h,r2=0, h=dent_h, $fn=4);

}

knurled_cone();
