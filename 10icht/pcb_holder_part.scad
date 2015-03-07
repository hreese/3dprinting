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

rotate([0,-90,180]) {
    difference() {
        difference() {
            difference() {
                cube([h_x, h_y, h_z], center=true);
                translate([0, 0, wall]) cube([h_x+2, h_y-2*wall, h_z], center=true);
            }
            translate([wall, 0, 10]) cube([pcb_x+wall, pcb_y, pcb_z], center=true);
        }
        union() {
            translate([-30, -12, 0]) cylinder(h=40, r=2, center=true, $fn=32);
            translate([-30, 12, 0])  cylinder(h=40, r=2, center=true, $fn=32);
            translate([30, -12, 0])  cylinder(h=40, r=2, center=true, $fn=32);
            translate([30, 12, 0])   cylinder(h=40, r=2, center=true, $fn=32);
        }
    }
}
