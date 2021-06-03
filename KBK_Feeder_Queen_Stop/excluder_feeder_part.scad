$fn = 32;

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
    translate([-slotx/2, 0, frontz-0.01]) cube([slotx, sloty, slotz]); // slot filler
    translate([-frontx/2, 0, 0]) cube([frontx, fronty, frontz]);  // front plate
  }
  translate([0, sloty-slity/2+0.01, -0.01]) hull() { // slit 1
    translate([+slitx/2,0,0]) cylinder(d=slity, h=2*slotz);
    translate([-slitx/2,0,0]) cylinder(d=slity, h=2*slotz);
  }
  translate([0, (sloty-slity)/2, -0.01]) hull() {    // slit 2
    translate([+slitx/2,0,0]) cylinder(d=slity, h=2*slotz);
    translate([-slitx/2,0,0]) cylinder(d=slity, h=2*slotz);
  }
  for (i=[-1,+1]) { // pinhole
    translate([i*frontx/2-i*pindist, pindist, -0.01]) cylinder(d=pindiam, h=2*slotz);
  }
}

