class Enemy1
{
  PVector Epos;
  PVector Emove;
  float Ew;
  boolean alive = true;
  
   Enemy1()
 {
   this(width/2,height/2,100);
  
  alive = false;
 }
  
  Enemy1(float x, float y , float w)
  {
   this.Ew = w;
   Epos = new PVector(x,y);
   Emove = new PVector();
  }
  

  
  void display()
{
  float halfW = Ew * 0.5;
  
  if(!alive)return;
  
  stroke(255,0,0);
  //body
  line(Epos.x,Epos.y,Epos.x + halfW ,Epos.y + halfW);
  line(Epos.x,Epos.y,Epos.x - halfW,Epos.y + halfW);
  line(Epos.x - halfW,Epos.y + halfW,Epos.x + halfW,Epos.y + halfW);
  //legs
  //front legs
  line(Epos.x - halfW,Epos.y + halfW,Epos.x - halfW*1.5,Epos.y + halfW * 1.3);
  line(Epos.x + halfW ,Epos.y + halfW,Epos.x + halfW * 1.5,Epos.y + halfW * 1.3);
  //mid legs
  line(Epos.x - halfW * 0.5,Epos.y + halfW * 0.5,Epos.x - halfW,Epos.y + halfW * 0.1 );
  line(Epos.x + halfW * 0.5,Epos.y + halfW * 0.5,Epos.x + halfW,Epos.y + halfW * 0.1 );
  //back legs
  line(Epos.x - halfW * 0.25,Epos.y + halfW * 0.25,Epos.x - halfW * 0.5,Epos.y - halfW * 0.25);
  line(Epos.x + halfW * 0.25,Epos.y + halfW * 0.25,Epos.x + halfW * 0.5,Epos.y - halfW * 0.25);
  //fangs
  fill(225,0,0);
  triangle(Epos.x - halfW * 0.5,Epos.y + halfW,Epos.x - halfW * 0.3,Epos.y + halfW * 1.5,Epos.x - halfW * 0.1,Epos.y + halfW);
  triangle(Epos.x + halfW * 0.5,Epos.y + halfW,Epos.x + halfW * 0.3,Epos.y + halfW * 1.5,Epos.x + halfW * 0.1,Epos.y + halfW);
}

void move()
{
  if ( ! alive)return;
  
  if(frameCount %60 == 0)
  {
    Epos.x += random(-50,50);
    Epos.y += 20;
   
  }
  if(Epos.x < margin)
  {
    Epos.x = margin;
  }
  if(Epos.x + Ew >= width - margin)
  {
    Epos.x = width - margin;
  }
  
  if(Epos.y >= height)
  {
    lives -= 1;
     alive = false;
   
  }
  
}



}


