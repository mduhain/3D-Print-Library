// 1x3 stepper moptor binding
// Accommodates 1/4-20" screws, spaced 2" apart
// Holds a ELEGOO 5V 5-pin stepper motor (28BYJ-48 ULN-2003)
//
//

$fn = 100;
module platform () {
    translate([-3,0,0]){
        cube([19,62.8,3]);
    }
}
module holes() {
    translate([6,6,-0.5]) {
        cylinder(d=6.75,h=4);}
    translate([6,50.8+6,-0.5]) {
        cylinder(d=6.75,h=4);}
    }
difference() {
    platform();
    #holes();
}
module upright() {
    translate([-3,8.4,0]){
        rotate([0,0,0]) {
            cube([19,45,28]);
        }
    }
    translate([-3,0,3]){
    difference(){
        cube([19,8.4,8.4]);
        translate([-0.5,0,0]) {
            rotate([45,0,0]) {
                cube([20,12,12]);
            }
        }
    }
}
    translate([-3,53.4,3]){
        difference(){
            cube([19,8.4,8.4]);
            translate([-0.5,0,8.4]) {
                rotate([-45,0,0]) {
                    cube([20,12,12]);
                }
            }
        }
    }
}
module upright_holes() {
    // Large centeral 
    translate([-3.5,30.9,17]) {
        rotate([0,90,0]) {
            cylinder(d=28,h=20);
        }
    }
    //left small hole
    translate([-3.5,13.4,17]) {
        rotate([0,90,0]) {
            cylinder(d=4.2,h=20);
        }
    }
    //right small hole
    translate([-3.5,48.4,17]) {
        rotate([0,90,0]) {
            cylinder(d=4.2,h=20);
        }
    }
    //left vertical screw hole
    translate([6,6,-0.5]) {
        cylinder(d=9.8,h=30);
        }
    //right vertical screw hole
    translate([6,50.8+6,-0.5]) {
        cylinder(d=9.8,h=30);
        }
}
difference(){
    upright();
    upright_holes();
    }