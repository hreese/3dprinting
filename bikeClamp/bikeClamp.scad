module bikeClamp(basesize=[60,16,10]) {
    translate([0,0,basesize[2]/2]) cube(basesize,center=true);
    intersection(){
        translate([0,0,basesize[2]+50]) cube([basesize[0],basesize[1],100],center=true);
        rotate([90,0,0]) cylinder(r=40, h=basesize[1], center=true, $fn=128);
    }
}

bikeClamp();
