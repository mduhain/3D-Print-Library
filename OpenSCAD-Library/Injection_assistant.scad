// Viral Injection Holder v1.0
// July 15th, 2021
// @mduhain
//
// TODO:
// + add mount points for raspberry pi cameras along x and Y axis (center points 75mm)
// - add openings in base plate to trail out rpi camera cables.
// + add mount adapters to  Rpi cameras, so we can rotate them on x/y axis respectively
//

module base() {
    translate([0,0,0]){
        rotate([0,0,0]){
            cube([150,150,10]); //big platform base
        }
    }
}
module holder() {
    os = 8.4; //45 deg offset
    $fn = 100; //smooth
    translate([75+os,75+os,10]){
        cylinder(r1=3,r2=1,h=20); //upright arm
    }
    translate([69.35+os,69.35+os,30]){
        rotate([90,0,45]){
            rotate_extrude(angle=90, convexity = 2) {
                translate([8,0,0]){circle(r=1);}
                // fancy bend 45 deg arm
            }
        }
    }
    translate([75,75,37]){
        difference(){
            cylinder(d=9,h=2);
            translate([0,0,-1]){
                cylinder(d=6,h=4); //cirle mount
            }
        }
    }
}
module rpi_cam(){
    $fn=40;
    module body(){
        cube([25,24,2]); //silicon
        translate([8.5,10,2]){
            cube([8,8,2]); //camera base
        }
        translate([12.5,14,4]){
            cylinder(d=7,h=2.5); //camera lens
        }
    }
    module holes(){
        // screw holes for RPi mount
        translate([2,2,-1]){cylinder(h=4,d=2);}
        translate([23,2,-1]){cylinder(h=4,d=2);}
        translate([2,14.5,-1]){cylinder(h=4,d=2);}
        translate([23,14.5,-1]){cylinder(h=4,d=2);}
    }
    difference(){
        body();
        holes();
    }
}
module cam_mount(){
    $fn = 40;
    module main() {
        cube([25,24,2]);
        translate([2,2,2]){cylinder(h=4,d=4);}
        translate([23,2,2]){cylinder(h=4,d=4);}
        translate([2,14.5,2]){cylinder(h=4,d=4);}
        translate([23,14.5,2]){cylinder(h=4,d=4);}
    }
    module neg(){
        translate([2,2,-1]){cylinder(h=8,d=2.4);}
        translate([23,2,-1]){cylinder(h=8,d=2.4);}
        translate([2,14.5,-1]){cylinder(h=8,d=2.4);}
        translate([23,14.5,-1]){cylinder(h=8,d=2.4);}
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
    difference(){
        main();
        neg();
    }
    // two pin arms for mounting go-pro style
    // 12.5 for midpoint, neg space, 2 on each side.
    // added 0.1 on each so middle is 2.2 mm not 2mm
    translate([11.4,14,-5.9]){
        rotate([0,-90,0]){
            pin_arm();
        }
    }
    translate([15.6,14,-6]){
        rotate([0,-90,0]){
            pin_arm();
        }
    }
}
module cam_mount_v2(){
    $fn = 40;
    cube([25,24,2]);
    translate([2,2,2]){cylinder(h=6,d1=2.4,d2=1.6);}
    translate([23,2,2]){cylinder(h=6,d1=2.4,d2=1.6);}
    translate([2,14.5,2]){cylinder(h=6,d1=2.4,d2=1.6);}
    translate([23,14.5,2]){cylinder(h=6,d1=2.4,d2=1.6);}
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
    // two pin arms for mounting go-pro style
    // 12.5 for midpoint, neg space, 2 on each side.
    // added 0.1 on each so middle is 2.2 mm not 2mm
    translate([11.4,14,-5.9]){
        rotate([0,-90,0]){
            pin_arm();
        }
    }
    translate([15.6,14,-6]){
        rotate([0,-90,0]){
            pin_arm();
        }
    }
}

module pi_mount_base(){
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
    translate([2.8,8,9.9]){
        rotate([0,90,0]){
            pin_arm(); //left 0.2mm extra
        }
    }
    translate([7,8,9.9]){
        rotate([0,90,0]){
            pin_arm(); //middle
        }
    }
    translate([11.2,8,9.9]){
        rotate([0,90,0]){
            pin_arm(); //right 0.2 mm extra
        }
    }
    translate([2,2,2]){cube([12,12,2]);}
}


//---------------------------------------------------------
// START ASSEMBLING ITEMS INTO PLACE
//---------------------------------------------------------

base();

holder();


translate([75-12.5,20,36]){
    rotate([-90,0,0]){
        rpi_cam();
    }
}
translate([20,75+12.5,36]){
    rotate([-90,0,-90]){
        rpi_cam();
    }
}
translate([75-8,0,10]){
    pi_mount_base();
}
translate([16,75-8,10]){
    rotate([0,0,90]){
        pi_mount_base();
    }
}
translate([75-12.5,12,40]){
    rotate([-90,0,0]){
        #cam_mount_v2();
    }
}

translate([12,75+12.5,36]){
    rotate([-90,0,-90]){
        #cam_mount_v2();
    }
}







