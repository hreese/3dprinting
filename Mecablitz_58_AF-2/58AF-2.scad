x1=67.8;
x2=65.5;
y=47.0;
edge=2.5;
w=1.6;
hollowh=20;
hexh=40;
hexw=8;

module hexpattern () {
    difference() {
        // outer bounds
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
        // wech
        translate([-x1/2, -y/2, -1])
        for (ix=[0:5]) {
            translate([ix*( 3/2*(hexw)+w*sqrt(3) ),0,0])
            for (iy=[0:6]) {
                translate([0,(w+sqrt(3)/2*hexw)*iy,0]) cylinder(r=hexw/2, h=hexh+2, $fn=6);
                translate([3/4*(hexw)+w*sqrt(3)/2,(w+sqrt(3)/2*hexw)/2+iy*(w+sqrt(3)/2*hexw),0]) cylinder(r=hexw/2, h=hexh+2, $fn=6);
            }
        }
    }
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
            ], paths = [
            [0,1,2,3,4,5,6,7],
            [8,9,10,11,12,13,14,15]
            ]
        );
}

union() {
    //hexpattern();
    mecablitz_58af2_hull();
}
