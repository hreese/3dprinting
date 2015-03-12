$fn=128;
my_r = 5;
my_w = 40;
height = my_w*0.6;
wall = 4;
r_schraube1 = 2.5/2;

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
            translate([+my_w/2-my_r, -my_w/2+my_r, -0.01]) cylinder(h=2.75, r1=3, r2=r_schraube1, center=false);
            translate([-my_w/2+my_r, +my_w/2-my_r, -0.01]) cylinder(h=2.75, r1=3, r2=r_schraube1, center=false);
        }
    }
}

module _eckdingens(r) {
    translate([+my_w/2-my_r, -my_w/2+my_r, height/2]) cylinder(h=height, r=r, center=true);
    translate([-my_w/2+my_r, +my_w/2-my_r, height/2]) cylinder(h=height, r=r, center=true);
}

module kiste() {
    difference() {
        union() {
            difference() {
                scale([1,1,height]) boxshape(my_w, my_r);
                union() {
                    translate([0,0,wall]) scale((my_w-2*wall)/my_w) scale([1,1,2*height]) boxshape(my_w, my_r);
                    translate([0,1.5*my_w,5+wall+2]) rotate([90,-90,0]) cylinder(h=3*my_w, r=4, center=true, $fn=3);
                }
            }
            scale([1,1,0.95*(my_w-wall)/my_w]) _eckdingens(my_r);
            translate([-10, 6.1, 0]) difference() {
                cube([20,10,wall+5]);
                union() {
                    translate([4,5,wall]) cylinder(my_w, r_schraube1);
                    translate([16,5,wall]) cylinder(my_w, r_schraube1);
                }
            }
        }
        translate([0,0,10]) _eckdingens(r_schraube1);
    }
}
