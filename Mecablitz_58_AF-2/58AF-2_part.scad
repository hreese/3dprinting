/* this defines the flash's outline
*/
mb_width1 = 67.8;
mb_width2 = 65.5;
mb_height = 47.0;
mb_edge   = 2.5;

// unused as of now
height_colorfilter = 52;

/* hexdiam: space between two facing corners of a hextile
 * spacing: space between every side of the adjacent hextiles
 * heigt:   height (z-axis) of tiles
 * widthxy: space (x- andy-axis) occupied by the hextiles 
 *
 * Centering is only approximate :-)
*/
module hexpattern(hexdiam=8, spacing=2, h=40, widthx=100, widthy=100) {
    size_x = 3/2*(hexdiam)+spacing*sqrt(3);
    size_y = spacing+sqrt(3)/2*hexdiam;
    num_x = ceil(widthx/size_x);
    num_y = ceil(widthy/size_y);
    translate([-size_x*num_x/2, -size_y*num_y/2,0])
        for (ix=[0:num_x]) {
            translate([ix*size_x,0,0])
            for (iy=[0:num_y]) {
                translate([0,size_y*iy,0])
                    cylinder(r=hexdiam/2, h=h+2, $fn=6);
                translate([size_x/2, (1/2+iy)*size_y,0])
                    cylinder(r=hexdiam/2, h=h+2, $fn=6);
            }
        }
}

module mecablitz_58af2_snoot_solid(h=20, w=0) {
    linear_extrude(height = h)
        polygon(points = [
            //outer space
            [-mb_width1/2+mb_edge-w,-mb_height/2-w],
            [mb_width1/2-mb_edge+w,-mb_height/2-w],
            [mb_width1/2+w,-mb_height/2+mb_edge-w],
            [mb_width2/2+w,mb_height/2-mb_edge+w],
            [mb_width2/2-mb_edge+w,mb_height/2+w],
            [-mb_width2/2+mb_edge-w,mb_height/2+w],
            [-mb_width2/2-w,mb_height/2-mb_edge+w],
            [-mb_width1/2-w,-mb_height/2+mb_edge-w],
            ], paths = [
            [0,1,2,3,4,5,6,7,0],
            ]
        );
}

module mecablitz_58af2_snoot_hollow(h=20, w=2) {
    linear_extrude(height = h)
        polygon(points = [
            //outer shape
            [-mb_width1/2+mb_edge-w,-mb_height/2-w],
            [mb_width1/2-mb_edge+w,-mb_height/2-w],
            [mb_width1/2+w,-mb_height/2+mb_edge-w],
            [mb_width2/2+w,mb_height/2-mb_edge+w],
            [mb_width2/2-mb_edge+w,mb_height/2+w],
            [-mb_width2/2+mb_edge-w,mb_height/2+w],
            [-mb_width2/2-w,mb_height/2-mb_edge+w],
            [-mb_width1/2-w,-mb_height/2+mb_edge-w],
            // inner shape
            [-mb_width1/2+mb_edge,-mb_height/2],
            [mb_width1/2-mb_edge,-mb_height/2],
            [mb_width1/2,-mb_height/2+mb_edge],
            [mb_width2/2,mb_height/2-mb_edge],
            [mb_width2/2-mb_edge,mb_height/2],
            [-mb_width2/2+mb_edge,mb_height/2],
            [-mb_width2/2,mb_height/2-mb_edge],
            [-mb_width1/2,-mb_height/2+mb_edge]
            ],
            paths = [
            [0,1,2,3,4,5,6,7],
            [8,9,10,11,12,13,14,15]
            ]
        );
}

//translate([0,65,0])
union() {
    difference() {
        mecablitz_58af2_snoot_solid(h=40, w=1);
        translate([0,0,-1]) hexpattern(hexdiam=8, h=60+2, spacing=1.2, widthx=65, widthy=50);
    }
    mecablitz_58af2_snoot_hollow(h=60,w=2.8);
}

/*
difference() {
    mecablitz_58af2_snoot_solid(h=80, w=3);
    translate([0,0,-1]) mecablitz_58af2_snoot_solid(h=82, w=-2);
    translate([0,0,60-1]) mecablitz_58af2_snoot_solid(h=22, w=0);
}
*/
