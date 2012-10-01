$fn=360;
screwDiam=3.3;
screwHeadDiam=8;

module holeScrewPlusHex(j=[0,0,0], screwDiam=3.3, hexDiam=6) {
    union() {
        translate(j) translate([0,0,-100/2]) cylinder(r=hexDiam/2, h=100, center=true, $fn=6);
        translate(j) translate([0,0,100/2]) cylinder(r=screwDiam/2, h=101, center=true);
    }
}

module upperBikeClamp(basesize=[60,16,20], handlebarDiam=11.6*2, bevelRadius=10) {
    bx=basesize[0];
    by=basesize[1];
    bz=basesize[2];
    handlebarZOff=-0.1*handlebarDiam;
    upperHexNutHeight=5;
    difference(){
        // baseplate
        difference(){
            translate([0,0,bz/2]) cube(basesize,center=true);
            // bevel
            translate([bx/2-10,0,bz]) rotate([90,0,0]) cylinder(r=bevelRadius,h=by*2,center=true);
            translate([-bx/2+10,0,bz]) rotate([90,0,0]) cylinder(r=bevelRadius,h=by*2,center=true);
            translate([50+bx/2-10,0,50+bz-bevelRadius]) cube(100,center=true);
            translate([-50-bx/2+10,0,50+bz-bevelRadius]) cube(100,center=true);
        }
        union() {
            //translate([0,0,-handlebarDiam/6])
            // handlebar
            translate([0,0,handlebarZOff]) rotate([90,0,0]) cylinder(r=handlebarDiam/2, h=by*2, center=true);
            // screw holes to other plate
            translate([bx/2-1.5*screwDiam,0,0]) cylinder(r=screwDiam/2, h=bz*20, center=true);
            translate([-bx/2+1.5*screwDiam,0,0]) cylinder(r=screwDiam/2, h=bz*20, center=true);
            //translate([bx/2-1.5*screwDiam,0,20]) cylinder(r=screwHeadDiam/2, h=bz*20, center=false);
            // screwhole(s) for upper »payload«
            translate([0,0,handlebarDiam/2+handlebarZOff+upperHexNutHeight]) holeScrewPlusHex();
        }
    }
}

module lowerBikeClamp(basesize=[60,16,20], handlebarDiam=11.6*2, scaleF=1.4) {
    bx=basesize[0];
    by=basesize[1];
    bz=basesize[2];
    handlebarZOff=-0.1*handlebarDiam;
    difference() {
        difference() {
            difference() {
                // baseplate
                translate([0,0,bz/2]) cube(basesize,center=true);
                // handlebar
                translate([0,0,handlebarZOff]) rotate([90,0,0]) cylinder(r=handlebarDiam/2, h=by*2, center=true);
            }
            translate([0,0,8]) scale([scaleF,scaleF,1]) difference() {
                // baseplate
                translate([0,0,bz/2]) cube(basesize,center=true);
                // handlebar
                translate([0,0,handlebarZOff]) rotate([90,0,0]) cylinder(r=handlebarDiam/2, h=by*2, center=true);
            }
        }
        union() {
            // screw holes to other plate
            //translate([bx/2-1.5*screwDiam,0,0]) cylinder(r=screwDiam/2, h=bz*20, center=true);
            //translate([-bx/2+1.5*screwDiam,0,0]) cylinder(r=screwDiam/2, h=bz*20, center=true);
            translate([bx/2-1.5*screwDiam,0,6]) rotate([180,0,0]) holeScrewPlusHex();
            translate([-bx/2+1.5*screwDiam,0,6]) rotate([180,0,0]) holeScrewPlusHex();
        }
    }
}

/*** Outtakes ***/

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
