x1=67.8;
x2=65.5;
//y=46.2;
y=47.0;
edge=2.5;
w=0.4;
//rotate([0,0,45])
linear_extrude(height = 2)
    polygon(points = [
        [-x1/2+edge-w,-y/2-w],
        [x1/2-edge+w,-y/2-w],
        [x1/2+w,-y/2+edge-w],
        [x2/2+w,y/2-edge+w],
        [x2/2-edge+w,y/2+w],
        [-x2/2+edge-w,y/2+w],
        [-x2/2-w,y/2-edge+w],
        [-x1/2-w,-y/2+edge-w],
        //
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
        ]);
