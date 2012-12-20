$fn = 128;
breite_basis = 10;
basis_radius_edge = 3;
basis_height = 2;

cone_r1 = 10;
cone_r2 = 2;
cone_h = 23;
cone_del_offset = basis_height-1;

difference() {
    union() {
        // basis
        hull() {
            for (x=[-1,-1,1,1]) {
                for(y=[-1,1,-1,1]) {
                    translate([x*breite_basis, y*breite_basis,0]) cylinder(r=basis_radius_edge, h=basis_height);
                }
            }
        }

        // cone
        translate([0,0,basis_height/2]) union() {
            // outer cone
            cylinder(r1=cone_r1, r2=cone_r2, h=cone_h);
            // tip
            //translate([0,0,cone_h]) sphere(r=cone_r2, center=true);
        }
    }
    // inner space
    translate([0,0,-abs(cone_del_offset)]) cylinder(r1=cone_r1, r2=cone_r2, h=cone_h);
}
