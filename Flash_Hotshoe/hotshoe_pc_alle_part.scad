include <hotshoe_paper_clip.scad>

offset=23;

translate([0*offset,0,0]) hotshoe(logofile="HR.dxf", logooffset=1);
translate([1*offset,0,0]) hotshoe(logofile="IR.dxf", logooffset=3.5);
translate([2*offset,0,0]) hotshoe(logofile="WR.dxf", logooffset=1);
translate([3*offset,0,0]) hotshoe(logofile="EE.dxf", logooffset=2,len=25);
