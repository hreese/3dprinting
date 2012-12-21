module drop(r=5, h=10, steps=32, fn=16) {
    tileh = h/steps;
    cosstep = 90/steps;

    union() {
        intersection() {
            sphere(r=r, center=true, $fn=fn);
            translate([0,0,-r]) cube(2*r, center=true);
        }
        for( i=[0:steps-1]) {
            assign(r1=r*cos(i*cosstep), r2=r*cos((i+1)*cosstep)) {
                translate([0,0,tileh*i]) cylinder(r1=r1, r2=r2, h=tileh,$fn=fn);
            }
        }
    }
}
drop();
