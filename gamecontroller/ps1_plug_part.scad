union() {
    // baseplate
    linear_extrude(height = 2, center = false, convexity = 10)import(file = "ps1_controller.dxf", layer = "shell_outside");
    // outer shell
    difference(){
        linear_extrude(height = 10, center = false, convexity = 10)import(file = "ps1_controller.dxf", layer = "shell_outside");
        translate([0,0,-1]) linear_extrude(height = 12, center = false, convexity = 10)import(file = "ps1_controller.dxf", layer = "shell_inside");
    }
    // inner part for plugs
    difference(){
        linear_extrude(height = 8, center = false, convexity = 10) import(file = "ps1_controller.dxf", layer = "plug_outside");
        translate([0,0,-1]) linear_extrude(height = 10, center = false, convexity = 10)import(file = "ps1_controller.dxf", layer = "plug_inside");
    }
}

