// plate
plate_height=30;
plate_width_top=100;
plate_width_bottom=75;
plate_width=1;
plate_radius_top=2;
plate_radius_bottom=6;

slit_height=7.5;

pin_radius=0.6;

module feeder_plate(
	plate_height=plate_height,
	plate_width_top=plate_width_top,
	plate_width_bottom=plate_width_bottom,
	plate_width=plate_width,
	plate_radius_top=plate_radius_top,
	plate_radius_bottom=plate_radius_bottom,
	slit_height=slit_height,
	pin_radius=pin_radius
) {
  difference() {
    // plate
    hull() {
      translate([-plate_width_top/2, plate_height/2+plate_radius_top/2, 0]) cylinder($fn=32, h=plate_width, r=plate_radius_bottom, center=true);
      translate([ plate_width_top/2, plate_height/2+plate_radius_top/2, 0]) cylinder($fn=32, h=plate_width, r=plate_radius_bottom, center=true);
      translate([-plate_width_bottom/2, -plate_height/2+plate_radius_bottom/2, 0]) cylinder($fn=32, h=plate_width, r=plate_radius_bottom, center=true);
      translate([ plate_width_bottom/2, -plate_height/2+plate_radius_bottom/2, 0]) cylinder($fn=32, h=plate_width, r=plate_radius_bottom, center=true);
    }
      // pin holes
      translate([-plate_width_top/2, plate_height/2+plate_radius_top/2, -0.1]) cylinder($fn=32, h=plate_width*2, r=pin_radius, center=true);
      translate([ plate_width_top/2, plate_height/2+plate_radius_top/2, -0.1]) cylinder($fn=32, h=plate_width*2, r=pin_radius, center=true);
      translate([-plate_width_bottom/2, -plate_height/2+plate_radius_bottom/2, -0.1]) cylinder($fn=32, h=plate_width*2, r=pin_radius, center=true);
      translate([ plate_width_bottom/2, -plate_height/2+plate_radius_bottom/2, -0.1]) cylinder($fn=32, h=plate_width*2, r=pin_radius, center=true);
  }
}

s1_off_x=36;
s1_off_y=14;
s2_off_x=32;
s2_off_y=s1_off_y-1*(slit_height+4);
s3_off_x=27;
s3_off_y=s1_off_y-2*(slit_height+4);

difference() {
  feeder_plate();
  // slits
  hull() {
    translate([-s1_off_x, s1_off_y, -plate_width/2]) cylinder($fn=64, r=slit_height/2, h=plate_width*4, center=true);
    translate([ s1_off_x, s1_off_y, -plate_width/2]) cylinder($fn=64, r=slit_height/2, h=plate_width*4, center=true);
  }
  hull() {
    translate([-s2_off_x, s2_off_y, -plate_width/2]) cylinder($fn=64, r=slit_height/2, h=plate_width*4, center=true);
    translate([ s2_off_x, s2_off_y, -plate_width/2]) cylinder($fn=64, r=slit_height/2, h=plate_width*4, center=true);
  }
  hull() {
    translate([-s3_off_x, s3_off_y, -plate_width/2]) cylinder($fn=64, r=slit_height/2, h=plate_width*4, center=true);
    translate([ s3_off_x, s3_off_y, -plate_width/2]) cylinder($fn=64, r=slit_height/2, h=plate_width*4, center=true);
  }
}
