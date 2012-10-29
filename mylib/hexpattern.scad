/* hexdiam: space between two facing corners of a hextile
 * spacing: space between every side of the adjacent hextiles
 * heigt:   height (z-axis) of tiles
 * widthxy: space (x- andy-axis) occupied by the hextiles 
 *
 * Centering is only approximate :-)
*/
module hexpattern(hexdiam=8, spacing=2, h=40, widthx=100, widthy=100) {
    size_x = 3/2*(hexdiam)+spacing*sqrt(3);
    size_y = spacing+sqrt(3)/2*hexdiam;
    num_x = ceil(widthx/size_x);
    num_y = ceil(widthy/size_y);
    translate([-size_x*num_x/2, -size_y*num_y/2,0])
        for (ix=[0:num_x]) {
            translate([ix*size_x,0,0])
            for (iy=[0:num_y]) {
                translate([0,size_y*iy,0])
                    cylinder(r=hexdiam/2, h=h+2, $fn=6);
                translate([size_x/2, (1/2+iy)*size_y,0])
                    cylinder(r=hexdiam/2, h=h+2, $fn=6);
            }
        }
}


