// RPi Camera Mount Base
//

$fn = 40;
translate([0,0,0]){
    cube([16,16,2]);
}
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
translate([2.6,8,9.9]){
    rotate([0,90,0]){
        pin_arm(); //left 0.2mm extra
    }
}
translate([7,8,9.9]){
    rotate([0,90,0]){
        pin_arm(); //middle
    }
}
translate([11.4,8,9.9]){
    rotate([0,90,0]){
        pin_arm(); //right 0.2 mm extra
    }
}
translate([2,2,2]){
    cube([12,12,2]);
}