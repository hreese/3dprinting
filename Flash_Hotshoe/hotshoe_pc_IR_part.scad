include <hotshoe_paper_clip.scad>

rotate([0,0,-90]) hotshoe(logofile="IR.dxf", logooffset=3.5);

translate([100,0,0]) cylinder(r=0.4, h=0.2);
