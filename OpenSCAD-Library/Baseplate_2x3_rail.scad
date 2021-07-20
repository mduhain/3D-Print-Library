$fn = 100;

module platform () {
    translate([-3,0,0]){
        cube([19+25.4,62.8,3]);
    }
    translate([-3,12,2]){
        cube([19+25.4,62.8-24,3]);
    }
}

module holes() {
    translate([6,6,-0.5]) {
        cylinder(d=6.75,h=4);}
    translate([6,50.8+6,-0.5]) {
        cylinder(d=6.75,h=4);}
    translate([6+25.4,6,-0.5]) {
        cylinder(d=6.75,h=4);}
    translate([6+25.4,50.8+6,-0.5]) {
        cylinder(d=6.75,h=4);}
    translate([6,2.65,-0.5]) {
            cube([25.4,6.75,4]); }
    translate([6,2.65+50.8,-0.5]) {
            cube([25.4,6.75,4]); }
    }

difference() {
    platform();
    #holes();
}