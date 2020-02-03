module endstop_rail(height = toolheight, holediam=esholediam, holes = [], railwidth = esrailwidth, raildepth = esraildepth, ratio = esrailratio) {
    difference() {
        // rail body
        linear_extrude(height = height, center = false)
            polygon(
                points=[
                    [-railwidth/2, -raildepth], [railwidth/2, -raildepth],
                    [railwidth/2*ratio, 0], [-railwidth/2*ratio, 0]
                ],
                paths =[ [0,1,2,3] ]
            );
        // holes
        union(){
            for (y = holes) {
                translate([0, -raildepth/2,y]) rotate([90,0,0]) cylinder(d=holediam, h=raildepth*2, center=true, $fn=32);
            }
        }
    }
}

module endstop_rail_old(height = toolheight, holediam=esholediam, holes = [], railwidth = esrailwidth, raildepth = esraildepth, ratio = esrailratio) {
    difference() {
        // rail body
        linear_extrude(height = height, center = false)
            polygon(
                points=[
                    [-railwidth/2, -raildepth], [railwidth/2, -raildepth],
                    [railwidth/2*ratio, 0], [-railwidth/2*ratio, 0]
                ],
                paths =[ [0,1,2,3] ]
            );
        // holes
        union(){
            for (y = holes) {
                translate([0, -raildepth/2,y]) rotate([90,0,0]) cylinder(d=holediam, h=raildepth*2, center=true, $fn=32);
            }
        }
    }
}