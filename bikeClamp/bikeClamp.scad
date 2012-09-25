$fn=360;
screwDiam=3.3;

module holeScrewPlusHex(j=[0,0,0], screwDiam=3.3, hexDiam=6) {
    translate(j) translate([0,0,-100/2]) cylinder(r=hexDiam/2, h=100, center=true, $fn=6);
    translate(j) translate([0,0,100/2]) cylinder(r=screwDiam/2, h=100, center=true);
}

module bikeClamp(basesize=[60,16,10], handlebarDiam=20) {
    difference(){
        union() {
            // baseplate
            translate([0,0,basesize[2]/2]) cube(basesize,center=true);
            // upper plate
            translate([0,0,basesize[2]+2/1]) cube([30,basesize[1],20],center=true);
            // beveled edges
            translate([15,0,sqrt(basesize[2])+basesize[2]/2]) rotate([0,45,0]) cube([basesize[2], basesize[1], basesize[2]], center=true);
            translate([-15,0,sqrt(basesize[2])+basesize[2]/2]) rotate([0,45,0]) cube([basesize[2], basesize[1], basesize[2]], center=true);
            //translate([0,0,basesize[2]]) scale([1,1,0.5]) rotate([90,0,0]) cylinder(r=basesize[0]/2, h=basesize[1]*2, center=true, $fn=128);
        }
        union() {
            //translate([0,0,-handlebarDiam/6])
            // handlebar
            rotate([90,0,0]) cylinder(r=handlebarDiam/2, h=basesize[1]*2, center=true);
            // screw holes to other plate
            translate([basesize[0]/2-1.5*screwDiam,0,0]) cylinder(r=screwDiam/2, h=basesize[2]*20, center=true);
            translate([-basesize[0]/2+1.5*screwDiam,0,0]) cylinder(r=screwDiam/2, h=basesize[2]*20, center=true);
            // screwhole(s) for upper »payload«
            //translate([-10,0,basesize[2]+20/2]) holeScrewPlusHex();
            //translate([10,0,basesize[2]+20/2]) holeScrewPlusHex();
            translate([0,0,basesize[2]+20/2]) holeScrewPlusHex();
        }
    }
}

bikeClamp();

/*** Outtakes ***/

// runde ecke
/*
            translate() intersection() {
                difference() {
                    cube([8,100,8], center=true);
                    union(){
                        translate([4,0,4]) rotate([90,0,0]) cylinder(r=8.1,h=101, center=true);
                    }
                }
                cube(basesize,center=true);
            }
*/

// blubb...
/*
module rasterWheel(r=20, h=20, numTeeth=32) {
    // 2pi = 6.2831853071795864769252867665590057683943387987502116
    c=r*6.283185307179;
    wt=c/numTeeth;
    we=wt/sqrt(2);
    for( a =[0:360/numTeeth:360] )
    rotate([0,45,0]) cube([we,h,ew], center=true);
}
//rasterWheel();
*/
