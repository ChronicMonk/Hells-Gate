class Bullet
{
  //values
    PVector Bpos = new PVector(0,0);
    PVector Bmove;
    float Bw;
    boolean active = false;

  //constructors
     Bullet()
    {
      this.Bpos = new PVector(width/2,height/2);
      this.Bmove = new PVector();
      this.Bw = 40;
    }
    
    Bullet(PVector _Bpos, float _w)
    { 
      this.Bw = _w;
      this.Bpos = _Bpos;
      this.Bmove = new PVector(); 
    }
  
  
  //actions
    void display()
    {
      if(this.active)
      {
        //println("draw",Bpos.x,Bpos.y);
        float halfW = Bw * 0.5;
        if(chaining)halfW*=2;
        fill(0,255,0);
        stroke(100,150,250);
        rect(Bpos.x,Bpos.y,halfW/8,halfW/2);    
      }
    }
    
    void move()
    {
      if(this.active)
      {
      this.Bpos.y -= 5;
      
      }
    }
    
    void detectCollision()
    {
      for(Enemy1 e:enemy1)
      {
        if(e.alive)
        if( ((e.Epos.x - Bpos.x)*(e.Epos.x - Bpos.x)) + ((e.Epos.y - Bpos.y)*(e.Epos.y - Bpos.y))  <= (e.Ew+Bw)*(e.Ew+Bw)/5 )
        {
          e.alive = false;
          effects.add(new Explosion(new PVector(e.Epos.x,e.Epos.y + e.Ew/3)));
          if(chaining)effects.get(effects.size()-1).EFw *= 2;
          this.active = false;
          Score += 5;
        }
        
      }
      
      for(Enemy2 e:enemy2)
      {
        if(e.alive)
        if( ((e.Epos.x - Bpos.x)*(e.Epos.x - Bpos.x)) + ((e.Epos.y - Bpos.y)*(e.Epos.y - Bpos.y))  <= (e.Ew+Bw)*(e.Ew+Bw)/5 )
        {
          e.alive = false;
            effects.add(new Explosion(new PVector(e.Epos.x,e.Epos.y + e.Ew/3)));
            if(chaining)effects.get(effects.size()-1).EFw *= 2;
          this.active = false;
          Score += 10;
        }
        
      }
        for(Enemy3 e:enemy3)
      {
        if(e.alive)
        if( ((e.Epos.x - Bpos.x)*(e.Epos.x - Bpos.x)) + ((e.Epos.y - Bpos.y)*(e.Epos.y - Bpos.y))  <= (e.Ew+Bw)*(e.Ew+Bw)/5 )
        {
          e.alive = false;
            effects.add(new Explosion(new PVector(e.Epos.x,e.Epos.y + e.Ew/3)));
            if(chaining)effects.get(effects.size()-1).EFw *= 2;
          this.active = false;
          Score += 25;
        }
        
      }
        Enemy4 e = Boss;
        if(e.alive)
          if( ((e.Epos.x - Bpos.x)*(e.Epos.x - Bpos.x)) + ((e.Epos.y - Bpos.y)*(e.Epos.y - Bpos.y))  <= (e.Ew+Bw)*(e.Ew+Bw)/5 )
          {
            e.lives -= 1;
            effects.add(new Explosion(new PVector(Bpos.x,Bpos.y + e.Ew/4)));
            effects.get(effects.size()-1).EFw /= 2;
            this.active = false;
            if(e.lives <= 0)
            {
             e.alive = false;
             effects.add(new Explosion(new PVector(Bpos.x,Bpos.y + e.Ew/4)));
             effects.get(effects.size()-1).EFw *= 2;
             Score += 50;
             gamestate = 3;
            }
          }
          
    }
    
  
  
  //accessors
    PVector getPosition()
    {
      return this.Bpos;
    }
    PVector getMove()
    {
      return this.Bmove;
    }
    boolean getAc()
    {
      return active;
    }    
  //modifiers
  
  
}
    
   
class enemyBullet extends Bullet 
{
   
  enemyBullet(PVector _pos, float _w)
  {
    super(_pos,_w);
  }
 void display()
    {
      if(this.active)
      {
        //println("draw",Bpos.x,Bpos.y);
        float halfW = Bw * 0.5;
        fill(0,random(100,255),0);
        rect(Bpos.x,Bpos.y,halfW/8,halfW/2);    
      }
    }
  
  void move()
    {
      if(this.active)
      {
      this.Bpos.y += 4;
      
      }
    }
    
    void detectCollision()
    {
      
        if(p.alive)
        if( ((p.Ppos.x - Bpos.x)*(p.Ppos.x - Bpos.x)) + ((p.Ppos.y - Bpos.y)*(p.Ppos.y - Bpos.y))  <= (p.Pw+Bw)*(p.Pw+Bw)/6 )
        {
         
          this.active = false;
          lives -= 1;
        }
        
      
    }


}

  

