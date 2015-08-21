
use <radius.scad>;


// ----- Angles -----

/*  angle
    Create a basic angle piece, two planes intersecting
    at 90 degrees.
*/
module angle(w, l, wall) {
    angleCustom(w, w, l, wall, wall);
}

/*  angleCustom
    Create a custom angle, two planes intersecting
    at 90 degrees, with complete control over each
    plane.
*/
module angleCustom(w, h, l, verticalWall, horizontalWall) {
    union() {
        // horizontal flange
        translate([0,0,0]) cube([w, l, horizontalWall]);
        // vertical flange
        translate([0,0,0]) cube([verticalWall, l, h]);
    }
}


// ----- I Beams -----

/*  IBeamSimple
    A simple I-beam
*/
module IBeamSimple(w, h, l, wall) {

    module flange() {
        cube([w,l,wall], center=true);
    }

    translate([0,0,-h/2]) union() {
        // upper flange
        translate([0,0,h-(wall/2)]) flange();
        // web
        translate([0,0,h/2]) cube([wall, l, h], center=true);
        // lower flange
        translate([0,0,wall/2]) flange();
    }
}


/*  IBeamWSection
    A W-section I-beam
*/
module IBeamWSection(w, h, l, flangeThickness, webThickness, webRadius) {

    module flange() {
        cube([w,l,flangeThickness], center=true);
    }

    translate([0,0,-h/2]) union() {
        // upper flange
        translate([0,0,h-(flangeThickness/2)]) flange();
        // web
        translate([0,0,h/2]) cube([webThickness, l, h], center=true);
        // lower flange
        translate([0,0,flangeThickness/2]) flange();

        translate([-webThickness/2-webRadius/2,0,0]) {
            // upper left radius
            translate([0,0,h-flangeThickness-webRadius/2]) rotate([0,180,0]) innerRadius(webRadius, l);
            // lower left radius
            translate([0,0,webRadius+flangeThickness-webRadius/2]) rotate([0,270,0]) innerRadius(webRadius, l);
        }

        translate([webThickness/2+webRadius/2,0,0]) {
            // upper right radius
            translate([0,0,h-flangeThickness-webRadius/2]) rotate([0,90,0]) innerRadius(webRadius, l);
            // lower right radius
            translate([0,0,webRadius+flangeThickness-webRadius/2]) rotate([0,0,0]) innerRadius(webRadius, l);
        }
    }

}
