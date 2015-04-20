  



//ArrayList enemyCollection;

//values
int bulletMAX = 10;
int enemyMAX = 40;
int enemyCurrent = 4;
float margin = 25.0;
int gamestate = 0;
int Score = 0;
int lives = 3;

//twinCannon
boolean twinCannon = false;
float TCT = 500;//length of powerup
float TCC = 0;//timer
//firing timer
boolean fired = false;
float FT = 25;//Firing delay
float FC = 0;//timer
//missile powerup
boolean chaining = false;
float CHT = 400;//length of powerup
float CHC = 0;//timer
//speed puwerup
boolean speeding = false;
float SPT = 500;
float SPC = 0;

PFont font;


  Player p;
  //create arrayLists (temp arraylists are used for garbage collection) 
  ArrayList<Enemy1> temp1;
  ArrayList<Enemy1> enemy1 = new ArrayList<Enemy1>();
  ArrayList<Enemy2> temp2;
  ArrayList<Enemy2> enemy2 = new ArrayList<Enemy2>();
  ArrayList<Enemy3> temp3;
  ArrayList<Enemy3> enemy3 = new ArrayList<Enemy3>();
  Enemy4 Boss = new Enemy4();
  ArrayList<Effect> tempFX;
  ArrayList<Effect> effects = new ArrayList<Effect>();
  ArrayList<Bullet> tempB;
  ArrayList<Bullet> bullets = new ArrayList<Bullet>();

void setup()
{  
  ;
  size(600,600);
  background(0);
  
  p = new Player(width/2,height - margin,40);

  load(enemyCurrent);
  
}







  void draw ()
  {
    randomSeed(frameCount);
    if(twinCannon == true)
  {
  TCC++; if(TCC >= TCT)
    {
TCC = 0;twinCannon = false;
    }
  }
    if(chaining == true)
  {
  CHC++; if(CHC >= CHT)
    {
CHC = 0;chaining = false;
    }
  }
    if(fired == true)
    {
      FC++;
      if(speeding)
      {
        if(FC >= FT/2)
        {
          FC = 0;fired = false;
        }
      }
      else
      {
        if(FC >= FT)
        {
          FC = 0;fired = false;
        }
      }
    }
    if(speeding == true)
  {
  SPC++; if(SPC >= SPT)
    {
SPC = 0;speeding = false;
    }
  }
    if(gamestate == 0)
       {
        startScreen();
   
       }
    
   if(gamestate == 1)
       {
          
        gameplay();
        
       }
       
       if(lives <= 0)
       {
         GameOver();
       }
       
       if(gamestate == 3)
       {
         GameWin();
       }
  }
  
  
  
  void startScreen()
  {
    //asthetics
    background(255,0,0);
    
     font = loadFont("Chiller-Regular-48.vlw");
     fill(0);
     textFont(font,180);
     text("Hells Gate",width* 0.1,height * 0.3);
     textFont(font,80);
     text("Press any key to play",width * 0.1,height * 0.6);
     textFont(font,50);
        text(" Press Left & Right arrow keys to move",width * 0.1,height * 0.8);
         text(" Press Space to fire",width * 0.1,height * 0.9);
     
    //input
    if(keyPressed )
   {
     gamestate = 1;  
    }
  }
  
  void gameplay()
  {
  //scene 
  background(8,0,31);
  stroke(0);
  //moon
  fill(150,150,150);
  ellipse(width/2,height,width*2,height/2);
  //craters
  fill(75,75,75);
  ellipse(width/2.5,height*0.85,width/4,height/8);
  fill(75,75,75);
  ellipse(width/1.3,height*0.83,width/8,height/18);
  fill(75,75,75);
  ellipse(width/8,height*0.94,width/18,height/30);
  
  
  
  
  font = loadFont("Chiller-Regular-48.vlw");
  textFont(font,30);
  fill(0,255,0);
  text("score:" + Score,0,height * 0.9);
  text("objects:" + (enemy1.size()+enemy2.size()+enemy3.size()+bullets.size()+ effects.size() + 1),0,height * 0.8);
  //text("boss:" + Boss.lives,0,height * 0.7);
  text("Lives:" + lives,0,height);
   
   
  boolean newLevel = true;//detect if all enemies are dead
  
  temp1 = new ArrayList<Enemy1>();//empty temp list
  for(Enemy1 e:enemy1)
  {
    if(e.alive)
    {
      newLevel = false;
      temp1.add(e);//fill temp list with living enemies
    }
    e.move();
    e.display();
  }
  enemy1 = temp1;//replace list of all enemies with list of living enemies
  //the same method of garbage collection is used for all enemies, bullets & effects except the boss!
  
  
  temp2 = new ArrayList<Enemy2>();
  for(Enemy2 e:enemy2)
 {
    if(e.alive)
  {
  newLevel = false;temp2.add(e);
  }
    e.move();
    e.display();
  }
  enemy2 = temp2;
  temp3 = new ArrayList<Enemy3>();
  for(Enemy3 e:enemy3)
    {
    if(e.alive)
      {
  newLevel = false;temp3.add(e);
        }
    e.move();
    e.display();
    }
  enemy3 = temp3;
  if(Boss.alive)
  {
    newLevel = false;
    Boss.move();
    Boss.display();
  }
  tempFX = new ArrayList<Effect>();
  for(Effect e:effects)
  {
    e.display();
    if(e.active)
    {
      tempFX.add(e);
    }
  }
  effects = tempFX;
  
  if(newLevel)
  {
    //if all enemies are dead create a new level
   // println("LVLUP");
  //enemy1 = new ArrayList<Enemy1>();
  //enemy2 = new ArrayList<Enemy2>();
  //enemy3 = new ArrayList<Enemy3>();
  
  if(enemyCurrent > enemyMAX)
  enemyCurrent = enemyMAX;
  load(enemyCurrent);
  enemyCurrent += 3;
  }
  
  
  tempB = new ArrayList<Bullet>();
  for(Bullet b:bullets)
  {
    if(b.Bpos.y < 0||b.Bpos.y > height) b.active = false;//removes bullets if they leave the screen
    if(b.active)
    {
      tempB.add(b);
      b.detectCollision();//collision detection is done on the bullets
    }
    b.move();
    b.display();
  }
  bullets = tempB;
    
  p.move();
  p.display();
   if(p.alive)
    {
      p.detectCollision();//collision detection is done on the player
    }
  
}

void load(int enemyCount)
{ //load next level
  enemy1 = new ArrayList<Enemy1>();//clear enemy lists
  enemy2 = new ArrayList<Enemy2>();
  enemy3 = new ArrayList<Enemy3>();
  Boss = new Enemy4();
  //effects = new ArrayList<Effect>();
  //bullets = new ArrayList<Bullet>();
  //temp2 = new Enemy2(width/2,height/2 - margin*2,50);
  //temp3 = new Enemy3(width/2,height/2 - margin*2,30);
   //temp4 = new Enemy4(width/2, margin*2,80);
  for(int i = 0;i < enemyCount; i++)
  {
    //algorithm for level generation
    // positions are random
    // enemy composition is not
    //
    //---------------------------------
    //|load(n) for levels looks like  |
    //|-------------------------------|
    //| n  | enemies                  |
    //|----|--------------------------|
    //| 01 | E1: 01 -        -        |
    //| 02 | E1: 02 -        -        |
    //| 03 | E1: 03 -        -        |
    //| 04 | E1: 04 -        -        |
    //| 05 | E1: 04 - E2: 02 -        |
    //| 06 | E1: 05 - E2: 02 -        |
    //| 07 | E1: 05 - E2: 00 - E3: 03 |
    //| 08 | E1: 06 - E2: 00 - E3: 03 |
    //| 09 | E1: 07 - E2: 00 - E3: 03 |
    //| 10 | E1: 07 - E2: 02 - E3: 03 |
    //| 11 | E1: 08 - E2: 02 - E3: 03 |
    //| 12 | E1: 09 - E2: 02 - E3: 03 |
    //| 13 | E1: 10 - E2: 02 - E3: 03 |
    //| 14 | E1: 10 - E2: 02 - E3: 06 |
    //| 15 | E1: 10 - E2: 04 - E3: 06 |
    //| 16 | E1: 11 - E2: 04 - E3: 06 |
    //| 17 | E1: 12 - E2: 04 - E3: 06 |
    //| 18 | E1: 13 - E2: 04 - E3: 06 |
    //| 19 | E1: 14 - E2: 04 - E3: 06 |
    //| 20 | E1: 14 - E2: 06 - E3: 06 |
    //| 21 | E1: 14 - E2: 06 - E3: 09 |
    //| 22 | E1: 15 - E2: 06 - E3: 09 |
    //| 23 | E1: 16 - E2: 06 - E3: 09 |
    //| 24 | E1: 17 - E2: 06 - E3: 09 |
    //| 25 | E1: 17 - E2: 08 - E3: 09 |
    //| 26 | E1: 18 - E2: 08 - E3: 09 |
    //| 27 | E1: 19 - E2: 08 - E3: 09 |
    //| 28 | E1: 19 - E2: 08 - E3: 12 |
    //| 29 | E1: 20 - E2: 08 - E3: 12 |
    //| 30 | E1: 20 - E2: 10 - E3: 12 |
    //---------------------------------
        
    
    
    if(((float)i)%7 == 0.0&&i>=7)
    {
                if(i < 10)
                enemy2 = new ArrayList<Enemy2>();
                enemy3.add(new Enemy3(random(margin,width-margin),random(margin,height/2 - margin*3),20));
                enemy3.add(new Enemy3(random(margin,width-margin),random(margin,height/2 - margin*3),20));
                enemy3.add(new Enemy3(random(margin,width-margin),random(margin,height/2 - margin*3),20));
              }
    else if(((float)i)%5 == 0.0&&i>=5)
              {
                enemy2.add(new Enemy2(random(margin,width-margin),random(margin,height/2 - margin*2),40));
                enemy2.add(new Enemy2(random(margin,width-margin),random(margin,height/2 - margin*2),40));
              }
    else        {enemy1.add(new Enemy1(random(margin,width-margin),random(margin,height/2 - margin*2),30));println("gg/ngg\ngg/ngg");}
    
    if(i >= 25){Boss  = new Enemy4(width/2,margin*2,100);}
    
  }

}


void keyPressed()
{
   
    if(key == ' '&&!fired)
    {
      fired = true;
      println("fire");
      if(twinCannon)
      {
        bullets.add(new Bullet(new PVector(p.getPosition().x + 5,p.getPosition().y),40));
        bullets.get(bullets.size() - 1).active = true;
        bullets.add(new Bullet(new PVector(p.getPosition().x - 5,p.getPosition().y),40));
        bullets.get(bullets.size() - 1).active = true;
      }
      else
      {
        bullets.add(new Bullet(new PVector(p.getPosition().x,p.getPosition().y),40));
        bullets.get(bullets.size() - 1).active = true;
      }
    }
  
}

void GameOver()
{
  background(0);
  font = loadFont("Chiller-Regular-48.vlw");
     fill(255,0,0);
     textFont(font,120);
     text("Game Over!",width * 0.2,height * 0.2);
     textFont(font,60);
     text("Press T to try again",width * 0.3, height * 0.4);
     text("Press Q to quit",width * 0.3,height * 0.6);
     
    if (key == 't' || key == 'T')
    {
      gamestate = 1;
     // gameplay();
       
      enemyCurrent = (int)random(2,5);
      load(enemyCurrent);
      Score = 0;
      lives = 3;
    }
    else if(key ==  'q' || key == 'Q')
    {
      gamestate = 0;
      exit();
     // startScreen();
    }
  
}

void GameWin()
{
   background(0);
  font = loadFont("Chiller-Regular-48.vlw");
     fill(255,0,0);
     textFont(font,120);
     text("You Win!",width * 0.25,height * 0.2);
     textFont(font,80);
      text("Your Score:" + Score,width * 0.1, height * 0.4);
      textFont(font,60);
     text("Press T to try again",width * 0.3, height * 0.6);
     text("Press Q to quit",width * 0.3,height * 0.7);
     
    if (key == 't' || key == 'T')
    {
      gamestate = 1;
     // gameplay();
       
      enemyCurrent = (int)random(2,5);
      load(enemyCurrent);
      Score = 0;
      lives = 3;
    }
    else if(key ==  'q' || key == 'Q')
    {
      gamestate = 0;
      exit();
   
    }
}
//}



