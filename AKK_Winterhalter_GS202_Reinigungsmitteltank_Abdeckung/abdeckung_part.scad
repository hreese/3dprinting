dx = 103;
dy = 33;
dwidth = 2;
hx = 73;
hy = 28;
hwidth = 1.5;
hrad = 5;
offhx = 9;
offhy = 2.5;

$fn=36;
module innenteil(h=6, w=0) {
    hull() {
        // unten link
        translate([offhx+hrad+w, offhy+hrad+w, 0]) cylinder(r=hrad, h=h);
        // oben links
        translate([offhx+hrad+w, offhy-hrad+hy-w, 0]) cylinder(r=hrad, h=h);
        // unten rechts
        translate([offhx+hrad+hx-w, offhy+hrad+w, 0]) cylinder(r=hrad, h=h);
        // oben rechts
        translate([offhx+hrad+hx-w, offhy-hrad+hy-w, 0]) cylinder(r=hrad, h=h);
    }
}

module abdeckung() {
    // Deckel
    cube([dx, dy, dwidth]);
    difference() {
        translate([0,0,dwidth]) innenteil();
        translate([0,0,dwidth-1])innenteil(h=8, w=1.5);
        translate([0,offhy+hrad,-0.1]) cube([dx,1,15]);
        translate([0,offhy+hy-hrad-1,-0.1]) cube([dx,1,15]);
        translate([offhx+hrad,0,-0.1]) cube([1,dy,15]);
        translate([offhx+hx+hrad-1,0,-0.1]) cube([1,dy,15]);
    }
}

abdeckung();
