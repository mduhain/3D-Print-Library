//MODULES
low= 2.2;
high=1.8;
module RPi_base() {
    $fn=40;
    cube([90,60,2]);
    translate([4,7,0]){
        cylinder(d1=low, d2=high, h=8); }
    translate([4,7+49,0]){
        cylinder(d1=low, d2=high, h=8); }
    translate([4+58,7,0]){
        cylinder(d1=low, d2=high, h=8); }
    translate([4+58,7+49,0]){
        cylinder(d1=low, d2=high, h=8); }
    }

module Arduno_base() {//https://i0.wp.com/blog.protoneer.co.nz/wp-content/uploads/2012/10/Arduino-Uno-Mega-Dimensions.png?ssl=1
    module neg() {
        translate([85,15,-1]){
            cube([10,30,4]);
        }
        translate([30,-1,-1]){
            cube([50,10,4]);
        }
    }
    $fn=40;
    ylen=15.2+27.9+5.1;
    difference(){
        cube([90,60,2]);
        neg();
    }
    translate([14,8,0]){
        cylinder(d1=low, d2=high, h=8); }
    translate([15.3,8+ylen,0]){
        cylinder(d1=low, d2=high, h=8); }
    translate([15.3+50.8,8+5.1,0]){
        cylinder(d1=low, d2=high, h=8); }
    translate([15.3+50.8,8+ylen-15.2,0]){
        cylinder(d1=low, d2=high, h=8); }
}

module top () {
    cube([90,60,2]);
}

module bi_arm (){
    difference(){
        cube([6,6,2]);
        translate([3,3,0]){cylinder(d1=3,d2=2,h=1.6,$fn=40);}
    }
    translate([3,3,2]){
        cylinder(d=4,h=25.4,$fn=40);
    }
    translate([3,3,27.4]){
        cylinder(d1=1.8,d2=1.0,h=1,$fn=40);
    }
}

module bi_attach (){
    difference(){
        cube([6,6,2]);
        translate([3,3,0]){cylinder(d1=3,d2=2,h=1.6,$fn=40);}
    }
}

module screw_attach (){
    difference(){
        cube([12,12,2]);
        translate([6,6,-1]){cylinder(d=6.4,h=4,$fn=40);}
    }
}

// RENDERING SPACE --------------------------------------------------

// RASPBERRY PI (w/ Base atachments & Risers)
translate([90,60,0]){
    rotate([0,0,180]){
        RPi_base();
    }
}
translate([0,-6,0]){bi_arm();}
translate([0,60,0]){bi_arm();}
translate([90,54,0]){bi_arm();}
translate([90,0,0]){bi_arm();}
translate([13.8,64.2,0]){screw_attach();}
translate([13.8,60,0]){cube([12,6,2]);} //single extender
translate([13.8,-12,0]){screw_attach();}
translate([90,38.8,0]){screw_attach();}
translate([90,13.4,0]){screw_attach();}



// ARDUINO BASE (w/ Risers)
translate([0,100,0]){Arduno_base();}
translate([0,94,0]){bi_arm();}
translate([0,160,0]){bi_arm();}
translate([90,154,0]){bi_arm();}
translate([90,100,0]){bi_arm();}

//PINS for screw hole allignment
//translate([96-(25.4*3),-6+(25.4*3),0]){#cylinder(d=6,h=8,$fn=40);}
//translate([96-(25.4*3),-6,0]){cylinder(d=6,h=8,$fn=40);}


// TOP CAP

translate([-20,0,0]){
    rotate([0,0,90]){
        top();
    }
}
translate([-20,0,0]){bi_attach();}
translate([-86,0,0]){bi_attach();}
translate([-26,90,0]){bi_attach();}
translate([-80,90,0]){bi_attach();}









