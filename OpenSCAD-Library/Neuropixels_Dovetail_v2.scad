//NEUROPIXELS DOVETAIL HOLDER
// From Spec-sheet provided on the HHMI/Janelia Website
// To-Scale
// Conmverted from inches to mm 
// 1" = 25.4 mm
// 0.5" = 12.7 mm 
// 0.25" = 6.35 mm 

module post(){
    n=2.2; //linear shift
    module main(){
        translate([0,0,0]){
            rotate([0,0,0]){
                cylinder($fn=100, d=6.35, h=10.9);
            }}
        }
    module neg(){
        translate([-5.397+n,-4,-0.1]){
            cube([4,8,8]); //Front-bottom missing
            }
        translate([1+n,-4,-0.1]){
            cube([4,8,8]); //Back-bottom missing
            }
        translate([-5.397,-4,8.9]){
            cube([4,8,1]); //front-top missing
            }
        translate([1,-4,8.9]){
            cube([4,8,1]); //back-top missing
            }
        translate([-0.8383+n,-2.4308,-0.1]){
            rotate([0,0,90]){
                linear_extrude(height=12.8-6){ 
                    //Main dovetail
                    polygon([[0,0],[4.8616,0],[4.5390,0.5588],[0.3226,0.5588]]);
            }}}
        translate([-1.4383+n,2.01,-0.6]){
            rotate([45,0,0]){
                cube([0.6,0.8,0.8]);
            }}
        translate([-1.4383+n,-1.99,-0.6]){
            rotate([45,0,0]){
                cube([0.6,0.8,0.8]);
            }}
            
        translate([-1.9+n,0,3.6]){
            rotate([0,90,0]){
                #cylinder(h=3,d=2.4,$fn=30);
            }}
        }
    difference(){
        main();
        neg();
    }
}
//----------------------------------------------------
module headpost(){
    // designed to be printed at HIGH RES 0.12mm layer thickness (t) multiple of 0.12
    t = 1.32;
    module main(){
        translate([0,0,0]){
            rotate([0,0,0]){
                cube([12.5,3.5,t]);}}
        translate([12.5,0,0]){
            rotate([0,0,0]){
                cube([13.5,13.5,t]);}}
        translate([26,0,0]){
            rotate([0,0,-40]){
                translate([-2,0,0]){
                cube([18,2,t]);}}
                }
    }
    module neg(){
        translate([19.4,7,-0.4]){
            rotate([0,0,0]){
                cylinder(d=10,h=2, $fn=100);}}
        translate([26,10.06,-1]){
            rotate([0,0,40]){
                cube([4.5,4.5,4.5]);}}
        
    }
    difference(){
        main();
        neg();
    }
}
//-----------------------------------------------------
module bracket(){
    module main(){
        cylinder(d=14,h=10, $fn=100);
    }
    module neg() {
        translate([0,0,-1]){
            cylinder(d=10,h=12, $fn=100);
            }
        translate([-8,-11,-1]){
            cube([16,12,12]);
            }
        rotate_extrude(angle = 180, $fn=100){
            #polygon([[5.5,0],[6.5,0],[6.5,1],[5.5,1]]);
}
        }
    difference(){
        main();
        neg();
    }
}
//----------------------------------------------------
module leg(){
    rotate_extrude(angle = 30, $fn=100){
            #polygon([[5,0],[7,0],[7,1],[6.5,1],[6.5,2],[5.5,2],[5.5,1],[5,1]]);
    }
}


//----------------------------------------------------

translate([0.1,0,-7]){
    rotate([0,0,0]){
        bracket();
    }}

translate([0.1,0,-8]){
    rotate([0,0,5]){
        leg();
    }
    rotate([0,0,75]){
        leg();
    }
    rotate([0,0,145]){
        leg();
    }
}

translate([19.5,-7,-8]){
    rotate([0,180,0]){
        headpost();
    }}
    
translate([0,0,8]){
    post();
}
