module endstop_rail_screwslit(height = toolheight, railwidth = esrailwidth, raildepth = esraildepth, ratio = esrailratio, screwwidth=6, screwheight=3.5, screwdiam=3.3) {
    union(){
        translate([-0.5*screwwidth,-screwheight+0.001,5]) cube([screwwidth, screwheight, height*1.2]);
        translate([-0.5*screwdiam,-raildepth-1,5]) cube([screwdiam, raildepth+1, height*1.2]);
    }
}


module endstop_rail(height = toolheight, railwidth = esrailwidth, raildepth = esraildepth, ratio = esrailratio) {
    // rail body
    linear_extrude(height = height, center = false)
        polygon(
            points=[
                [-railwidth/2, -raildepth], [railwidth/2, -raildepth],
                [railwidth/2*ratio, 0], [-railwidth/2*ratio, 0]
            ],
            paths =[ [0,1,2,3] ]
        );
}