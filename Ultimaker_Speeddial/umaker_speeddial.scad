module torus(outerRadius, innerRadius)
{
    r=(outerRadius-innerRadius)/2;
    rotate_extrude() translate([innerRadius+r,0,0]) circle(r);
}

module torus_scaled(r_torus, r_ring, scale_w=[1,1])
{
    rotate_extrude() translate([r_torus,0,0]) scale(scale_w) circle(r_ring);
}

module dial (r=20, h=4, holespacing=1) {
    // radius of fingerhole
    r_hole=(r-(10/2)-2*holespacing)/2;
    // diameter of dial's disc
    diam=2*3.1415692653*r+h/2;
    // …
    numDents=16;
    // distance between dents as a ratio of the dent's width
    spaceFac=0.3;
    // width of dent + space next to it
    t_rad=diam/numDents/(1+spaceFac)/2;
    difference() {
        difference() {
            // main disc
            union() {
                cylinder(r=r, h=h, center=true);
                torus(outerRadius=r+h/2, innerRadius=r-h/2);
            }
            // holes for finger
            for( rot = [0:120:240] ) {
                assign(zhscale=1.75) {
                    rotate([0,0,rot]) translate([(10/2)+holespacing+r_hole,0,0]) scale([1,1,zhscale]) difference() {
                        cylinder(r=r_hole, h=2*h/zhscale, center=true);
                        torus(outerRadius=r_hole+h/2/zhscale, innerRadius=r_hole-h/2/zhscale);
                    }
                }
            }
        }
        for ( rot2 = [1:numDents/2]) {
            //%rotate([90,0,360/numDents/(1+spaceFac)]) torus_scaled(r_torus=r+h/2,r_ring=t_rad, scale_w=[0.25,1]);
            rotate([90,0,rot2*360/numDents]) torus_scaled(r_torus=r+h/2,r_ring=t_rad, scale_w=[0.25,1]);
        }
    }
    // plug (Steck0r)
    translate([0,0,h/2]) union() {
        //translate([0,0,7.1]) torus(7.8/2,5.8/2);
        difference() {
            cylinder(r=7.9/2, h=7.1, center=false);
            difference() {
                cylinder(r=5.9/2, h=15, center=true);
                translate([5+1.45,0,0]) cube([10,10,100], center=true);
            }
        }
        //translate([0,0,-0.5]) cylinder(r1=10/2,r2=7.8/2,h=2.5+0.5);
        difference() {
            cylinder(r=10/2+holespacing,h=(10-7.8)/2+holespacing);
            translate([0,0,(10-7.8)/2+holespacing]) torus_scaled(10/2+holespacing,(10-7.8)/2+holespacing);
        }
    }
}
