/// @description Core logic

//If the object has left the screen, destroy it to save memory
if (self.x <= 0 || self.x > room_width + 200)
{
	instance_destroy(self);	
}

//Medusa head is rising/falling
//vSpd is set to the shift speed and count is incremented
if (self.count < self.maxFrames)
{
	vSpd = shift;
	self.count++;
}

//If maxFrames has been reached and the head is at its peak or valley, flip the peak boolean
else if (self.count >= self.maxFrames && !peak)
{
	self.peak = true;	
}

//if the object is at its peak, stay at that y position for n (maxPeakFrames) frames
if (self.peak == true)
{
	self.vSpd = 0;
	self.peakFrames++;
}
//When the peakFrames hits its max, reset variables, flip boolean, and flip shift
if (self.peakFrames >= self.maxPeakFrames)
{
	self.peak = false;
	self.peakFrames = 0;
	self.count = 0;
	self.shift *= -1;
}

//Apply movement
x += hSpd;
y += vSpd;