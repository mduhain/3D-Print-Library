// Trial block for screw threads
// from: https://www.nablu.com/2020/01/new-approach-to-screw-threads-in.html
// 

function ISO_ext_thread_profile() = [
    [0, 1],          // middle of outer edge
    [1/16, 1],       // top of outer edge
    [0.5-1/8, -1],   // bottom of inner edge
    [0.5+1/8, -1],   // top of inner edge
    [1-1/16, 1],     // bottom of next higher outer edge
    [1, 1]           // middle of next higher outer edge
];
 

//rotate_extrude($fn=100){     
//    polygon(points=[[0,0],[2,0],[1,1.732]]);
//}


//sqrt(3) = 1.732

//rotate_extrude($fn=200) 
//polygon( points=[[0,0],[1.732,1],[0,2]] );

polygon( points = ISO_ext_thread_profile());