// TODO: refactor into modules
x1=67.8;
x2=65.5;
y=47.0;
edge=2.5;
w=1.6;
hollowh=20;
hexh=40;
hexw=8;

module hexpattern(hexdiam=8, spacing=2, height=40, widthx=100, widthy=100) {
    size_x = 3/2*(hexdiam)+spacing*sqrt(3);
    size_y = spacing+sqrt(3)/2*hexdiam;
    num_x = ceil(widthx/size_x);
    num_y = ceil(widthy/size_y);
    translate([-size_x*num_x/2, -size_y*num_y/2,0])
        for (ix=[0:num_x]) {
            translate([ix*size_x,0,0])
            for (iy=[0:num_y]) {
                translate([0,size_y*iy,0])
                    cylinder(r=hexdiam/2, h=height+2, $fn=6);
                translate([size_x/2, (1/2+iy)*size_y,0])
                    cylinder(r=hexdiam/2, h=height+2, $fn=6);
            }
        }
}

module mecablitz_58af2_hull_solid() {
    x1=67.8;
    x2=65.5;
    y=47.0;
    linear_extrude(height = hexh)
        polygon(points = [
            //outer space
            [-x1/2+edge-w,-y/2-w],
            [x1/2-edge+w,-y/2-w],
            [x1/2+w,-y/2+edge-w],
            [x2/2+w,y/2-edge+w],
            [x2/2-edge+w,y/2+w],
            [-x2/2+edge-w,y/2+w],
            [-x2/2-w,y/2-edge+w],
            [-x1/2-w,-y/2+edge-w],
            ], paths = [
            [0,1,2,3,4,5,6,7],
            ]
        );
}

module mecablitz_58af2_hull(h=hollowh+hexh) {
    x1=67.8;
    x2=65.5;
    y=47.0;
    linear_extrude(height = h)
        polygon(points = [
            //outer shape
            [-x1/2+edge-w,-y/2-w],
            [x1/2-edge+w,-y/2-w],
            [x1/2+w,-y/2+edge-w],
            [x2/2+w,y/2-edge+w],
            [x2/2-edge+w,y/2+w],
            [-x2/2+edge-w,y/2+w],
            [-x2/2-w,y/2-edge+w],
            [-x1/2-w,-y/2+edge-w],
            // inner shape
            [-x1/2+edge,-y/2],
            [x1/2-edge,-y/2],
            [x1/2,-y/2+edge],
            [x2/2,y/2-edge],
            [x2/2-edge,y/2],
            [-x2/2+edge,y/2],
            [-x2/2,y/2-edge],
            [-x1/2,-y/2+edge]
            ],
            paths = [
            [0,1,2,3,4,5,6,7],
            [8,9,10,11,12,13,14,15]
            ]
        );
}

//hexpattern();
mecablitz_58af2_hull();
