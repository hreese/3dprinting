$fn=50;

// iPod nano 4th gen, measured lying on its back
ipod_n4_depth=70;        // top to bottom when looking at the display
ipod_n4_width=53;        // left ro right when looking at the display
ipod_n4_edge_radius=5.3; // radius of circle describing the edge's radius

// tiefe komplett: 6.6
// höhe: 70

module iPodShape(x=58, y=100, r1=4.8,r2=2.8) {
    hull() {
        for( xoff = [-x/2+r1,x/2-r1]) {
            for( yoff = [-y/2+r1,y/2-r1]) {
                translate([xoff,yoff,0]) union() {
                    difference() {
                        sphere(r=r1, center=true);
                        translate([0,0,r1]) cube(2*r1,center=true);
                    }
                    scale([1,1,r2/r1]) sphere(r=r1, center=true);
                }
            }
        }
    }
}

// this will be attached to the bike's handles
module iPod_Stand_Groundplate(width, lenght, height) {
	x=width;
    y=length;
    z=height;
    union() {
        cube([x,y,z], center=true);
    }
}

//iPod_nano_g4_stampout(ipod_n4_width, ipod_n4_depth, 2, ipod_n4_edge_radius);
//iPod_Stand_Groundplate(ipod_n4_width+0.5, ipod_n4_depth+0.5, 0.2);
