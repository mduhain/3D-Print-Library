// RPi Camera v2 mount (version 2, with pins)
//
// Version 1.0 (July 16 2021)
// - created
//
// Version 1.1 (July 19 2021)
// + made the cylindrical pins thicker (+0.2mm)
// + added 2mm to the height of the pin_arms
//
//

$fn = 40;
cube([25,24,2]);
translate([2,2,2]){cylinder(h=6,d1=2.6,d2=1.8);}
translate([23,2,2]){cylinder(h=6,d1=2.6,d2=1.8);}
translate([2,14.5,2]){cylinder(h=6,d1=2.6,d2=1.8);}
translate([23,14.5,2]){cylinder(h=6,d1=2.6,d2=1.8);}
module pin_arm(){
    translate([0,-6,0]){
        cube([6,2,2]);
    }
    translate([0,4,0]){
        cube([6,2,2]);
    }
    translate([4,-6,0]){
        cube([2,10,2]);
    }
    translate([6,-6,0]){
        cube([2,12,2]);
    }
    difference(){
        translate([0,0,0]){
            rotate([0,0,0]){
                cylinder(h=2,d=12);
            }
        }
        translate([0,0,-0.5]){
            rotate([0,0,0]){
                cylinder(h=3,d=7);
            }
        }
    }   
}
// two pin arms for mounting go-pro style
// 12.5 for midpoint, neg space, 2 on each side.
// added 0.1 on each so middle is 2.2 mm not 2mm
translate([11.4,14,-7.9]){
    rotate([0,-90,0]){
        pin_arm();
    }
}
translate([15.6,14,-7.9]){
    rotate([0,-90,0]){
        pin_arm();
    }
}