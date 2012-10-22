x1=67.8;
x2=65.5;
//y=46.2;
y=47.0;
edge=2.5;
w=0.4;
hexw=8;
hexh=40;
hexshiftx = hexh+w;
hexshifty = hexh+w;
hexoffx   = hexw+w;
hexoffy   = (hexw+w)/2;

for (ix=[0:3]) {
    translate([ix*( 3/2*(hexw)+w*sqrt(3) ),0,0]) for (iy=[0:3]) {
        translate([0,(w+sqrt(3)/2*hexw)*iy,0]) cylinder(r=hexw/2, h=hexh, $fn=6);
        translate([3/4*(hexw)+w*sqrt(3)/2,(w+sqrt(3)/2*hexw)/2+iy*(w+sqrt(3)/2*hexw),0]) cylinder(r=hexw/2, h=hexh, $fn=6);
    }
}
//for (iy=[0:1]) {
//    translate([0,(hexw+w)*iy,0]) cylinder(r=hexw/2, h=hexh, $fn=6);
//    %translate([hexw+(1+sin(60))*w-sin(30)*hexw/2,(hexw+w)/2+(hexw+w)*iy,0]) cylinder(r=hexw/2, h=hexh, $fn=6);
//}

module aufsatz() {
linear_extrude(height = 20)
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
        // inner space
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

