$fn=150;

difference() {
    cylinder(h=77.5,r=29/2);
    union(){
        translate([0,0,-1]) cylinder(h=100,r=8/2);
        translate([0,0,25]) cylinder(h=100,r=27/2);
        translate([0,0,5]) cylinder(h=20,r1=8/2,r2=27/2);
    }
}
