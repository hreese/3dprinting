// 41,2 68,15
// 20mm luft nach unten
// 1.6mm dick

pcb_x = 68.15;
pcb_y = 41.2;
pcb_z = 1.6;

h_x = 75;
h_y = 47;
h_z = 30;

wall = 4;

rotate([90,0,0]) difference() {
    cube([20, 10, 30]);
    union() {
        translate([7, -1, 7]) cube([20, 12, 30]);
        translate([-0.01, -1, 30-4]) cube([1+2,12,pcb_z]);
        translate([15,10/2,-1]) cylinder(10, r=2, $fn=32);
    }
}
