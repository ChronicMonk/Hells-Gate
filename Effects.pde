class Effect 
{
  float EFw = 40;
  PVector EFpos;
  boolean active;
  
    Effect()
    {
      EFpos = new PVector(0,0);
      active = false;
    }
    
    Effect(PVector _pos)
    {
      EFpos = _pos;
      active = true;
    }
    void display(){}
}

class Explosion extends Effect
{

  float i = 0;
    
  Explosion(){super();}
  
  Explosion(PVector _pos)
  {
    super(_pos);
    EFw = 80;
    i = 0;
  }
  
  void display()
  {
    if(active)
    if(frameCount%2 == 0)
    {
      println("DRAWING");
       fill(150,150,150);
       ellipse(EFpos.x,EFpos.y,EFw*i,EFw*i);
       fill(0,0,0);
       ellipse(EFpos.x,EFpos.y,EFw*i/1.25,EFw*i/1.25);
       i+=0.1;
       //fix
       if(i>1.0)
       {
       active = false;if(random(0,1000) > 975)bullets.add(new powerUpHP(EFpos,70));
     else if(random(0,1000) > 900)bullets.add(new powerUpTC(EFpos,70));
   else if(random(0,1000) > 995)bullets.add(new powerUpCH(EFpos,70));
 else if(random(0,1000) > 950)bullets.add(new powerUpSP(EFpos,70));
       } 
    }
    
    if(chaining)
    {
      for(Enemy1 e:enemy1)
      {
        if(e.alive)
        if( ((e.Epos.x - EFpos.x)*(e.Epos.x - EFpos.x)) + ((e.Epos.y - EFpos.y)*(e.Epos.y - EFpos.y))  <= (e.Ew+EFw*i)*(e.Ew+EFw*i)/5 )
        {
          e.alive = false;
            //effects.add(new Explosion(new PVector(e.Epos.x,e.Epos.y + e.Ew/3)));
          this.active = false;
          Score += 5;
        }
        
      }
      
      for(Enemy2 e:enemy2)
      {
        if(e.alive)
        if( ((e.Epos.x - EFpos.x)*(e.Epos.x - EFpos.x)) + ((e.Epos.y - EFpos.y)*(e.Epos.y - EFpos.y))  <= (e.Ew+EFw*i)*(e.Ew+EFw*i)/5 )
        {
          e.alive = false;
            //effects.add(new Explosion(new PVector(e.Epos.x,e.Epos.y + e.Ew/3)));
          this.active = false;
          Score += 10;
        }
        
      }
        for(Enemy3 e:enemy3)
      {
        if(e.alive)
        if( ((e.Epos.x - EFpos.x)*(e.Epos.x - EFpos.x)) + ((e.Epos.y - EFpos.y)*(e.Epos.y - EFpos.y))  <= (e.Ew+EFw*i)*(e.Ew+EFw*i)/4 )
        {
          e.alive = false;
            //effects.add(new Explosion(new PVector(e.Epos.x,e.Epos.y + e.Ew/3)));
          this.active = false;
          Score += 25;
        }
        
      }
        Enemy4 e = Boss;
        if(e.alive)
          if( ((e.Epos.x - EFpos.x)*(e.Epos.x - EFpos.x)) + ((e.Epos.y - EFpos.y)*(e.Epos.y - EFpos.y))  <= (e.Ew+EFw*i)*(e.Ew+EFw*i)/4 )
          {
            e.lives -= 1;
            ///effects.add(new Explosion(new PVector(EFpos.x,EFpos.y + e.Ew/4)));
            //effects.get(effects.size()-1).EFw /= 2;
            this.active = false;
            if(e.lives <= 0)
            {
             e.alive = false;
            //effects.add(new Explosion(new PVector(e.Epos.x,e.Epos.y + e.Ew/4)));
            //effects.get(effects.size()-1).EFw *= 2;
            
            Score += 50;
            }
          }
    }
    
  }
}
