height_handle = 3;
height_cutter = 25;

rotate([0,180,0]) {
    linear_extrude(height=height_cutter) import(file="Z10.dxf", layer="cutter");
    translate([0,0,height_cutter-0.1]) {
        linear_extrude(height = height_handle) import(file="Z10.dxf", layer="handle");
    }
}
