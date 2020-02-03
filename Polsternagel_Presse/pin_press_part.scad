include <variables.scad>
include <endstop_rail.scad>

module pin_press_tool() {
    difference() {
        union() {
            cylinder(h=toolheight, d=tooldiam, $fn=100);
            for(i=[0:1]) {
                rotate([0,0,90+180*i]) translate([0,-0.9*tooldiam/2,0]) endstop_rail(holes=esholes, height=esrailheight);
            }
        }
        union () {
            // shaft for attachment to linear actuator
            translate([0,0,magnetshaftstart+magnetheight+springheight]) cylinder(h=toolheight, d=shaftdiam, $fn=100);
            // shaft for magnet and spring
            translate([0,0,magnetshaftstart]) cylinder(h=magnetheight+springheight+0.1, d=magnetdiam, $fn=100);
            translate([0,0,magnetshaftstart+magnetheight+springheight+shaftdistancethroughhole])  rotate([90,0,0]) cylinder(d=throughholediam, h=2*tooldiam, center=true, $fn=100);
            translate([0,0,-0.001]) rotate_extrude($fn = 100) {
                import("shape_pin.svg");
            }
        }
    }
}

// punch tool
// pin_press_tool();
translate ([75,75,0]) difference() {
    rotate([0,0,90]) pin_press_tool();
    translate([0,0,-0.01]) cube([20,20,50]);
}

// end stop holder
scalefactor = 1.03;
sensorrailthickness=3;
sensorrailwidth = esrailwidth + 2*sensorrailthickness;
sensorraildepth = 7;

module endstopholder() {
    difference() {
        translate([-sensorrailwidth/2,0,0]) cube([sensorrailwidth, sensorraildepth, esrailheight*0.8]);
        #scale(scalefactor) translate([0, esraildepth+sensorrailthickness,-0.1*esrailheight]) endstop_rail(holes=[], height=esrailheight*2);
    }
}

endstopholder();