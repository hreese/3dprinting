scale_f=2.5;
edge_fac=1.3;
screw_diam=2.5;

module tetris_raw() {
    difference() {
        intersection() {
            // basic block
            cube([10,10,10], center=true);
            // beveled edges
            rotate([45,0,0]) cube([10*edge_fac,10*edge_fac,10*edge_fac], center=true);
            rotate([45,0,90]) cube([10*edge_fac,10*edge_fac,10*edge_fac], center=true);
            rotate([45,90,90]) cube([10*edge_fac,10*edge_fac,10*edge_fac], center=true);
        }
        // screw hole
        union() {
            translate([0,0,-5]) cylinder(r=screw_diam/2/scale_f, h=10, center=true, $fn=32);
            translate([0,0,-0.001]) cylinder(r1=screw_diam/2/scale_f, r2=0, h=screw_diam/2/scale_f,$fn=32);
        }
    }
}

module bump() {
    cylinder(r1=4.5, r2=2, h=1, $fn=4);
}

module tetris_block() {
    difference() {
        tetris_raw();
        translate([0,0,5.1]) rotate([0,180,45]) bump();                    // oben
        //rotate([180,0,0]) translate([0,0,5.1]) rotate([0,180,45]) bump();  // unten
        rotate([90,0,0]) translate([0,0,5.1]) rotate([0,180,45]) bump();   // vorne
        rotate([270,0,0]) translate([0,0,5.1]) rotate([0,180,45]) bump();  // hinten
        rotate([90,0,90]) translate([0,0,5.1]) rotate([0,180,45]) bump();  // hinten
        rotate([90,0,270]) translate([0,0,5.1]) rotate([0,180,45]) bump(); // hinten
    }
}

module i() {
    union() {
    translate([0,0,0]) tetris_block();
    translate([0,10,0]) tetris_block();
    translate([0,20,0]) tetris_block();
    translate([0,30,0]) tetris_block();
    }
}

module l() {
    union() {
    translate([0,0,0]) tetris_block();
    translate([0,10,0]) tetris_block();
    translate([0,20,0]) tetris_block();
    translate([-10,20,0]) tetris_block();
    }
}

module j() {
    union() {
    translate([0,0,0]) tetris_block();
    translate([0,10,0]) tetris_block();
    translate([0,20,0]) tetris_block();
    translate([10,20,0]) tetris_block();
    }
}

module z() {
    union() {
    translate([0,0,0]) tetris_block();
    translate([0,10,0]) tetris_block();
    translate([10,10,0]) tetris_block();
    translate([10,20,0]) tetris_block();
    }
}

module s() {
    union() {
    translate([10,0,0]) tetris_block();
    translate([10,10,0]) tetris_block();
    translate([0,10,0]) tetris_block();
    translate([0,20,0]) tetris_block();
    }
}

module t() {
    union() {
    translate([0,0,0]) tetris_block();
    translate([10,0,0]) tetris_block();
    translate([20,0,0]) tetris_block();
    translate([10,10,0]) tetris_block();
    }
}

module o() {
    union() {
    translate([0,0,0]) tetris_block();
    translate([10,0,0]) tetris_block();
    translate([0,10,0]) tetris_block();
    translate([10,10,0]) tetris_block();
    }
}

