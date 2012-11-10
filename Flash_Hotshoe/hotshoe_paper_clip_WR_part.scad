hs_w      = 18.5;
hs_l      = 17.2;
hs_h      = 2;
hs2_w     = 12;
hs2_l     = hs_l;
hs2_h     = 2;
hs2_x_off = (hs_w-hs2_w)/2;
hs3_l     = 13;
hs3_h     = 5;
hs3_w     = 1.2;

module hotshoe() {
    union() {
        difference() {
            cube([hs_w, hs_l, hs_h]);
            translate([-1,hs_l,hs_h/3]) rotate([60,0,0]) cube([hs2_x_off+1, 10,10]);
            translate([hs2_x_off+hs2_w,hs_l,hs_h/3]) rotate([60,0,0]) cube([hs2_x_off+1, 10,10]);
        }
        translate([hs2_x_off, 0, hs_h-0.01]) {
            cube([hs2_w, hs2_l, hs2_h]);
            for ( i = [0:5]) 
                translate([0,1+i*1.8,hs2_h]) rotate([0,90,0]) rotate([0,0,30]) cylinder(h=hs2_w, $fn=3);
        }
        translate([hs2_x_off, hs2_l-1, hs_h-0.01])
        rotate([50,0,0])
        difference() {
            union() {
                translate([1,1,hs3_h-1]) linear_extrude(height=1+1) import(file="WR.dxf", layer="initials");
                cube([hs2_w, hs3_l, hs3_h]);
                translate([0,0,hs3_h/2]) rotate([0,90,0]) cylinder(h=hs2_w, r=hs3_h/2, $fn=36);
            }
            translate([-1,3,(hs3_h-hs3_w)/2]) cube([hs2_w+2, hs3_l, hs3_w]);
        }
    }
}

hotshoe();

