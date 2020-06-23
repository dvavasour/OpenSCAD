topFilletRadius=1;
edgeFilletRadius=6;

boxVector=[30,20,10];
zeroVector=[0,0,0];

baseShape(boxVector,topFilletRadius,edgeFilletRadius);

module baseShape(boxVector,topFilletRadius,edgeFilletRadius)
{
    // Shorten variable names for the layout section
    bV=boxVector; 
    tFR=topFilletRadius;
    eFR=edgeFilletRadius;
    
    hull()
    {
	torusCorner([eFR+tFR, eFR+tFR, bV[2]-tFR], tFR, eFR);
	torusCorner([bV[0]-eFR-tFR, eFR+tFR, bV[2]-tFR], tFR, eFR);
	torusCorner([bV[0]-eFR-tFR, bV[1]-eFR-tFR, bV[2]-tFR], tFR, eFR);
	torusCorner([eFR+tFR, bV[1]-eFR-tFR, bV[2]-tFR], tFR, eFR);
	
	cylinderCorner([eFR, eFR, 0], eFR, bV[2]-tFR);
	cylinderCorner([bV[0]-eFR, eFR, 0], eFR, bV[2]-tFR);
	cylinderCorner([bV[0]-eFR,  bV[1]-eFR,	0], eFR, bV[2]-tFR);
	cylinderCorner([eFR,	bV[1]-eFR,  0], eFR, bV[2]-tFR);
    }
}

module torusCorner(torusCentreVector,topFilletRadius,edgeFilletRadius)
{
    translate(torusCentreVector)
    {
	torus(topFilletRadius,edgeFilletRadius);
    }
}

module torus(topFilletRadius,edgeFilletRadius)
{
    rotate_extrude()
    {
	translate ([edgeFilletRadius,0])
	{
	    circle(topFilletRadius);
	}
    }
}

module cylinderCorner(cylinderBaseVector,cylinderRadius,cylinderHeight)
{
    translate(cylinderBaseVector)
    {
	cylinder(r=cylinderRadius,h=cylinderHeight);
    }
}

