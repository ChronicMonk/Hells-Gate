class Enemy4
{
  PVector Epos;
  PVector Emove;
  float Ew;
  int lives;
  boolean alive = false;
  
  Enemy1 drop = new Enemy1();
    
 Enemy4()
 {
  this(width/2,height/2,100);
  alive = false;
  lives = 100;
  }
  
  Enemy4(float x, float y , float w)
  {
     this.Ew = w;
     Epos = new PVector(x,y);
     Emove = new PVector();
     this.alive = true;
     lives = 100;
  }
  

  
  void display()
  {
    float halfW = Ew * 0.5;
    
    if(!alive)return;
    
    stroke(random(0,255),random(0,255),random(0,255));
    //body/ass
     fill(86,0,62);
    triangle(Epos.x,Epos.y,Epos.x - halfW,Epos.y + halfW,Epos.x + halfW,Epos.y + halfW);
    rect(Epos.x - Ew,Epos.y + halfW,Ew *2,halfW);
    //front legs
    //forearm
    line(Epos.x - Ew,Epos.y + halfW * 2.5,Epos.x - halfW * 1.5,Epos.y + halfW * 3.5);
     line(Epos.x + Ew,Epos.y + halfW * 2.5,Epos.x + halfW * 1.5,Epos.y + halfW * 3.5);
      line(Epos.x - halfW,Epos.y + halfW * 2,Epos.x - halfW * 0.5,Epos.y + halfW * 2.5);
      //stroke(0,255,255);
     line(Epos.x + halfW,Epos.y + halfW * 2,Epos.x + halfW * 0.5,Epos.y + halfW * 2.5);
     //shoulder
      line(Epos.x + halfW,Epos.y + halfW * 2,Epos.x + Ew,Epos.y + halfW * 2.5);
       line(Epos.x - halfW,Epos.y + halfW * 2,Epos.x - Ew,Epos.y + halfW * 2.5);
   //mid legs
    line(Epos.x - halfW * 0.5,Epos.y + halfW * 0.5,Epos.x - halfW,Epos.y + halfW * 0.1 );
    line(Epos.x + halfW * 0.5,Epos.y + halfW * 0.5,Epos.x + halfW,Epos.y + halfW * 0.1 );

     //back legs
    line(Epos.x - halfW * 0.25,Epos.y + halfW * 0.25,Epos.x - halfW * 0.5,Epos.y - halfW * 0.25);
    line(Epos.x + halfW * 0.25,Epos.y + halfW * 0.25,Epos.x + halfW * 0.5,Epos.y - halfW * 0.25);
    //fangs
      fill(random(150,255),random(150,255),0);
  triangle(Epos.x - halfW * 0.5,Epos.y + halfW *2,Epos.x - halfW * 0.3,Epos.y + halfW * 2.5,Epos.x - halfW * 0.1,Epos.y + halfW * 2);
  triangle(Epos.x + halfW * 0.5,Epos.y + halfW * 2,Epos.x + halfW * 0.3,Epos.y + halfW * 2.5,Epos.x + halfW * 0.1,Epos.y + halfW * 2);
  //eyefangs
  
    fill(random(150,255),random(150,255),0);
    triangle(Epos.x - halfW * 0.5,Epos.y + halfW,Epos.x - halfW * 0.3,Epos.y + halfW * 1.5,Epos.x - halfW * 0.1,Epos.y - halfW);
    triangle(Epos.x + halfW * 0.5,Epos.y + halfW,Epos.x + halfW * 0.3,Epos.y + halfW * 1.5,Epos.x + halfW * 0.1,Epos.y - halfW);
    
  }

  void move()
  {
    if(!alive)return;
    
    if(drop.alive)
     {
       
       if(drop.Epos.y <= height/2)
       {  
         drop.Epos.y +=2.5;
       }
       else
       {
         enemy1.add(drop);
         drop = new Enemy1();
       }
       drop.display();
     }
    
     
    if(random(-100,100) >= 98.5)
    {
    fire();
    }
     if(Epos.y >= height/2)
      {
        Epos.y += 2.5;
      }
    else{
    if(frameCount %20 == 0)
    
      {
     
      
      Epos.x += random(-25,25);

      }
     
    }
    if(Epos.x < margin*2)
    {
      Epos.x = margin*2;
    }
    if(Epos.x + Ew >= width - margin*2)
    {
      Epos.x = width - margin*2;
    }
    
  }

  void fire()
  {
    println("dropping");
    enemy1.add(drop);
    drop = new Enemy1(Epos.x,Epos.y,20);
  }


}
