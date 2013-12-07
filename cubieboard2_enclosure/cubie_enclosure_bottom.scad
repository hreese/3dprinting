$fn=64;

cubie_depth=60;
cubie_width=100;

cubie_mounthole_rad   = 3;
cubie_mounthole_l_x   = 23;
cubie_mounthole_r_x   = 97.5;
cubie_mounthole_off_y = 3;

cubie_offset_side = 3;

wall_thickness = 3;
cubie_space_below = 8;
cubie_space_above = 16;

encl_corner_rad = 6;
encl_corner_off = 3;
encl_screw_rad  = 2;

encl_full_width  = 2 * cubie_offset_side + 2 * wall_thickness + cubie_width;
encl_full_depth  = 2 * cubie_offset_side + 2 * wall_thickness + cubie_depth;
encl_full_height = 1 * wall_thickness + cubie_space_below + cubie_space_above;

module screw_cylinder (r1 = encl_corner_rad, r2 = encl_screw_rad, h = encl_full_height) {
    difference() {
        cylinder(r = r1, h = h);
        translate([0,0,-1]) { cylinder(r = r2, h = h+2); }
    }
}

module enclosure_shape(h = encl_full_height) {
    difference() {
        union() {
            // outer shell
            cube([encl_full_width,
                encl_full_depth,
                encl_full_height]);
            // corners
            translate([0,0,0]) { cylinder(r = encl_corner_rad, h = encl_full_height); }
            translate([encl_full_width,0,0]) { cylinder(r = encl_corner_rad, h = encl_full_height); }
            translate([0,encl_full_depth,0]) { cylinder(r = encl_corner_rad, h = encl_full_height); }
            translate([encl_full_width,encl_full_depth,0]) { cylinder(r = encl_corner_rad, h = encl_full_height); }
        }
        // screw holes
        union() {
            translate([0,0,-1]) { cylinder(r = encl_screw_rad, h = encl_full_height+2); }
            translate([encl_full_width,0,-1]) { cylinder(r = encl_screw_rad, h = encl_full_height + 2); }
            translate([0,encl_full_depth,-1]) { cylinder(r = encl_screw_rad, h = encl_full_height + 2); }
            translate([encl_full_width,encl_full_depth,-1]) { cylinder(r = encl_screw_rad, h = encl_full_height + 2); }
        }
    }

}

difference() {
    enclosure_shape();
    union() {
        // inner space
        translate([wall_thickness, wall_thickness, wall_thickness]) {
            cube([2 * cubie_offset_side + cubie_width,
                  2 * cubie_offset_side + cubie_depth,
                  encl_full_height]);
        }
        // everything in here is in "cubieboard-coordinates"
        translate([wall_thickness + cubie_offset_side, wall_thickness + cubie_offset_side, wall_thickness + cubie_space_below]) {
        }
    }
}
