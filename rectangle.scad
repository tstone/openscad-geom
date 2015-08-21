

/*  tubeRect
    Create a tube-like shape from rectangles, specifying
    the outer dimensions.  Looks like a cardboard box without
    a floor.
*/
module tubeRect(outerWidth, outerHeight, depth, frame) {

    halfFrame = frame / 2;

    module member(l) {
        cube([frame, l, depth], center=true);
    }

    union() {
        rotate([0,0,90]) {
            translate([outerHeight/2-halfFrame,0,0]) member(outerWidth);
            translate([-outerHeight/2+halfFrame,0,0]) member(outerWidth);
        }

        translate([outerWidth/2-halfFrame,0,0]) member(outerHeight);
        translate([-outerWidth/2+halfFrame,0,0]) member(outerHeight);
    }
}


/*  tubeRectInner
    Create a tube-like shape from rectangles, specifying
    the inner dimensions (window).  Looks like a cardboard box
    without a floor.
*/
module tubeRectInner(innerWidth, innerHeight, depth, frame) {

    halfFrame = frame / 2;

    module member(l) {
        cube([frame, l+(frame*2), depth], center=true);
    }

    union() {
        rotate([0,0,90]) {
            translate([innerHeight/2+halfFrame,0,0]) member(innerWidth);
            translate([-innerHeight/2-halfFrame,0,0]) member(innerWidth);
        }

        translate([innerWidth/2+halfFrame,0,0]) member(innerHeight);
        translate([-innerWidth/2-halfFrame,0,0]) member(innerHeight);
    }
}
