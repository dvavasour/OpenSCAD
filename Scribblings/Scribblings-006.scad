/* [General Parameters] */
bevelSize=5;
bevelVector=[45,20];
zeroVector=[0,0,0];

bevelSolid(bevelSize,bevelVector);


module bevelSolid(bevelSize,bevelVector)
{
    hull() // Put corner elements at the four corners of the bevel solid
    {
	translate([bevelSize,bevelSize,0])
	{
	    bevelCorner(bevelSize);
	}
	translate([bevelVector[0]-bevelSize,bevelSize,0])
	{
	    bevelCorner(bevelSize);
	}
	translate([bevelVector[0]-bevelSize,bevelVector[1]-bevelSize,0])
	{
	    bevelCorner(bevelSize);
	}
	translate([bevelSize,bevelVector[1]-bevelSize,0])
	{
	    bevelCorner(bevelSize);
	}
    }
}



module bevelCorner(bevelSize)
{
    intersection()
    {
	rotate([90,0,0])
	{
	    bevelCornerElement(bevelSize);
	}

	rotate([90,0,90])
	{
	    bevelCornerElement(bevelSize);
	}
    }
}

module bevelCornerElement(bevelSize)
{
    linear_extrude(height=2*bevelSize,center=true)
    {
	polygon(points=[[bevelSize,0],[bevelSize,bevelSize],[-bevelSize,bevelSize],[-bevelSize,0],[0,-bevelSize]]);
    }
}
