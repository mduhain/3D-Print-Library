// Mouse rig base
//
//
//-----------------------------------------------------------------------------
// Main base piece
module main() {
    cube([50,50,2]);
}

module holes() {
    translate([10,10,-1]) {cylinder(h=4,r=4,$fn=100);}
    translate([40,40,-1]) {cylinder(h=4,r=4,$fn=100);}
    translate([40,10,-1]) {cylinder(h=4,r=4,$fn=100);}
    translate([10,40,-1]) {cylinder(h=4,r=4,$fn=100);}
}

difference(){
main();
holes();
}

//-----------------------------------------------------------------------------
// Raiser(s)
translate([19,10,1]) {cube([5,30,15]);}
translate([26,10,1]) {cube([5,30,15]);}


module crescent() {
   difference () {
       cube([15,10,5]);
       translate([7.5,0,-1]) {
            cylinder(h=7, r=7.5, $fn=100);
       }
   }
}

translate([19,0,15.5]) {rotate([0,90,0]) {crescent();}}
translate([26,0,15.5]) {rotate([0,90,0]) {crescent();}}

module slant_arm() {
   difference () {
       cube([40,15,5]);
       translate([0,0,-1]) {    
            rotate([0,0,20]) {
                cube([45,20,7]);
            }
       }
   }
}

translate([19,78,16]) {
    rotate([-90,0,-90]) {
        slant_arm();
    }
}

translate([26,78,16]) {
    rotate([-90,0,-90]) {
        slant_arm();
    }
}



//-----------------------------------------------------------------------------
// Mouse Half pipe
module tube() {
    difference() {
        cylinder(h=100,r=24,$fn=100);
        translate([0,0,-1]) {cylinder(h=102,r=22,$fn=200);}
    }
}

module lip() {
    difference() {
        cylinder(h=2,r=23,$fn=100);
        translate([0,-1,-1]) {cylinder(h=4,r=20.9,$fn=200);}
    }
}

module halfpipe() {
    difference() {
        rotate([0,0,0]) { tube(); }
        translate([-31,-62,-3]) { cube([65,65,105]); }
    } 
}
module halfpipe_shift() {
    translate([25,-20,39]) {
        rotate([-90,0,0]) { 
            halfpipe();
        }
    }
}

halfpipe_shift();

translate([25,80,40]){
difference(){
    translate([0,0,0]){
        rotate([90,0,0]){
            lip();
        }
    }
    translate([-30,-3,-6]){
        cube([60,4,60]);
    }
}
}


