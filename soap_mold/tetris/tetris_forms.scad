scale_f=2.5;
edge_fac=1.3;
screw_diam=2.5;

module tetris_raw() {
    difference() {
        intersection() {
            // basic block
            cube([10,10,10], center=true);
            // beveled edges
            rotate([45,0,0]) cube([10*edge_fac,10*edge_fac,10*edge_fac], center=true);
            rotate([45,0,90]) cube([10*edge_fac,10*edge_fac,10*edge_fac], center=true);
            rotate([45,90,90]) cube([10*edge_fac,10*edge_fac,10*edge_fac], center=true);
        }
        // screw hole
        union() {
            translate([0,0,-5]) cylinder(r=screw_diam/2/scale_f, h=10, center=true, $fn=32);
            translate([0,0,-0.001]) cylinder(r1=screw_diam/2/scale_f, r2=0, h=screw_diam/2/scale_f,$fn=32);
        }
    }
}

module bump(type = 0) {
    if (type == 0) {
        translate([0,0,5.01]) rotate([0,180,45]) cylinder(r1=4.5, r2=2, h=1, $fn=4);
    }
    if (type == 1) {
        translate([0,0,5.01]) rotate([180,0,45]) cylinder(r1=5,r2=3,h=1,$fn=4);
    }
    if (type == 2) {
        translate([0,0,5.01]) rotate([180,0,45]) cylinder(r1=3,r2=0,h=1,$fn=4);
    }
    if (type == 3) {
        difference() {
        translate([0,0,5.01]) rotate([180,0,45]) cylinder(r1=5,r2=3.5,h=1,$fn=4);
        translate([0,0,0.4]) rotate([0,0,45]) cylinder(r1=3.5,r2=2,h=1,$fn=4);
        }
    }
}

// oben, vorne, hinten, rechts, links // unten ist [180,0,0]
bump_all               = [[0,0,0], [90,0,0], [270,0,0], [90,0,90], [90,0,270]];
bump_ohne_hinten       = [[0,0,0], [90,0,0], [90,0,90], [90,0,270]];
bump_ohne_vorne        = [[0,0,0], [270,0,0], [90,0,90], [90,0,270]];
bump_ohne_links        = [[0,0,0], [90,0,0], [270,0,0], [90,0,90]];
bump_ohne_rechts       = [[0,0,0], [90,0,0], [270,0,0], [90,0,270]];
bump_ohne_vornehinten  = [[0,0,0], [90,0,90], [90,0,270]];
bump_ohne_vornerechts  = [[0,0,0], [270,0,0], [90,0,270]];
bump_ohne_vornelinks   = [[0,0,0], [270,0,0], [90,0,90]];
bump_ohne_hintenrechts = [[0,0,0], [90,0,0], [90,0,270]];
bump_ohne_hintenlinks  = [[0,0,0], [90,0,0], [90,0,90]];
bump_nur_obenvorne     = [[0,0,0], [90,0,0]];

module tetris_block(myrot = bump_all, btype = 3) {
    difference() {
        tetris_raw();
        for (rot = myrot ) {
            rotate(rot) bump(btype);  // unten
        }
    }
}

i_bump = 0;
module i() {
    union() {
        translate([0,0,0]) tetris_block(bump_ohne_hinten, i_bump);
        translate([0,10,0]) tetris_block(bump_ohne_vornehinten, i_bump);
        translate([0,20,0]) tetris_block(bump_ohne_vornehinten, i_bump);
        translate([0,30,0]) tetris_block(bump_ohne_vorne, i_bump);
    }
}

j_bump = 2;
module j() {
    union() {
        translate([0,0,0]) tetris_block(bump_ohne_hinten, j_bump);
        translate([0,10,0]) tetris_block(bump_ohne_vornehinten, j_bump);
        translate([0,20,0]) tetris_block(bump_ohne_vornerechts, j_bump);
        translate([10,20,0]) tetris_block(bump_ohne_links, j_bump);
    }
}

l_bump = 1;
module l() {
    union() {
        translate([0,0,0])    tetris_block(bump_ohne_hinten, l_bump);
        translate([0,10,0])   tetris_block(bump_ohne_vornehinten, l_bump);
        translate([0,20,0])   tetris_block(bump_ohne_vornelinks, l_bump);
        translate([-10,20,0]) tetris_block(bump_ohne_rechts, l_bump);
    }
}

o_bump=0;
module o() {
    union() {
        translate([0,0,0])   tetris_block(bump_ohne_hintenrechts, o_bump);
        translate([10,0,0])  tetris_block(bump_ohne_hintenlinks, o_bump);
        translate([0,10,0])  tetris_block(bump_ohne_vornerechts, o_bump);
        translate([10,10,0]) tetris_block(bump_ohne_vornelinks, o_bump);
    }
}

s_bump = 3;
module s() {
    union() {
        translate([10,0,0]) tetris_block(bump_ohne_hinten, s_bump);
        translate([10,10,0]) tetris_block(bump_ohne_vornelinks, s_bump);
        translate([0,10,0])  tetris_block(bump_ohne_hintenrechts, s_bump);
        translate([0,20,0])  tetris_block(bump_ohne_vorne, s_bump);
    }
}

t_bump=0;
module t() {
    union() {
        translate([0,0,0])   tetris_block(bump_ohne_rechts, t_bump);
        translate([10,0,0])  tetris_block(bump_nur_obenvorne, t_bump);
        translate([20,0,0])  tetris_block(bump_ohne_links, t_bump);
        translate([10,10,0]) tetris_block(bump_ohne_vorne, t_bump);
    }
}

z_bump = 3;
module z() {
    union() {
        translate([0,0,0])   tetris_block(bump_ohne_hinten, z_bump);
        translate([0,10,0])  tetris_block(bump_ohne_vornerechts, z_bump);
        translate([10,10,0]) tetris_block(bump_ohne_hintenlinks, z_bump);
        translate([10,20,0]) tetris_block(bump_ohne_vorne, z_bump);
    }
}


