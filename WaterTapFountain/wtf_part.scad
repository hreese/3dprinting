include <teardrop.scad>
include <regular_shapes.scad>

/*
 * Please change tap_radius and tap_wall_width
 * to fit your water tap.
 * You may change any other value. but the defaults should be fine.
 */
// Radius of water outlet goes here
tap_radius = 23.2/2;
// Height == maximum insertion depth
tap_height = 30;
// width of outer layer
tap_wall_width = 2.8;
// size of opening at the bottom
tap_new_opening_radius = tap_radius - tap_wall_width;
// radius of new water outlet
fountain_radius = 3;
// height of new water outlet
fountain_height = 16;
// ejection angle of new water jet
fountain_angle = 36;
// layer width of 
fountain_width = tap_wall_width;
// higher value -> smoother shape
$fn=128;

difference() {
    union() {
        // outer shell
        cylinder(r=tap_radius+tap_wall_width, h=tap_height);
        translate([0,0,tap_height]) torus(tap_radius+tap_wall_width, tap_radius);
        // fountain
        intersection() {
            translate([0,0,fountain_radius+fountain_width]) union() {
                translate([(tap_radius+tap_wall_width)/2,0,0]) teardrop(fountain_radius+fountain_width, tap_radius+tap_wall_width, 90);
                translate([tap_radius+tap_wall_width,0,0]) {
                    //sphere(r=fountain_radius+fountain_width);
                    rotate([0,fountain_angle,0]) {
                        cylinder(r=fountain_radius+fountain_width, h=fountain_height*2, center=true);
                        translate([0,0,fountain_height]) torus(fountain_radius+fountain_width, fountain_radius);
                    }
                }
            }
            cylinder(r=tap_radius+tap_wall_width+fountain_height, h=tap_height);
        }
    }
    union() {
        // inner space
        translate([0,0,-0.05]) union() {
            translate([0,0,tap_wall_width]) cylinder(r=tap_radius, h=tap_height-tap_wall_width+1);
            cylinder(r1=tap_new_opening_radius, r2=tap_radius, h=tap_wall_width);
        }
        // fountain
        translate([0,0,fountain_radius+fountain_width]) union() {
            translate([(tap_radius+tap_wall_width)/2,0,0]) teardrop(fountain_radius, tap_radius+tap_wall_width, 90);
            translate([tap_radius+tap_wall_width,0,0]) {
                sphere(r=fountain_radius);
                rotate([0,fountain_angle,0]) cylinder(r=fountain_radius, h=fountain_height+1);
            }
        }
    }
}
