//include <iPod_nano_4gen_bike_mount.scad>

$fn=16;
//production=false;

ipod_n4_height=70;        // top to bottom when looking at the display
ipod_n4_width=53;        // left ro right when looking at the display
ipod_n4_edge_radius=5.3; // radius of circle describing the edge's radius

module ipodStandTop(ipx=ipod_n4_width, ipy=ipod_n4_height, width=4, border=8) {
    rotate([0,180,0]) difference() {
        union() {
            // einrastschienen links und rechts
            for(rot=[0:180:180]) {
                rotate([0,0,rot]) union() {
                    translate([(-ipx-border+width)/2,0,-width/2]) cube([border+width, 2*border+ipy, width], center=true);
                    translate([(-ipx-border)/2,0,-3.5-width]) cube([border, 2*border+ipy, 7], center=true);
                }
            }
            // Einrastschienen unten
            translate([0,(-ipy-border+width)/2,-width/2]) cube([ipx+2*border, border+width, width], center=true);
            translate([0,(-ipy-border)/2,-3.5-width]) cube([2*border+ipx, border, 7], center=true);
            // klebelöcher
            translate([0,0,-border-2.8*width]) {
            translate([(ipx+border)/2,ipy/3,  0]) cylinder(r=2, h=border, $fn=36);
            translate([(ipx+border)/2,-ipy/3, 0]) cylinder(r=2, h=border, $fn=36);
            translate([-(ipx+border)/2,ipy/3, 0]) cylinder(r=2, h=border, $fn=36);
            translate([-(ipx+border)/2,-ipy/3,0]) cylinder(r=2, h=border, $fn=36);
            }
        }
        // hole for earplug
        //translate([18,(-ipy+border)/2.05,0]) rotate([90,0,0]) cylinder(r1=9,r2=9,h=3*border, center=false);
        translate([18,(-ipy-border+width)/2,0]) cube([20,border+width+1,50], center=true);
    }
}
ipodStandTop(width=3.5);
