$fn=256;

module MyScrew(screwheight=33, screwdiam=3, headdiam=5.5, headheight=3) {
    union() {
        cylinder(h=headheight, r=headdiam/2);
        cylinder(h=screwheight, r=screwdiam/2);
    };
}

module MyScrewHole(screwheight=33, screwdiam=3, headdiam=5.5, headheight=3, nutstart=10, nutdiam=8, slack=1) {
    cutlen=1000;
    union() {
        translate([0, 0, headheight-cutlen]) cylinder(h=cutlen, r=(headdiam+slack)/2);
        cylinder(h=cutlen, r=(screwdiam+slack)/2);
        translate([0, 0, nutstart]) cylinder($fn=6, h=cutlen, r=(nutdiam+slack)/2); // rotate([0,0,360/12])
    };
}

/*
translate([0,0,5]) union() {
    translate([0,33/2,0]) rotate([90,0,0]) translate([-5,0,0]) MyScrewHole(screwheight=33, screwdiam=3, headdiam=5.5, headheight=3, nutstart=29);
    translate([0,44/2,0]) rotate([90,0,0]) translate([5,0,0])  MyScrewHole(screwheight=44, screwdiam=4, headdiam=7, headheight=4, nutstart=36);
};
*/

ramplen=60;
rampwidth=25;
translate([0, 0, rampwidth/2]) rotate([0, 90, 0]) difference() {
    // ramp
    intersection() {
    scale([1, 1, 0.5]) rotate([0, 90, 0]) cylinder(h=rampwidth, r=ramplen/2, center=true);
    translate([0,0,10]) cube([rampwidth+0.1,ramplen, 20], center=true);
    };

    // Schiene
    translate([-100,-10,-0.01]) difference() {
        cube([200,20,12]);
        translate([-5,2,2]) cube([210,16,11]);
    };
    // Schraube
    translate([0,0,6]) translate([0,44/2,0]) rotate([90,0,0]) MyScrewHole(screwheight=44, screwdiam=4, headdiam=7, headheight=4, nutstart=36, nutdiam=7.8);
    //#translate([0,0,6]) translate([0,44/2,0]) rotate([90,0,0]) MyScrew(screwheight=44, screwdiam=4, headdiam=7, headheight=4);
};
