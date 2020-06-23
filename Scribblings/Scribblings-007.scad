/* A cutter to produce a filleted removal in a side

Cutter produces is in the x-y plane and centres, so it will need to be rotated and translated for use (translate to the centre of the aperture and the centre of the thickness)

If the end of the aperture is oval with no flat bit, set r1 to half the smaller aperture dimension

*/

/* [rendering parameters] */
// default minimum facet angle is now 0.5
$fa=0.5; // [0:0.1:1]

// default minimum facet size is now 0.5 mm
$fs=0.5; // [0,0.1,0.5,2,10]


/* [General Parameters] */

// Size of the hole being cut
apertureSize=[15,8];

// Thickness of the material being cut through
thickness=2;

// Radius of the fillet around the cut
r1=2;

// Corner radius of a hole being cut
r2=0.5;

//Safety parameter
overlap=0.1;

cutter(apertureSize,r1,r2,thickness,overlap);

module cutter(apertureSize,r1,r2,thickness,overlap)
{
    union()
    {
        translate([apertureSize[0]/2-r1,apertureSize[1]/2-r1,0])
        {
            torus(apertureSize,r1,r2,thickness,overlap);
        }
        translate([-apertureSize[0]/2+r1,apertureSize[1]/2-r1,0])
        {
            torus(apertureSize,r1,r2,thickness,overlap);
        }
        translate([-apertureSize[0]/2+r1,-apertureSize[1]/2+r1,0])
        {
            torus(apertureSize,r1,r2,thickness,overlap);
        }
        translate([apertureSize[0]/2-r1,-apertureSize[1]/2+r1,0])
        {
            torus(apertureSize,r1,r2,thickness,overlap);
        }
        translate([-apertureSize[0]/2+r1,-apertureSize[1]/2,0])
        {
            rotate([90,0,90])
            {
                longside(apertureSize,r1,r2,thickness,overlap);
            }
        }
        translate([apertureSize[0]/2-r1,apertureSize[1]/2,0])
        {
            rotate([90,0,-90])
            {
                longside(apertureSize,r1,r2,thickness,overlap);
            }
        }
        translate([-apertureSize[0]/2,apertureSize[1]/2-r1,0])
        {
            rotate([90,0,0])
            {
                shortside(apertureSize,r1,r2,thickness,overlap);
            }
        }translate([+apertureSize[0]/2,-apertureSize[1]/2+r1,0])
        {
            rotate([90,0,180])
            {
                shortside(apertureSize,r1,r2,thickness,overlap);
            }
        }
        
    }
}

module longside(apertureSize,r1,r2,thickness,overlap)
{
    linear_extrude(height=apertureSize[0]-r1-r1)
    {
        union()
        {
            translate([0,-thickness/2-overlap])
            {      
                square([apertureSize[1]/2+overlap,thickness+2*overlap]);
            }
            2Dform(apertureSize,r1,r2,thickness,overlap);
        }
    }
}

module shortside(apertureSize,r1,r2,thickness,overlap)
{
    linear_extrude(height=apertureSize[1]-r1-r1)
    {
        union()
        {
            translate([0,-thickness/2-overlap])
            {      
                square([apertureSize[0]/2+overlap,thickness+2*overlap]);
            }
            2Dform(apertureSize,r1,r2,thickness,overlap);
        }
    }
}

module torus(apertureSize,r1,r2,thickness,overlap)
{
    rotate_extrude(convexity=10)
    {
        translate([-r1,0])
        {
            2Dform(apertureSize,r1,r2,thickness,overlap);
        }
    }
}

module 2Dform(apertureSize,r1,r2,thickness,overlap)
{
    difference()
    {
        translate([-r2,-thickness/2-overlap])
        {   
            square([r2+r1,thickness+2*overlap]);
        }
        nibbler(apertureSize,r1,r2,thickness,overlap);
    }
}

module nibbler(apertureSize,r1,r2,thickness,overlap)
{
    union()
    {
        translate([-r2-overlap,-thickness/2+r2])
        {
            square([r2+overlap,thickness-2*r2]);
        }
        translate([-r2,thickness/2-r2])
        {
            circle(r=r2);
        }
        translate([-r2,-thickness/2+r2])
        {
            circle(r=r2);
        }
    }
}