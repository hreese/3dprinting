$fn=128;
my_r = 10;
my_w = 70;
height = my_w/2;
wall = 5;
r_schraube1 = 2;

module boxshape(w, r) {
    difference() {
        translate([0,0,0.5]) cube([w, w, 1], center=true);
        union() {
            translate([w/2, w/2, 0])   cylinder(h=10, r=r, center=true);
            translate([-w/2, -w/2, 0]) cylinder(h=10, r=r, center=true);
            translate([my_w/2, -my_w/2, -1]) rotate([0,0,90]) scale([1,1,20]) eckensaege(my_r);
            translate([-my_w/2, my_w/2, -1]) rotate([0,0,270]) scale([1,1,20]) eckensaege(my_r);
        }
    }
}

module eckensaege(r) {
    translate([r/2, r/2, 0])
    difference() {
        translate([-r/2,-r/2,0.5])       cube([2*r, 2*r, 1], center=true);
        translate([r/2, r/2, 0])   cylinder(h=10, r=r, center=true);
    }
}

module deckel() {
    difference() {
        union() {
            scale([1,1,wall]) boxshape(my_w, my_r);
            translate([0,0,wall]) scale(0.95 * (my_w-2*wall)/my_w) scale([1,1,wall*0.5]) intersection() {
                boxshape(my_w, my_r);
                rotate([0,0,90]) boxshape(my_w, my_r);
            }
        }
        union() {
            cylinder(h=100, r=7/2, center=true);
            translate([0,0,-1]) _eckdingens(r_schraube1);
        }
    }
}

module _eckdingens(r) {
    translate([+my_w/2-my_r, -my_w/2+my_r, height/2])   cylinder(h=height, r=r, center=true);
    translate([-my_w/2+my_r, +my_w/2-my_r, height/2])   cylinder(h=height, r=r, center=true);
}

module kiste() {
    difference() {
        union() {
            difference() {
                scale([1,1,height]) boxshape(my_w, my_r);
                union() {
                    translate([0,0,wall]) scale((my_w-2*wall)/my_w) scale([1,1,2*height]) boxshape(my_w, my_r);
                    translate([0,1.5*my_w,wall+3]) rotate([90,0,0]) cylinder(h=3*my_w, r=3, center=true);
                }
            }
            scale([1,1,0.95*(my_w-wall)/my_w]) _eckdingens(my_r);
        }
        translate([0,0,10]) _eckdingens(r_schraube1);
    }
}
