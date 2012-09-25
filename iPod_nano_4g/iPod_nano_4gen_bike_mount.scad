$fn=50;

module cube_round_edge_origin(x, y, z) {
	union() {
		cube([x,y,z], center=false);
		translate ([0,0,z/2]) sphere(r=z/2);
		translate ([x,0,z/2]) sphere(r=z/2);
		translate ([0,y,z/2]) sphere(r=z/2);
		translate ([x,y,z/2]) sphere(r=z/2);
		translate ([0,0,z/2]) rotate (a=[-90,0,0]) cylinder(h=y, r=z/2);
		translate ([x,0,z/2]) rotate (a=[-90,0,0]) cylinder(h=y, r=z/2);
		translate ([0,0,z/2]) rotate (a=[0,90,0]) cylinder(h=x, r=z/2);
		translate ([0,y,z/2]) rotate (a=[0,90,0]) cylinder(h=x, r=z/2);
	}
}

// iPod nano 4th gen, measured lying on its back
ipod_n4_depth=70;        // top to bottom when looking at the display
ipod_n4_width=53;        // left ro right when looking at the display
ipod_n4_edge_radius=5.3; // radius of circle describing the edge's radius

// use this to create space for the iPod
module iPod_nano_g4_stampout(width=ipod_n4_width, lenght=ipod_n4_depth, height, radius) {
	x=width-radius;
    y=lenght-radius;
    h=height;
    union() {
        // body
        cube([x,y,radius*2], center=true);
        // corners
        translate ([-x/2,-y/2,0]) sphere(r=radius);
        translate ([-x/2,y/2,0]) sphere(r=radius);
        translate ([x/2,-y/2,0]) sphere(r=radius);
        translate ([x/2,y/2,0]) sphere(r=radius);
        // edges
        rotate (a=[-90,0,0]) translate ([-x/2,0,0]) cylinder(h=y, r=radius, center=true);
        rotate (a=[-90,0,0]) translate ([x/2,0,0]) cylinder(h=y, r=radius, center=true);
        translate ([0,y/2,0]) rotate (a=[0,-90,0]) cylinder(h=x, r=radius, center=true);
        translate ([0,-y/2,0]) rotate (a=[0,-90,0]) cylinder(h=x, r=radius, center=true);
        // z-wards extension
        translate([0,0,h/2]) cube([x+radius*2,y,h], center=true);
        translate([0,0,h/2]) cube([x,y+radius*2,h], center=true);
        translate ([-x/2,-y/2,h/2]) rotate (a=[0,00,0]) cylinder(h=h, r=radius, center=true);
        translate ([-x/2,y/2,h/2]) rotate (a=[0,00,0]) cylinder(h=h, r=radius, center=true);
        translate ([x/2,-y/2,h/2]) rotate (a=[0,00,0]) cylinder(h=h, r=radius, center=true);
        translate ([x/2,y/2,h/2]) rotate (a=[0,00,0]) cylinder(h=h, r=radius, center=true);
    }
}

// this will be attached to the bike's handles
module iPod_Stand_Groundplate(width, lenght, height) {
	x=width;
    y=length;
    z=height;
    union() {
        cube([x,y,z], center=true);
    }
}

iPod_nano_g4_stampout(ipod_n4_width, ipod_n4_depth, 2, ipod_n4_edge_radius);
//iPod_Stand_Groundplate(ipod_n4_width+0.5, ipod_n4_depth+0.5, 0.2);
