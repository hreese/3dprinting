wallThick = 2;
cutterMinimum = 0.4;
baseHeight = 2;
height = 15;
flangeWidth = 6;

minkowski(){
    outline();
    cylinder(r1 = wallThick/3, r2 = cutterMinimum/3, h = height);
};

flange();

module flange(){
	difference(){
        minkowski(){
            baseShape(baseHeight/3);
            cylinder(r = flangeWidth, h = baseHeight/3);
        }
        translate([0,0,-0.01])baseShape(baseHeight*1.1);
	};
}



module outline(){
	difference(){
        minkowski(){
            baseShape(baseHeight/3);
            cylinder(r = cutterMinimum/3, h = baseHeight/3);
        }
        translate([0,0,-0.01]) baseShape(baseHeight*1.1);
	};
};

module baseShape(H){
    linear_extrude() import (file = "Z10.dxf", layer="cookie", height=H);
}
