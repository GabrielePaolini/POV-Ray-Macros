#macro Scotia (Radius, Height)
	#local HalfHeight = 0.5 * Height; 
	
	#if (Radius <= HalfHeight)
		#declare Radius = Height;
	#end
	
	#local QuarterHeight = 0.25 * Height;  
	
	#declare CuttingTorusMajor = difference {   
		torus { Radius, 0.5 * Height rotate -x*90 } 
		box { <-Radius,-Radius,0>,<Radius,Radius,Height> }
	}    
	
	#declare CuttingTorusMinor = difference {
		torus { Radius - QuarterHeight, QuarterHeight rotate -x*90 }	                  
		box { <-Radius,-Radius,0>,<Radius,Radius,-Height> }              
	}  
	
	#declare CuttingCylinder = difference {
		cylinder { <0,0,0>,<0,0,Height>,Radius*1.1 }                
		cylinder { <0,0,0>,<0,0,Height>,Radius - QuarterHeight }
	}
	
	// Scotia
	#declare Scotia01 = difference {
		cylinder { <0,0,-HalfHeight>, <0,0,HalfHeight>, Radius }
		object 
		{
			CuttingTorusMajor
			translate <0,0,0.125 * Height>	
		}
		object 
		{
			CuttingTorusMinor   
			translate <0,0,0.1249 * Height>
		}                
		object { CuttingCylinder } 
		
		scale <0,0,0>
	}  
	      
	// Return object
	object { Scotia01 }
#end  