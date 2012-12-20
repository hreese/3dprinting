barwidth = 7.5;
barthickness = 1;
capheight = 6;

stemwidth = barwidth-2*barthickness;
stemthickness = 1;

//cylinder(r1=10,r2=5, h=20, $fn=4);

union() {
    // ground plate
    translate([-barwidth/2,-barwidth/2,0]) cube([barwidth,barwidth,barthickness]);
    // stem
    difference() {
        translate([-barwidth/2+barthickness,-barwidth/2+barthickness,0]) cube([stemwidth, stemwidth, capheight+barthickness]);
        translate([0,0,barthickness+0.1]) rotate([0,0,45]) cylinder(h=capheight, r1=stemwidth/4, r2=sqrt(2)*(stemwidth-barthickness)/2, $fn=4);
    }
}
