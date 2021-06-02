depth=14;
height=10+6;

translate([0,-5,0]) difference() {
	translate([0, (10-depth)/2, 0]) union() {
		translate([-60,0,0]) cube([120,depth,height]);
	}
	union() {
	translate([0,0,-0.01]) difference() {
		translate([-80,0,0])      cube([160, 10, 30]);
		translate([-95/2,-10,-1]) cube([95, 30, 10+1]);
	}
	translate([ 95/2-sqrt(10),0,10]) rotate([0,45,0]) cube([10, 10, 10]);
	translate([-95/2+sqrt(10),0,10]) rotate([0,180+45,0]) cube([10, 10, 10]);
	}
	rotate([-5,0,0]) translate([-100, -10-2, 0]) cube([200, 10, 40]);
}

