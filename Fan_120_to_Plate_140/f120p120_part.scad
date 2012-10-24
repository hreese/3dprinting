$fn=64;

h=2.5;
width=5;
b=127;

difference() {
    union() {
        cylinder(r=122/2+width, h=h, center=true);
        for(r=[45:90:135]) {
            rotate([0,0,r]) cube([sqrt(2)*b,10,h], center=true);
            rotate([0,0,r]) translate([sqrt(2)*b/2,0,0]) cylinder(r=width, h=h, center=true);
            rotate([0,0,r]) translate([-sqrt(2)*b/2,0,0]) cylinder(r=width, h=h, center=true);
        }
    }
    cylinder(r=122/2, h=10, center=true);
        for(rot=[0:4]) {
            rotate([0,0,90*rot]) translate([105/2, 105/2, 0]) cylinder(r=4.3/2, h=10, center=true);
        }
        for(rot=[0:4]) {
            rotate([0,0,90*rot]) translate([124.5/2, 124.5/2, 0]) cylinder(r=4.3/2, h=10, center=true);
        }
}

//rotate([0,0,45])
//%cube([120,120,10], center=true);
