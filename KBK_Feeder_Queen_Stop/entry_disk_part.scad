$fn=32;
epsilon=0.01;

module entry_disk(r=50, h=2, pin_diam1=4, pin_diam2=7) {
  difference() {
    // disc
    union() {
      cylinder($fn=64, r=r, h=h, center=true);
      rotate_extrude($fn=64, convexity = 10) translate([r, 0, 0]) circle(r = h/2, $fn = 100);
    }
    // pinhole
    translate([0, -epsilon, 0]) cylinder($fn=32, d1=pin_diam1, d2=pin_diam2, center=true, h=h+2*epsilon);
  }
}

module fillet_corner_cutter(fillet=2) {
  intersection() {
    cube(fillet);
    rotate_extrude(convexity = 10) translate([fillet, fillet, 0]) circle(r = fillet);
  }
}

module handle(width=3, height=10, len=16, fillet=2) {
  // base with fillet
  translate([0, 0, -fillet/2]) union() {
    translate([0,0,height/2+fillet]) 
    minkowski() {
      translate([0, 0, -fillet/2]) cube([width-(fillet), len-(fillet), height-(fillet)+fillet], center=true);
      sphere($fn=64, d=fillet);
    }
    difference() {
      translate([0,0,fillet/2]) cube([width+2*fillet, len+2*fillet, fillet], center=true);
      translate([ width/2+fillet, 0, fillet]) rotate([90,0,0]) cylinder(r=fillet, h=2*(len+fillet), center=true);
      translate([-width/2-fillet, 0, fillet]) rotate([90,0,0]) cylinder(r=fillet, h=2*(len+fillet), center=true);
      translate([0,  len/2+fillet, fillet]) rotate([0,90,0]) cylinder(r=fillet, h=2*(len+fillet), center=true);
      translate([0, -len/2-fillet, fillet]) rotate([0,90,0]) cylinder(r=fillet, h=2*(len+fillet), center=true);
      translate([ width/2,  len/2, 0]) rotate([0, 0, 0]) fillet_corner_cutter();
      translate([-width/2,  len/2, 0]) rotate([0, 0, 90]) fillet_corner_cutter();
      translate([-width/2, -len/2, 0]) rotate([0, 0, 180]) fillet_corner_cutter();
      translate([ width/2, -len/2, 0]) rotate([0, 0, 270]) fillet_corner_cutter();
    }
  }
}

module kbk_disk (
  slit_offset = 28,
  d_slit_worker = 7.5,
  d_slit_queen  = 10,
  d_air_holes   = 3,
  l_slit_worker = 30,
  l_slit_queen  = 25,
  handle_angle  = 55
) {
  union() {
    difference() {
      entry_disk();
      // worker bee
      translate([0, slit_offset, -10]) linear_extrude(height = 20) hull() {
        translate([ l_slit_worker/2,0,0]) circle(d=d_slit_worker, $fn=64);
        translate([-l_slit_worker/2,0,0]) circle(d=d_slit_worker, $fn=64);
      }
      // queen bee
      rotate([0, 0, 180]) translate([0, slit_offset, -10]) linear_extrude(height = 20) hull() {
        translate([ l_slit_queen/2,0,0]) circle(d=d_slit_queen, $fn=64);
        translate([-l_slit_queen/2,0,0]) circle(d=d_slit_queen, $fn=64);
      }
      // air holes
      rotate([0, 0, 90]) translate([0, slit_offset, 0]) union() {
        // center
        cylinder(d=d_air_holes, h=20, center=true);
        // inner circle
	ring_one_steps = 7;
        for (angle = [0 : 360/ring_one_steps : 360]) {
          rotate([0, 0, angle]) translate([1.6*d_air_holes, 0 , 0]) cylinder(d=d_air_holes, h=20, center=true);
        }
        // outer circle
	ring_two_steps = 14;
        for (angle = [0 : 360/ring_two_steps : 360]) {
          rotate([0, 0, angle+180/ring_two_steps]) translate([1.8*1.6*d_air_holes, 0 , 0]) cylinder(d=d_air_holes, h=20, center=true);
        }
      }
    }
    //rotate([0, 0, handle_angle]) translate([0, 38, 2-0.1]) handle();
    //rotate([0, 0, 180+handle_angle]) translate([0, 38, 2-0.1]) handle();
  }
}

kbk_disk();
//handle();
//fillet_corner_cutter();
