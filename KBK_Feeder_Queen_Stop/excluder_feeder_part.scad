$fn = 32;
epsilon=0.01;

slotx = 94;
sloty = 11;
slotz = 9;

frontx = 120;
fronty = 20;
frontz = 1.2;

slitx = 80;
slity = 4.3;

pindiam = 1;
pindist = 8;

difference() {
  union() {
    translate([-slotx/2, 0, frontz-epsilon]) cube([slotx, sloty, slotz]); // slot filler
    translate([-frontx/2, 0, 0]) cube([frontx, fronty, frontz]);  // front plate
  }
  translate([0, sloty-slity/2+epsilon, -epsilon]) hull() { // slit 1
    translate([+slitx/2,0,0]) cylinder(d=slity, h=2*slotz);
    translate([-slitx/2,0,0]) cylinder(d=slity, h=2*slotz);
  }
  translate([0, (sloty-slity)/2, -epsilon]) hull() {    // slit 2
    translate([+slitx/2,0,0]) cylinder(d=slity, h=2*slotz);
    translate([-slitx/2,0,0]) cylinder(d=slity, h=2*slotz);
  }
  for (i=[-1,+1]) { // pinhole
    pinydist = max(pindist, fronty/2);
    translate([i*frontx/2-i*pindist, pinydist, -epsilon]) cylinder(d=pindiam, h=2*slotz);
  }
  translate([-(slitx+slity)/2, sloty-slity/2, -epsilon]) cube([slitx+slity, fronty, 2*slotz]); // gap
}

//module roundedcube(r=4, x=10, y=10, z=2) {
//  translate([-x/2,0,0]) hull() {
//    translate([r,   r,   0]) cylinder(r=r, h=z);
//    translate([r,   y-r, 0]) cylinder(r=r, h=z);
//    translate([x-r, r,   0]) cylinder(r=r, h=z);
//    translate([x-r, y-r, 0]) cylinder(r=r, h=z);
//  }
//}
