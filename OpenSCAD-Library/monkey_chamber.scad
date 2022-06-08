// Monkey Chamber
//
// For MGR, Jan 10th 2022
//
//
// = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =

//VARIABLES

// Parameters for holes
hd = 0.15; //Hole Diameter
hfn = 20; //Hole Face Number
hs = 0.3; //Hole Spacing
nsh = 15; //Number of shells around central 7 holes


module chamber(){
    module main(){
        translate([0,0,0]){
            rotate([0,0,0]){
                cylinder(d=12,h=10,$fn=240);
            }
        }
    }
    module neg(){
        // fake skull
        translate([8,0,-45]){
            sphere(d=100, $fn=100);
        }
        // central cylinder top
        translate([0,0,8]){
            cylinder(d=10,h=12,$fn=200);
        }
        // central cylinder bottom
        translate([0,0,-2 ]){
            cylinder(d=10,h=9,$fn=200); 
        }
        //shank hole (central)
        translate([0,0,6 ]){
            cylinder(d=hd,h=3,$fn=hfn); 
        }
        // Six hexagonal translation steps around a central point 
        // (1st move = 7th move)
        jn = sqrt(3)/2;
        xts = [hs,hs/2,hs/-2,hs*-1,hs/-2,hs/2,hs]; //x-dim translation steps
        yts = [0,hs*jn,hs*jn,0,hs*-1*jn,hs*-1*jn,0]; //y-dim translation steps
        for (i = [0:nsh]){
            if (i==0){
                //inner most shell (6 corners, no between corners)
                for (j = [0:5]){ // translation moves
                    translate([xts[j],yts[j],6]){
                        cylinder(d=hd,h=3,$fn=hfn);
                    }
                }
            }
            if (i > 0){ //repeat moves 1-5 with partial steps
                for (j = [0:5]) { //add corners
                    translate([xts[j]*(i+1),yts[j]*(i+1),6]){
                        cylinder(d=hd,h=3,$fn=hfn);
                    }
                    if (j > 0){
                        for (x = [1:i]){
                            //new loop for additonal steps between corners
                            newx = xts[j]-xts[j-1];
                            newy = yts[j]-yts[j-1];
                            translate([xts[j-1]*(i+1)+newx*x,yts[j-1]*(i+1)+newy*x,6]){
                                cylinder(d=hd,h=3,$fn=hfn);
                            }
                        }
                    }
                }
                //one more for the final step 5-6
                for (x = [1:i]){
                    newx = xts[6]-xts[5];
                    newy = yts[6]-yts[5];
                    translate([xts[5]*(i+1)+newx*x,yts[5]*(i+1)+newy*x,6]){
                        cylinder(d=hd,h=3,$fn=hfn);
                    }
                }
            }
        }
    }
   
    difference(){
        main();
        neg();
    }
}
//--------------------------------------------------------------------------------

difference(){
chamber();
translate([-10,-20,-9]){cube([20,20,20]);}
}