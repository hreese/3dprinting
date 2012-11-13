/*
 * knurledFinishExamples.scad
 * 
 * Written by aubenc @ Thingiverse
 *
 * This script is licensed under the Public Domain license.
 *
 * In order to this script to work as intended the following OpenSCAD libraries
 * and modules are required:
 * 
 *     knurledFinishLib.scad           http://www.thingiverse.com/thing:9095
 * and  
 *     polyScrewThread.scad            http://www.thingiverse.com/thing:8796
 *
 * both by aubenc @ thingiverse and licensed under the Public Domain license
 *
 * and also:
 *
 *     Makerbot OpenSCAD Font Module   http://www.thingiverse.com/thing:6844
 *
 * by grokbeer @ Thingiverse and licensed under the Attibution - Non-Commercial -
 * Share Alike license
 *
 */
include <knurledFinishLib.scad>
include <polyScrewThread.scad>
use <OpenScadFont.scad>

PI=3.141592;

/* ************************** Examples ****************************************** */

/* Example 01.
 *
 * A simple small knurled cylinder with a Makerbot "M" engraved in the top face
 */

// makerbot_M_knurled_coin();



/* Example 02.
 *
 * Example 01 extended to create a large and short bolt.
 */

// Makerbolt();



/* Example 03.
 *
 * Just a knurled nut.
 * (Because we needed something where we can use Example 02...)
 */

// nut_4_Makerbolt();




/* ************************** Modules ******************************************* */
/* Example 01.
 *
 * A simple small knurled cylinder with a Makerbot "M" engraved in the top face
 */
module makerbot_M_knurled_coin()
{
    k_cyl_hg=4;      // Knurled cylinder height
    k_cyl_od=22.5;   // Knurled cylinder outer* diameter

    knurl_wd=3;      // Knurl polyhedron width
    knurl_hg=4;      // Knurl polyhedron height
    knurl_dp=1.5;    // Knurl polyhedron depth

    e_smooth=2;      // Cylinder ends smoothed height
    s_smooth=0;      // [ 0% - 100% ] Knurled surface smoothing amount

    difference()
    {
        knurled_cyl(k_cyl_hg, k_cyl_od, 
                    knurl_wd, knurl_hg, knurl_dp, 
                    e_smooth, s_smooth);

        scale([0.66,0.66,1]) 
        translate([-6.5,-1,k_cyl_hg-1]) 
          fnt_str(["M"],1,0,1.1);
    }
}


/* ****************************************************************************** */
/* Example 02.
 *
 * Example 01 extended to create a large and short bolt.
 */
module Makerbolt()
{
 /* Bolt parameters.
  *
  * Just how thick is the head.
  * The other parameters, common to bolt and nut, are defined into k_cyl() module
  */
    b_hg=10;

 /* Screw thread parameters
  */
    t_od=15;    // Thread outer diameter
    t_st=2.5;   // Step/traveling per turn
    t_lf=55;    // Step angle degrees
    t_ln=15;    // Length of the threade section
    t_rs=PI/2;  // Resolution
    t_se=1;     // Thread ends style
    t_gp=0;     // Gap between nut and bolt threads


    difference()
    {
        union()
        {
            k_cyl(b_hg);

            translate([0,0,b_hg])
              screw_thread(t_od+t_gp, t_st, t_lf, t_ln, t_rs, t_se);
        }

        scale([0.66,0.66,1]) 
        translate([-6.5,-1,-0.1]) 
          fnt_str(["M"],1,0,1.1);
    }
}


/* ****************************************************************************** */
/* Example 03.
 *
 * Just a knurled nut.
 * (Because we needed something where we can use Example 02...)
 */
module nut_4_Makerbolt()
{
 /* Nut parameters.
  */
    n_df=25;    // Distance between flats
    n_hg=10;    // Thickness/Height
    n_od=15;    // Outer diameter of the bolt to match
    n_st=2.5;   // Step height
    n_lf=55;    // Step Degrees
    n_rs=0.5;   // Resolution
    n_gp=0.3;   // Gap between nut and bolt


    intersection()
    {
        hex_nut(n_df, n_hg, n_st, n_lf, n_od + n_gp, n_rs);

        k_cyl(n_hg);
    }
}


/* ****************************************************************************** */
/* Knurled cylinder module used in both: Makerbolt() and Makerbolt_nut() modules
 */
module k_cyl(bnhg)
{
 /* Bolt/Nut parameters
  */
    k_cyl_hg=bnhg;   // Knurled cylinder height
    k_cyl_od=22.5;   // Knurled cylinder outer* diameter

    knurl_wd=3;      // Knurl polyhedron width
    knurl_hg=4;      // Knurl polyhedron height
    knurl_dp=1.5;    // Knurl polyhedron depth

    e_smooth=1;      // Cylinder ends smoothed height
    s_smooth=0;      // [ 0% - 100% ] Knurled surface smoothing amount

    knurled_cyl(k_cyl_hg, k_cyl_od, 
                knurl_wd, knurl_hg, knurl_dp, 
                e_smooth, s_smooth);
}




