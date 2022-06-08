//NEUROPIXELS DOVETAIL HOLDER
// From Spec-sheet provided on the HHMI/Janelia Website
// To-Scale
// Conmverted from inches to mm 
// 1" = 25.4 mm
// 0.5" = 12.7 mm 
// 0.25" = 6.35 mm 

module post(){
    module main(){
        translate([0,0,0]){
            rotate([0,0,0]){
                cylinder($fn=100, d=6.35, h=30);
            }}
        }
    module neg(){
        translate([0,-4,0]){
            rotate([0,-30,0]){
                #cube([4,8,10]);
            }}
        }
    difference(){
        main();
        neg();
    }
}

post();
