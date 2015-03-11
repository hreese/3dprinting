my_r = 8;
my_w = 45;

module boxshape(w, r) {
    difference() {
        translate([0,0,0.5]) cube([w, w, 1], center=true);
        union() {
            translate([w/2, w/2, 0])   cylinder(h=10, r=r, center=true, $fn=50);
            translate([-w/2, -w/2, 0]) cylinder(h=10, r=r, center=true, $fn=50);
        }
    }
}

module eckensaege(r) {
    translate([r/2, r/2, 0])
    difference() {
        translate([-r/2,-r/2,0.5])       cube([2*r, 2*r, 1], center=true);
        translate([r/2, r/2, 0])   cylinder(h=10, r=r, center=true, $fn=50);
    }
}

difference() {
    boxshape(my_w, my_r);
    translate([my_w/2, -my_w/2, -1]) rotate([0,0,90]) scale([1,1,20]) eckensaege(my_r);
    translate([-my_w/2, my_w/2, -1]) rotate([0,0,270]) scale([1,1,20]) eckensaege(my_r);
}
