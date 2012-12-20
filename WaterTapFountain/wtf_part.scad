include <teardrop.scad>
include <regular_shapes.scad>

$fn=128;
tap_radius = 23.2/2;
tap_height = 30;
tap_wall_width = 4;
tap_new_opening_radius = 8;
fountain_radius = 2;
fountain_height = 10;
fountain_angle = 20;
fountain_width = 4;

difference() {
    union() {
        // outer shell
        cylinder(r=tap_radius+tap_wall_width, h=tap_height);
        translate([0,0,tap_height]) torus(tap_radius+tap_wall_width, tap_radius);
        // fountain
        translate([0,0,fountain_radius+fountain_width]) union() {
            translate([(tap_radius+tap_wall_width)/2,0,0]) teardrop(fountain_radius+fountain_width, tap_radius+tap_wall_width, 90);
            translate([tap_radius+tap_wall_width,0,0]) {
                sphere(r=fountain_radius+fountain_width);
                rotate([0,fountain_angle,0]) {
                    cylinder(r=fountain_radius+fountain_width, h=fountain_height);
                    translate([0,0,fountain_height]) torus(fountain_radius+fountain_width, fountain_radius);
                }
            }
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

*linear_extrude(height=10) {
    projection(cut = false) translate([4,0,0]) rotate([0,0,180,0,180]){
        //rotate([0,0,45]) square(sqrt(2)*fountain_radius, center=true);
        //circle(r=fountain_radius);
        translate([0,0,0.5]) rotate([0,0,45]) cube([sqrt(2)*fountain_radius,sqrt(2)*fountain_radius,1], center=true);
        intersection() {
            cylinder(r=fountain_radius,h=1);
            translate([-fountain_radius,0,0]) cube([2*fountain_radius, 2*fountain_radius,2], center=true);
        }
    }
}
