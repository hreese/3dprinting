include <threads.scad>;

// create screw hole in cylinder
module testScrewHole(diam=3, pitch=0.5, turns=10) {
    intersection(){
        difference() {
            cylinder(r=(diam+6)/2, h=turns*pitch, $fn=8);
            translate([0,0,-pitch]) metric_thread_tap(diam,pitch,(turns+2)*pitch,internal=true);
        }
        //#sphere([0,0,turns*pitch/2], r=(diam+6)/2);
        translate([0,0,turns*pitch/2]) sphere(r=(diam+6)/2+0.2, $fn=200);
    }
}

module testScrew(diam=3, pitch=0.5, turns=10) {
    union() {
        cylinder(r=(diam*1.6)/2, h=4, $fn=6);
        translate([0,0,4]) metric_thread_tap(diam,pitch,(turns+2)*pitch,internal=false);
    }
}

//testScrewHole(3,0.5); // M3
//testScrewHole(4,0.7); // M4
//testScrewHole(5,0.8); // M5
//testScrewHole(6,1.0); // M6
//testScrewHole(8,1.25); // M8
testScrewHole(10,1.5, 4); // M10

//testScrew(3,0.5); // M3
//testScrew(4,0.7); // M4
//testScrew(5,0.8); // M5
//testScrew(6,1.0); // M6
//testScrew(8,1.25); // M8
//testScrew(10,1.5,4); // M10
