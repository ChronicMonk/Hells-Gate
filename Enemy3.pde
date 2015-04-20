class Enemy3
{
  PVector Epos;
  PVector Emove;
  float Ew;
  boolean alive = true;
  
 Enemy3()
 {

  this(width/2,height/2,100);
  }
  
  Enemy3(float x, float y , float w)
  {
     this.Ew = w;
     Epos = new PVector(x,y);
     Emove = new PVector();
     this.alive = true;
  }
  

  
  void display()
  {
    float halfW = Ew * 0.5;
    
    if(!alive)return;
    
    stroke(100,200,0);
    //body
    fill(40,1,71);
    triangle(Epos.x,Epos.y,Epos.x + halfW,Epos.y + halfW,Epos.x - halfW,Epos.y + halfW);
    //wings
    fill(71,135,0);
    triangle(Epos.x - halfW,Epos.y,Epos.x - halfW,Epos.y + halfW,Epos.x,Epos.y + halfW);
    triangle(Epos.x + halfW,Epos.y,Epos.x + halfW,Epos.y + halfW,Epos.x,Epos.y + halfW);
    //Beak
    fill(85,5,125);
    triangle(Epos.x,Epos.y + halfW * 2,Epos.x - halfW,Epos.y + halfW,Epos.x + halfW,Epos.y + halfW);
    fill(71,135,0);
     triangle(Epos.x,Epos.y + halfW * 1.5,Epos.x - halfW * 0.75,Epos.y + halfW,Epos.x + halfW * 0.75,Epos.y + halfW);
   
    //mid legs
    line(Epos.x - halfW * 0.5,Epos.y + halfW * 0.5,Epos.x - halfW,Epos.y + halfW * 0.1 );
    line(Epos.x + halfW * 0.5,Epos.y + halfW * 0.5,Epos.x + halfW,Epos.y + halfW * 0.1 );
    //back legs
    line(Epos.x - halfW * 0.25,Epos.y + halfW * 0.25,Epos.x - halfW * 0.5,Epos.y - halfW * 0.25);
    line(Epos.x + halfW * 0.25,Epos.y + halfW * 0.25,Epos.x + halfW * 0.5,Epos.y - halfW * 0.25);
   /*  
    fill(100,150,0);
    triangle(Epos.x,Epos.y + halfW * 0.3,Epos.x - halfW * 0.8,Epos.y + halfW * 0.8,Epos.x + halfW * 0.8,Epos.y + halfW * 0.8);
   
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
    fill(random(150,255),random(150,255),0);
    triangle(Epos.x - halfW * 0.5,Epos.y + halfW,Epos.x - halfW * 0.3,Epos.y + halfW * 1.5,Epos.x - halfW * 0.1,Epos.y + halfW);
    triangle(Epos.x + halfW * 0.5,Epos.y + halfW,Epos.x + halfW * 0.3,Epos.y + halfW * 1.5,Epos.x + halfW * 0.1,Epos.y + halfW);
  */}

  void move()
  {
    if(!alive)return;
    
    //if(random(-100,100) >= 99)
   // {
     //fire();
   // }
     if(Epos.y >= height/2)
      {
        Epos.y += 2.5;
      }
    else{
    if(frameCount %40 == 0)
    
      {
     
      
      Epos.x += random(-50,50);
      Epos.y += 7;
      }
     
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
      Score -= 10;
      alive = false;
    }
  }

}


  
 


