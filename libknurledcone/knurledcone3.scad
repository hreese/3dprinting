r=1;
n=8;
alpha=360/n;
f=sin(alpha/2)*r;

module spike(r=r, dentdepth=1) {
    assign(xtip=r-(f*dentdepth)) {
        polyhedron(
            points=[
                [xtip,0,0], // [0] Nullpunkt
                [r,0,0],    // [1] Aussen Mitte
                [r,0,f],    // [2] Aussen Oben
                [r,f,0],    // [3] Aussen Rechts
                [r,-f,0],   // [4] Aussen Links
                [r,0,-f],   // [5] Aussen Unten
            ],
            triangles=[
                [0,3,2], // spitze rechts oben
                [1,2,3], // aussenflaeche rechts oben
                [0,2,4], // spitze links oben
                [1,4,2], // aussenflaeche links oben
                [0,4,5], // spitze links unten
                [1,3,5], // aussenflaeche rechts unten
                [0,5,3], // spitze rechts unten
                [1,5,4], // aussenflaeche links unten
            ]
        );
    }
}

difference() {
    cylinder(r1=1, r2=0.5, h=2, center=false, $fn=128);
    for(angle=[0:n-1]){
        #rotate([0,0,angle*alpha]) spike();
    }
}
