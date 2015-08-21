

/*  toroid
    A toroid
*/
module toroid(r, depth) {
    rotate_extrude(convexity = 10) translate([r-depth/2, 0, 0]) circle(r=depth/2);
}


/*  toroidFilled
    A toroid with the inner area filled in by a cylinder
*/
module toroidFilled(r, depth) {
    union() {
        toroid(r, depth);
        cylinder(r=r-depth/2, h=depth, center=true);
    }
}
