cube([10,10,1.5],center=true);

difference() {
	rotate([0,0,45]) difference() {
		union() {
			cylinder(r1=8/2*1.41421,r2=8.5/2*1.41421,h=8,$fn=4);
		}
		cylinder(r1=1,r2=7/2*1.41421,h=8.5,$fn=4);
	}
	union() {
		rotate([0,0, 0+45]) cube([20,1.4,30], center=true);
		rotate([0,0,90+45]) cube([20,1.4,30], center=true);
	}
}