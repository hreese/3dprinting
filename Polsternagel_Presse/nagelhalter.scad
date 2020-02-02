// 9mm (kante <-> mitte loch); d=6
// Height distance pin (Polsternagel)
pinheight=6.3;

// diameter & height of linear actuator shaft 
shaftdiam = 20;
shaftheight = 18;
shaftdistancethroughhole = 9;
throughholediam = 6;

// diameter & height of magnet to hold distance pin
magnetdiam=7.5;
magnetheight=15;
//magnetdiam=15;
//magnetheight=8;

// length of spring above magnet
springheight=0; // no spring
magnetshaftstart=pinheight;

// acumulated height of tool
toolheight=pinheight+magnetheight+springheight+shaftheight;
tooldiam=28;

attachmentoffset = 2;
attachmentheight = 16;

difference() {
    union() {
        cylinder(h=toolheight, d=tooldiam, $fn=100);
        translate([0,0,attachmentheight/2]) cube([tooldiam*0.8, tooldiam+attachmentoffset, attachmentheight], center=true);
        rotate([0,0,90]) translate([0,0,attachmentheight/2]) cube([tooldiam*0.8, tooldiam+attachmentoffset, attachmentheight], center=true);
    }
    union () {
        // shaft for attachment to linear actuator
        translate([0,0,magnetshaftstart+magnetheight+springheight]) cylinder(h=toolheight, d=shaftdiam, $fn=100);
        // shaft for magnet and spring
        translate([0,0,magnetshaftstart]) cylinder(h=magnetheight+springheight+0.1, d=magnetdiam, $fn=100);
        translate([0,0,magnetshaftstart+magnetheight+springheight+shaftdistancethroughhole])  rotate([90,0,0]) cylinder(d=throughholediam, h=1.2*tooldiam, center=true, $fn=100);
        translate([0,0,-0.001]) rotate_extrude($fn = 100) {
            import("shape_pin.svg");
        }
    }
}