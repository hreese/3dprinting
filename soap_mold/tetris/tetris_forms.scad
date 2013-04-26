/* Tetris-Blocks are 10x10x10 cm to ease modelling and are scaled by
   scale_fac in the *_part.scad-files.
*/

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

// generate different forms for cutting decorations from the side
module decoration(type = 0) {
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

/* Configurations of sidedecorations
   top, front, back, right, left // bottom would be [180,0,0]
*/
decoration_all                = [[0,0,0], [90,0,0],  [270,0,0], [90,0,90], [90,0,270]];
decoration_without_back       = [[0,0,0], [90,0,0],  [90,0,90], [90,0,270]];
decoration_without_front      = [[0,0,0], [270,0,0], [90,0,90], [90,0,270]];
decoration_without_left       = [[0,0,0], [90,0,0],  [270,0,0], [90,0,90]];
decoration_without_right      = [[0,0,0], [90,0,0],  [270,0,0], [90,0,270]];
decoration_without_frontback  = [[0,0,0], [90,0,90], [90,0,270]];
decoration_without_frontright = [[0,0,0], [270,0,0], [90,0,270]];
decoration_without_frontleft  = [[0,0,0], [270,0,0], [90,0,90]];
decoration_without_backright  = [[0,0,0], [90,0,0],  [90,0,270]];
decoration_without_backleft   = [[0,0,0], [90,0,0],  [90,0,90]];
decoration_only_topfront      = [[0,0,0], [90,0,0]];

// predefined side shaped
i_decoration = 0;
j_decoration = 2;
l_decoration = 1;
o_decoration = 0;
s_decoration = 3;
t_decoration = 0;
z_decoration = 3;

// create tetris-block with custom configuration for placement and
// shape of the sidedecorations
module tetris_block(myrot = decoration_all, btype = 3) {
    difference() {
        tetris_raw();
        for (rot = myrot ) {
            rotate(rot) decoration(btype);  // unten
        }
    }
}

module i() {
    union() {
        translate([0,0,0]) tetris_block(decoration_without_back, i_decoration);
        translate([0,10,0]) tetris_block(decoration_without_frontback, i_decoration);
        translate([0,20,0]) tetris_block(decoration_without_frontback, i_decoration);
        translate([0,30,0]) tetris_block(decoration_without_front, i_decoration);
    }
}

module j() {
    union() {
        translate([0,0,0]) tetris_block(decoration_without_back, j_decoration);
        translate([0,10,0]) tetris_block(decoration_without_frontback, j_decoration);
        translate([0,20,0]) tetris_block(decoration_without_frontright, j_decoration);
        translate([10,20,0]) tetris_block(decoration_without_left, j_decoration);
    }
}

module l() {
    union() {
        translate([0,0,0])    tetris_block(decoration_without_back, l_decoration);
        translate([0,10,0])   tetris_block(decoration_without_frontback, l_decoration);
        translate([0,20,0])   tetris_block(decoration_without_frontleft, l_decoration);
        translate([-10,20,0]) tetris_block(decoration_without_right, l_decoration);
    }
}

module o() {
    union() {
        translate([0,0,0])   tetris_block(decoration_without_backright, o_decoration);
        translate([10,0,0])  tetris_block(decoration_without_backleft, o_decoration);
        translate([0,10,0])  tetris_block(decoration_without_frontright, o_decoration);
        translate([10,10,0]) tetris_block(decoration_without_frontleft, o_decoration);
    }
}

module s() {
    union() {
        translate([10,0,0]) tetris_block(decoration_without_back, s_decoration);
        translate([10,10,0]) tetris_block(decoration_without_frontleft, s_decoration);
        translate([0,10,0])  tetris_block(decoration_without_backright, s_decoration);
        translate([0,20,0])  tetris_block(decoration_without_front, s_decoration);
    }
}

module t() {
    union() {
        translate([0,0,0])   tetris_block(decoration_without_right, t_decoration);
        translate([10,0,0])  tetris_block(decoration_nur_topfront, t_decoration);
        translate([20,0,0])  tetris_block(decoration_without_left, t_decoration);
        translate([10,10,0]) tetris_block(decoration_without_front, t_decoration);
    }
}

module z() {
    union() {
        translate([0,0,0])   tetris_block(decoration_without_back, z_decoration);
        translate([0,10,0])  tetris_block(decoration_without_frontright, z_decoration);
        translate([10,10,0]) tetris_block(decoration_without_backleft, z_decoration);
        translate([10,20,0]) tetris_block(decoration_without_front, z_decoration);
    }
}


