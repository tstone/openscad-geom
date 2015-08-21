
use <toroidal.scad>;


/*  tubeW
    Create a tube by specifying it's radius and wall (thickness)
*/
module tubeW(height, radius, wall) {
  difference() {
    cylinder(h=height, r=radius, center=true);
    cylinder(h=height+0.01, r=radius-wall, center=true);
  }
}


/*  tubeR
    Create a tube by specifying it's inner and outer radius
*/
module tubeR(height, IR, OR) {
  difference() {
    cylinder(h=height, r=OR, center=true);
    cylinder(h=height+0.01, r=IR, center=true);
  }
}


/*  halfMoon
    Create a cylinder cut in half along the diameter
*/
module halfMoon(height, r) {
  translate([r/2,0,-height/2]) difference() {
    cylinder(h=height, r=r);
    translate([r/2,0,height/2]) cube(size=[r, r*2, height+0.2], center=true);
  }
}


/*  halfMoonTubeW
    Create a half moon tube, specifying it's radius and wall (thickness),
    cut along the diameter
*/
module halfMoonTubeW(height, r, wall) {
  translate([r/2,0,0]) difference() {
    tubeW(height, r, wall);
    translate([r/2,0,0]) cube(size=[r, r*2, height+0.2], center=true);
  }
}


/*  halfMoonTubeR
    Create a hafl moon tube, specifying it's inner and outer radius,
    cut along the diameter.
*/
module halfMoonTubeR(height, IR, OR) {
  translate([OR/2,0,0]) difference() {
    tubeR(height, IR, OR);
    translate([OR/2,0,0]) cube(size=[OR, OR*2, height+0.2], center=true);
  }
}


/*  roundedCylinder
    Create a cylinder where the edges have been radiused
*/
module roundedCylinder(primaryR, height, roundedR) {

  module radius() {
    toroid(primaryR, roundedR);
  }

  innerPrimaryR = primaryR - roundedR / 2;

  union() {
    // primary
    cylinder(r=innerPrimaryR, h=height, center=true);
    // primary fill
    cylinder(r=primaryR, h=height-(roundedR), center=true);
    // upper radius
    translate([0,0,height/2-roundedR/2]) radius();
    // lower radius
    translate([0,0,-height/2+roundedR/2]) radius();
  }
}
