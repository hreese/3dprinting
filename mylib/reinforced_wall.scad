module reinforced_wall(h=6, wbot=3.2, wtop=1.8) {
    rotate([90,0,90]) linear_extrude(height = 1) {
        polygon( points = [
            [0, 0], [wbot, 0], [wtop, h], [0, h]
            ], paths = [
            [0,1,2,3]]);
    }
}

module reinforced_edge(h=6, wbot=3.2, wtop=1.8, rad=6) {
    intersection() {
        translate([rad,rad,0]) rotate_extrude() {
            polygon( points = [
                [rad-wbot,0], [rad,0], [rad,h], [rad-wtop,h]
                ], paths = [
                [0,1,2,3]]);
        }
        cube([rad,rad,h]);
    }
}

