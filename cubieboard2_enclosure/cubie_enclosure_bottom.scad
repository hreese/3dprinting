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

module hollow_cubie_enclosure() {
    difference() {
        enclosure_shape();
        union() {
            // inner space
            translate([wall_thickness, wall_thickness, wall_thickness]) {
                cube([2 * cubie_offset_side + cubie_width,
                      2 * cubie_offset_side + cubie_depth,
                      encl_full_height]);
            }

        }
    }
}

module cubie_base_sockets(d1 = 6, d2 = 6 + cubie_offset_side, h1 = 2.5, hfull = cubie_space_below, screw_rad = encl_screw_rad) {
    translate([0, 0, -hfull])
    difference() {
        union() {
            translate([-d2/2, -d2/2, 0])        { cube([d2,d2,hfull-h1]); }
            translate([-d1/2, -d1/2, hfull-h1]) { cube([d1,d1,h1]); }
        }
        translate([0, 0, -1]) { cylinder(r=screw_rad, h=hfull+2); }
    }
}

module cubie_enclosure_with_sockets() {
    union() {
        hollow_cubie_enclosure();
        // everything in here is in "cubieboard-coordinates"
        translate([wall_thickness + cubie_offset_side, wall_thickness + cubie_offset_side, wall_thickness + cubie_space_below]) {
            translate([23, 3.5, -0.001])    { cubie_base_sockets(); }
            translate([96.5, 3.5, -0.001])  { cubie_base_sockets(h1 = cubie_space_below); }
            translate([23, 56.5, -0.001])   { cubie_base_sockets(); }
            translate([96.5, 56.5, -0.001]) { cubie_base_sockets(h1 = cubie_space_below); }
        }
    }
}

difference() {
    cubie_enclosure_with_sockets();
    // everything in here is in horizontal cubieboard-coordinates
    translate([wall_thickness + cubie_offset_side, wall_thickness + cubie_offset_side, 0]) {
        union() {
            // GPIO ports
            translate([42,0,-1]) { cube([51,8,wall_thickness+2]); }
            translate([42,cubie_depth-8,-1]) { cube([51,8,wall_thickness+2]); }
            // parts on the side
            translate([0, 0, cubie_space_below]) {
                translate([0, -cubie_offset_side-wall_thickness-1, 0]) cube([20, wall_thickness+2, 15]); // micro-sd
                translate([26, -cubie_offset_side-wall_thickness-1, 0]) cube([18, wall_thickness+2, 20]); // usb
                translate([-cubie_offset_side-wall_thickness-1, 16, -2]) { cube([wall_thickness+2, 23, 12]); } // hdmi
                translate([-cubie_offset_side-wall_thickness-1, 37, 0]) { cube([wall_thickness+2, 6, 4]); } // power
                #rotate([0, 90, 0]) translate([-wall_thickness-cubie_offset_side-1, 0, 0]) cylinder(r=3, h=wall_thickness+2, center=true); // TODO
            }
        }
    }
}
// x: 42-94; y: 0-6