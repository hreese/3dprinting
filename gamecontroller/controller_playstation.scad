union() {
    // outer shell
    difference(){
        linear_extrude(file = "trace_ps1_controller.dxf", layer = "shell_outside", height = 10, center = false, convexity = 10);
        linear_extrude(file = "trace_ps1_controller.dxf", layer = "shell_inside", height = 12, center = false, convexity = 10);
    }
    // inner part for plugs
    difference(){
        linear_extrude(file = "trace_ps1_controller.dxf", layer = "plug_outside", height = 8, center = false, convexity = 10);
        linear_extrude(file = "trace_ps1_controller.dxf", layer = "plug_inside", height = 10, center = false, convexity = 10);
    }
    translate([-3,-3,0]) cube([51,19,3]);
}
