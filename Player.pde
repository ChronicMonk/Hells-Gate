class Player
{
  
  boolean locked = false;
  float lock;
  PVector Ppos;
  PVector Pmove;
  float Pw;
  boolean alive = true;

  Player()
  {
  this(width/2,height/2,40);
  }
  
  Player(boolean L,float l)
  {
    lock = l;
    locked = L;
    this.Pw = 40;
    Ppos = new PVector(width/2,lock);
    Pmove = new PVector();
    
  }
  
  Player(float x, float y , float w)
  { 
   this.Pw = w;
   Ppos = new PVector(x,y);
   Pmove = new PVector();
  }

    
  //these are methods on the class
  void display()
  {
    stroke(0,255,0);
    //println(Ppos.x,Ppos.y);
    float halfW = Pw * 0.5f;
   
stroke(0,255,0);
    line(Ppos.x,Ppos.y, Ppos.x - halfW,Ppos.y + halfW);
    line(Ppos.x - halfW,Ppos.y + halfW,Ppos.x,Ppos.y - halfW);
    line(Ppos.x,Ppos.y - halfW,Ppos.x + halfW,Ppos.y + halfW);
    line(Ppos.x,Ppos.y, Ppos.x + halfW,Ppos.y + halfW);
    if(twinCannon == true && frameCount % 4 == 0)
    {
      fill(255,0,0);
    }
    else if(speeding == true && frameCount % 4 == 0)
    {
      fill(0,0,255);
    }
    else if(chaining == true && frameCount % 4 == 0)
    {
      fill(150,150,0);
    }
    else{
    fill(100,150,250);
    }
    triangle(Ppos.x,Ppos.y,Ppos.x - halfW,Ppos.y + halfW,Ppos.x,Ppos.y - halfW);
    if(chaining == true && frameCount % 4 == 0)
    {
      fill(150,150,0);
    }
    else if(speeding == true && frameCount % 4 == 0)
    {
      fill(0,0,255);
    }
    else if(twinCannon == true && frameCount % 4 == 0)
    {
      fill(255,0,0);
    }
    else{
    fill(100,150,250);
    }
    triangle(Ppos.x,Ppos.y,Ppos.x + halfW,Ppos.y + halfW,Ppos.x,Ppos.y - halfW);
  }
  void move()
  {
    if(keyPressed)
    {
   
      if(keyCode == LEFT)
      {
        Pmove.y = 0;
        if(speeding)
        Pmove.x = -7;
        else
        Pmove.x = -5;
      }
       if(keyCode == RIGHT)
      {
        Pmove.y = 0;
        if(speeding)
        Pmove.x = 7;
        else
        Pmove.x = 5;
      }
      
    }
    println(this.Pmove,Pmove);
    Ppos.add(this.Pmove);
    if(Ppos.x < margin)
      Ppos.x = margin;
      
       if(Ppos.x > width - margin)
      Ppos.x = width -margin;
      
    
    Pmove.mult(0.9);
  
  if(locked){Ppos.y = lock;}
 }
 //accessors
    PVector getPosition()
    {
      return this.Ppos;
    }
    PVector getMove()
    {
      return this.Pmove;
    }   
     void detectCollision()
    {
      for(Enemy1 e:enemy1)
      {
      
        if(e.alive)
        if( ((e.Epos.x - Ppos.x)*(e.Epos.x - Ppos.x)) + ((e.Epos.y - Ppos.y)*(e.Epos.y - Ppos.y))  <= (e.Ew+Pw)*(e.Ew+Pw) )
        {
          e.alive = false;
          
          lives -= 1;
        }
        
        
      }
      for(Enemy2 e:enemy2)
      {
      
        if(e.alive)
        if( ((e.Epos.x - Ppos.x)*(e.Epos.x - Ppos.x)) + ((e.Epos.y - Ppos.y)*(e.Epos.y - Ppos.y))  <= (e.Ew+Pw)*(e.Ew+Pw) )
        {
          e.alive = false;
          
          lives -= 1;
        }
        
        
      }
      for(Enemy3 e:enemy3)
      {
      
        if(e.alive)
        if( ((e.Epos.x - Ppos.x)*(e.Epos.x - Ppos.x)) + ((e.Epos.y - Ppos.y)*(e.Epos.y - Ppos.y))  <= (e.Ew+Pw)*(e.Ew+Pw) )
        {
          e.alive = false;
          
          lives -= 1;
        }
        
        
      }
    }
}


