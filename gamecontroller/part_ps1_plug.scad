union() {
    // outer shell
    difference(){
        linear_extrude(height = 10, center = false, convexity = 10)import(file = "trace_ps1_controller_.dxf", layer = "shell_outside");
        linear_extrude(height = 12, center = false, convexity = 10)import(file = "trace_ps1_controller_.dxf", layer = "shell_inside");
    }
    // inner part for plugs
    difference(){
        linear_extrude(height = 8, center = false, convexity = 10) import(file = "trace_ps1_controller_.dxf", layer = "plug_outside");
        linear_extrude(height = 10, center = false, convexity = 10)import(file = "trace_ps1_controller_.dxf", layer = "plug_inside");
    }
    translate([-3,-3,0]) cube([51,19,3]);
}
