module testObjekt() {
    union() {
        cube([3,10,2]);
        cube([6,2,1]);
        translate([1.5, 10,0]) cylinder(r=1.5, h=4, $fn=32);
    }
}

color("Lime", 0.3) testObjekt();
//scale([2,3,0.3]) testObjekt();
//translate([3,2,-4]) testObjekt();
//rotate([90,10,-35]) testObjekt();
//mirror([1,0,0]) testObjekt();
// testObjekt();
// testObjekt();
