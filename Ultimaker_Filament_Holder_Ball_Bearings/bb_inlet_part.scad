$fn = 64;

module bb_test(r1=5, r2=12, h=5) {
    rotate([90,0,0]) difference() {
        cylinder(r=r2, h=h);
        translate([0,0,-1]) cylinder(r=r1, h=h+2);
    }
}

module um_ballbearing_holder( bbr1=6/2, bbr2=10/2, bbw=3 ) {
    x1 = 20;
    y1 = 27;
    z1 = 12;
    wallwidth = 6;
    holdwidth = 4;
    dwbb = 1; // distance wall to ball bearing
    roar = bbr1 + 1; // radius of abstandsring
    hwatb = 6.5; // height wooden arc to baseline
    bboff = 1; // so viel steht das kugellager oben über
    hma = z1+hwatb-bbr2+bboff; // hoehe mittelachse
    rfs = 0.7; // radius fixierschraube
    x2 = x1+2*wallwidth+2*holdwidth;
    z2 = 2*holdwidth;
    rbig = (pow(hwatb,2)+pow(x1/2,2))/(2*hwatb);

    union() {
        difference() {
            // mittelteil
            intersection() {
                union() {
                    translate([-holdwidth,0,0])cube([x1+2*holdwidth,y1,z1]);
                    translate([x1/2,0,-rbig+z1+hwatb])rotate([-90,0,0]) cylinder(h=y1, r=rbig, $fn = 64);
                }
                translate([-holdwidth,0,0])cube([x1+2*holdwidth,y1,z1*2]);
            }
            translate([-wallwidth,-1,-holdwidth]) cube([wallwidth, y1+2,z1]);
            translate([x1,-1,-holdwidth]) cube([wallwidth, y1+2,z1]);

            translate([x1/2,-0.01,hma]) rotate([-90,0,0]) cylinder(r=bbr2+bboff, h=bbw+2*dwbb);

            translate([0,0,z1]) cube([x1, bbw+2*dwbb, rbig]);
        }
        // achse
        difference() {
            translate([x1/2,0.01,hma]) rotate([-90,0,0]) cylinder(r=bbr1, h=bbw+2*dwbb);
            translate([x1/2,-0.01,hma]) rotate([-90,0,0]) cylinder(r=rfs, h=0.7*y1+1);
        }
        translate([x1/2,bbw+dwbb+0.01,hma]) rotate([-90,0,0]) cylinder(r=roar, h=dwbb);
    }
    // TESTING ONLY
    //translate([x1/2, bbw+dwbb, hma]) bb_test(r1=bbr1, r2=bbr2, h=bbw);
}

rotate([-90,0,0]) 
  um_ballbearing_holder(bbr1=6/2, bbr2=10/2, bbw=3);
