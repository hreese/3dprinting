hs_w      = 18.0;
hs_l      = 17.2;
hs_h      = 1.9; // 2
hs2_w     = 12;
hs2_l     = hs_l+5;
hs2_h     = 2;
hs2_x_off = (hs_w-hs2_w)/2;
hs2_elev  = 1;
hs3_l     = 12;
hs3_h     = 5;
hs3_w     = 0.8;
//logodxf   = "HR.dxf";
logodxf   = "HR.dxf";

module hotshoe() {
    union() {
        // lower hotshow
        difference() {
            cube([hs_w, hs_l, hs_h]);
            translate([-1,hs_l,hs_h/3]) rotate([60,0,0]) cube([hs2_x_off+1, 10,10]);
            translate([hs2_x_off+hs2_w,hs_l,hs_h/3]) rotate([60,0,0]) cube([hs2_x_off+1, 10,10]);
        }
        // upper plate including grip
        translate([hs2_x_off, 0, hs_h-0.01]) {
            rotate([90,0,90])
            linear_extrude(height=hs2_w) {
                polygon(
                points=[[0,0], [hs2_l,0], [hs_l,0], [hs2_l,hs2_elev],[hs2_l,hs2_elev+hs2_h],
                //[hs_l,hs2_h],
                [0,hs2_h]],
                paths=[[0,1,2,3,4,5,6]]
                );
            }
            for ( i = [0:3]) {
                translate([hs2_w/2,1+2.8*(i),hs2_h]) scale([1,1,1.7]) rotate([45,0,0]) cube([hs2_w,sqrt(2), sqrt(2)], center=true);
            }
        }
        translate([hs2_x_off, hs2_l, hs_h+hs2_elev+hs2_h/2-0.01])
        rotate([45,0,0])
        difference() {
            union() {
                // Logo
                //translate([1,1,hs3_h-1]) linear_extrude(height=1+1) import(file=logodxf);
                // clasp
                cube([hs2_w, hs3_l, hs3_h]);
                translate([0,0,hs3_h/2]) scale([1,1.5,1]) rotate([0,90,0]) cylinder(h=hs2_w, r=hs3_h/2, $fn=36);
            }
            translate([-1,2,(hs3_h-hs3_w)/2]) cube([hs2_w+2, hs3_l, hs3_w]);
        }
    }
}

hotshoe();

