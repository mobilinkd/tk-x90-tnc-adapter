//--------------------------------------------------------
// https://www.thingiverse.com/thing:3293299
// Parametric D-Sub shell housings 
// by uwe.zimmermann@sciencetronics.com
//--------------------------------------------------------
/* D-SUB  measures
     A     B     C     D
 9  30.8  25.0  19.2  16.9
15  39.1  33.3  27.7  25.3
25  53.0  47.0  41.1  39.0
37  69.3  63.5  57.3  55.4

height 12.5
front height male 9

A - outer length
B - distance between holes
C - shoulder width on the solder side
D - male connector front width

E - outer case width
F - distance between case screws

G - male connector front height
H - outer case height

average values
A-D = 14
B-D =  8
C-D = 2.3

E-D =  1
F-D = -9

G   = 9
H   = 12.5
*/

//D = 16.9;  // D-SUB 9
//D = 25.3;  // D-SUB 15 2row
D = 39.0;  // D-SUB 25
//D = 55.4;  // D-SUB 37

wire_dia = 7;

grip = true;

//=============================================
C = D +  2.4;
B = D +  8.0;
A = D + 14.0;
E = D +  1.0;
F = D -  8.0;


G   = 9;
H   = 12.5;

eps=1e-3;
mink=1.2;

module inner()
{
  linear_extrude(height=H/2+eps)
  {
    polygon(
      points=[
        [0,0],
        [C/2,0],
        [C/2, 4.5],
        [E/2-mink, 6],
        [E/2-mink, 6+20],
        [E/2-mink-wire_dia/2, 6+20+15],
        [-(E/2-mink-wire_dia/2), 6+20+15],
        [-(E/2-mink), 6+20],
        [-(E/2-mink), 6],
        [-C/2, 4.5],
        [-C/2,0],
        [0,0]
    ]);
  }
}


difference()
{
  union()
  {
    difference()
    {
      union()
      {
        intersection()
        {
          translate([0,0,mink])
          minkowski()
          {
            union()
            {
              inner();
              translate([(E-1)/2,0,0])
              cube([7,6,H/2]);
              translate([-(E-1)/2-7,0,0])
              cube([7,6,H/2]);
            }  
            sphere(r=mink,$fn=20);
          }
          translate([-3*A/2,0,0])
          cube([3*A,100,H/2+mink]);
        }
      } 
 
      union()
      { 
        translate([0,0,mink])
        inner();
        translate([-C/2,-2,mink])
        cube([C, 5, H/2]);
        
        translate([B/2,0,H/2+mink])
        rotate([90,0,0])
        cylinder(r=3.5/2,h=20,$fn=60,center=true);
        
        translate([-2.2+B/2,1,H/2+mink-4+eps])
        cube([4.4,4,4]);        

        translate([-B/2,0,H/2+mink])
        rotate([90,0,0])
        cylinder(r=3.5/2,h=20,$fn=60,center=true);
        
        translate([-2.2-B/2,1,H/2+mink-4+eps])
        cube([4.4,4,4]);        
      }  
    }

    translate([-E/2+mink,20-5,0])
    cube([E-2*mink,10,2]);
    
    translate([-F/2,20,0])
    union()
    {
      cylinder(r=3.4/2+1,h=H/2+mink+2,$fn=60);
      cylinder(r=3.4/2+2,h=H/2+mink,$fn=60);
    }
    
    translate([+F/2,20,0])
    difference()
    {
      cylinder(r=3.4/2+2,h=H/2+mink,$fn=60);
      translate([0,0,H/2-2-.25])
      cylinder(r=3.4/2+1+.25,h=H/2+mink,$fn=60);
    }
    
    // front retainer clip
    translate([-D/2,-3+eps,0])
    cube([D,3,mink]);  
    translate([-D/2,-3+eps,0])
    cube([D,1.5,2]);
    
    // grip
    if (grip)
    {
      for (x=[-1,+1])
      {  
        for (y=[12:2:25])
        {
          translate([x*E/2,y,mink])
          intersection()
          {
            union()
            {
              cylinder(r1=0,r2=1,h=H/4,$fn=4);
              translate([0,0,H/4])
              cylinder(r1=1,r2=1,h=H/4,$fn=4);
            }
            translate([-5/2+x*(5/2),-5/2,-eps])
            cube([5,5,H/2+2*eps]);
          }  
        }
      }
    }  
  }

  union()
  {
    translate([-F/2,20,-eps])
    cylinder(r=6/2,$fn=60,h=3);
    translate([-F/2,20,-eps])
    cylinder(r=3.4/2,$fn=60,h=H);

    translate([+F/2,20,-eps])
    cylinder(r=6.4/2,$fn=6,h=2.5);
    translate([+F/2,20,-eps])
    cylinder(r=3.4/2,$fn=60,h=H);
    
    translate([0,6+20+15,H/2+mink])
    union()
    {
      rotate([90,0,0])
      cylinder(r=wire_dia/2,h=70,center=true);
      translate([-wire_dia/2,-70/2,0])
      cube([wire_dia,70,H/2]);
    }
  }

}  