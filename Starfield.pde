Particle [] npart;//your code here
void setup()
{
size(500,500);
npart = new Particle[1000];
for (int i = 0; i<npart.length; i++)
{
	npart[1]= new OddballParticle();
	npart[2]= new JumboParticle();
	npart[i]= new NormalParticle();
}
}
void draw()
{
background(0);
for (int i = 0; i <npart.length; i++)
{
	npart[i].move();
	npart[i].show();
}	//your code here
}
class NormalParticle implements Particle
{
	int col;
	double x,y,angle,speed,a,b;
	NormalParticle()
	{
	x = 250;
	y = 250;
	angle = (Math.random()*2*Math.PI);
	speed = (Math.random()*3);
	col = color((int)(Math.random()*255),(int)(Math.random()*255),(int)(Math.random()*255));
	}
	public void move()
	{
	a = Math.cos(angle)*speed;
	b = Math.sin(angle)*speed;
	x = x - a;
	y = y - b;
	if(x>501 || y>501)
	{
		x=250;
		y=250;
	}
	else 
	if (x<0 || y<0) 
	{
		x=250;
		y=250;	
	}
	}
	public void show()
	{
	noStroke();
	fill(col);
	ellipse((float)x,(float)y,10,10);
	}
}
interface Particle
{
public void show();
public void move();
}
class OddballParticle implements Particle//uses an interface
{
	int col,x,y,a,b;
	OddballParticle()
	{
	x = 250;
	y = 250;
	col = color((int)(Math.random()*5)+250,(int)(Math.random()*5)+250,(int)(Math.random()*5)+250);
	}
	public void show()
	{
	noStroke();
	fill(col);
	ellipse((float)x,(float)y,20,20);
	}
	public void move()
	{
	a = (int)(Math.random()*5)-2;
	b = (int)(Math.random()*5)-2;
	x = x+a;
	y = y+b;
	}	
}
class JumboParticle extends NormalParticle//uses inheritance
{
public void show()
{
	ellipse((float)x,(float)y,50,50);
}
}

