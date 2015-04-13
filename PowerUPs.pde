class powerUpHP extends Bullet
{

  powerUpHP(PVector _pos,float _w)
  {
  
    super(_pos,_w);
    this.active = true;
  
  }
  void move()
    {
      if(this.active)
      {
      this.Bpos.y += 2;
      
      }
    }
     void display()
    {
      if(this.active)
      {
        //println("draw",Bpos.x,Bpos.y);
        float halfW = Bw * 0.5;
        fill(0,250,0);
        stroke(100,150,100);
        rect(Bpos.x,Bpos.y,halfW/2,halfW/2);    
      }
    }
    
    void detectCollision()
    {
      
        if(p.alive)
        if( ((p.Ppos.x - Bpos.x)*(p.Ppos.x - Bpos.x)) + ((p.Ppos.y - Bpos.y)*(p.Ppos.y - Bpos.y))  <= (p.Pw+Bw)*(p.Pw+Bw)/6 )
        {
         
          this.active = false;
          if(lives >= 5)
          {
            Score += 20;
          }
          else
          {
            lives += 1;
          }
        }
        
      
    }

}

class powerUpTC extends Bullet
{

  powerUpTC(PVector _pos,float _w)
  {
  
    super(_pos,_w);
    this.active = true;
  
  }
  void move()
    {
      if(this.active)
      {
      this.Bpos.y += 2;
      
      }
    }
     void display()
    {
      if(this.active)
      {
        //println("draw",Bpos.x,Bpos.y);
        float halfW = Bw * 0.5;
        
        fill(250,0,0);
        stroke(150,100,100);
        rect(Bpos.x,Bpos.y,halfW/2,halfW/2);    
      }
    }
    
    void detectCollision()
    {
      
        if(p.alive)
        if( ((p.Ppos.x - Bpos.x)*(p.Ppos.x - Bpos.x)) + ((p.Ppos.y - Bpos.y)*(p.Ppos.y - Bpos.y))  <= (p.Pw+Bw)*(p.Pw+Bw)/6 )
        {
         
          this.active = false;
          TCC = 0;
          twinCannon = true;
        }
        
      
    }

}

class powerUpSP extends Bullet
{

  powerUpSP(PVector _pos,float _w)
  {
  
    super(_pos,_w);
    this.active = true;
  
  }
  void move()
    {
      if(this.active)
      {
      this.Bpos.y += 2;
      
      }
    }
     void display()
    {
      if(this.active)
      {
        //println("draw",Bpos.x,Bpos.y);
        float halfW = Bw * 0.5;
        
        fill(0,0,150);
        stroke(100,100,150);
        rect(Bpos.x,Bpos.y,halfW/2,halfW/2);    
      }
    }
    
    void detectCollision()
    {
      
        if(p.alive)
        if( ((p.Ppos.x - Bpos.x)*(p.Ppos.x - Bpos.x)) + ((p.Ppos.y - Bpos.y)*(p.Ppos.y - Bpos.y))  <= (p.Pw+Bw)*(p.Pw+Bw)/6 )
        {
         
          this.active = false;
          SPC = 0;
          speeding = true;
        }
        
      
    }

}

class powerUpCH extends Bullet
{

  powerUpCH(PVector _pos,float _w)
  {
  
    super(_pos,_w);
    this.active = true;
  
  }
  void move()
    {
      if(this.active)
      {
      this.Bpos.y += 2;
      
      }
    }
     void display()
    {
      if(this.active)
      {
        //println("draw",Bpos.x,Bpos.y);
        float halfW = Bw * 0.5;
        
        fill(250,250,0);
        stroke(150,150,100);
        rect(Bpos.x,Bpos.y,halfW/2,halfW/2);    
      }
    }
    
    void detectCollision()
    {
      
        if(p.alive)
        if( ((p.Ppos.x - Bpos.x)*(p.Ppos.x - Bpos.x)) + ((p.Ppos.y - Bpos.y)*(p.Ppos.y - Bpos.y))  <= (p.Pw+Bw)*(p.Pw+Bw)/6 )
        {
         
          this.active = false;
          CHC = 0;
          chaining = true;
        }
        
      
    }

}
