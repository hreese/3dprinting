include <hotshoe_paper_clip.scad>

rotate([0,0,-90]) hotshoe(logofile="WR.dxf", logooffset=1);

translate([100,0,0]) cylinder(r=0.4, h=0.2);

