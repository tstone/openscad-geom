
include <radius.scad>;
include <toroidal.scad>;
include <cylinder.scad>;
include <rectangle.scad>;
include <structural.scad>;

$fn=50;


// --- radius.scad ---
translate([0,-45,0]) {

  innerRadius(5, 10);
  translate([15,0,0]) outerRadius(5, 10);

}

// --- toroidal.scad ---
translate([0,-25,0]) {

  toroid(10, 4);
  translate([25,0,0]) toroidFilled(10, 4);

}

// --- cylinder.scad ---
translate([0,0,0]) {

  tubeW(5, 10, 2);
  translate([25,0,0]) tubeR(5, 8, 10);
  translate([45,0,0]) halfMoon(5, 10);
  translate([60,0,0]) halfMoonTubeW(5, 10, 2);
  translate([75,0,0]) halfMoonTubeR(5, 8, 10);
  translate([95,0,0]) roundedCylinder(10, 5, 2.5);
}

// --- rectangle.scad ---
translate([0,25,0]) {

  tubeRect(10, 15, 5, 1.5);
  translate([15,0,0]) tubeRectInner(10, 15, 5, 1.5);

}

// --- structural ---
translate([0,40,0]) {

  angle(10, 20, 1.5);
  translate([15,0,0]) angleCustom(10, 12, 15, 3, 5);
  translate([35,0,0]) IBeamSimple(10, 12, 15, 2);
  translate([50,0,0]) IBeamWSection(10, 12, 15, 3, 2, 1);

}
