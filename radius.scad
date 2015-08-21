

/*  innerRadius
    Create a cove-like shape that resembles a skateboard quarter pipe
*/
module innerRadius(r, l) {
  difference() {
    cube([r, l, r], center=true);
    translate([r/2,0,r/2]) rotate([90,0,0]) cylinder(r=r, h=l+0.1, center=true);
  }
}


/*  outerRadius
    Create a cube where one edge has been radiused
*/
module outerRadius(r, l) {
  halfR = r / 2;

  union() {
    translate([halfR,0,halfR]) rotate([90,0,0]) cylinder(r=r, h=l, center=true);
    translate([halfR,0,0]) cube([r*2,l,r], center=true);
    translate([0,0,r]) cube([r,l,r], center=true);
  }
}
