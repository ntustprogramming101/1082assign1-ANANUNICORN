PImage bgImg;
  PImage groundhogImg;
  PImage lifeImg;
  PImage robotImg;
  PImage soilImg;
  PImage soldierImg;
  
  int x, y;//size CENTER
  
  int soldierX;
  int soldierXspeed;
  int soldierWidth;
  float soldierY;
  
  float robotX;
  float robotY;
  
  float laserX,laserX1,robotHand;
  float laserXSpeed;
  
void setup() {
  size(640, 480, P2D);
  x = 320;
  y = 240;
  soldierX = 0;
  soldierXspeed = 2;
  soldierWidth = 80;
  soldierY = random(160,480);
  robotX = random(160,640-80);
  robotY = random(160,480);
  laserX1 = robotX;
  laserX = 0; //amount
  robotHand = 0;
  laserXSpeed = 2;
  
  bgImg = loadImage("img/bg.jpg");
  groundhogImg = loadImage("img/groundhog.png");
  lifeImg = loadImage("img/life.png");
  soilImg = loadImage("img/soil.png");
  soldierImg = loadImage("img/soldier.png");
  robotImg = loadImage("img/robot.png");
}

void draw() {
   imageMode(CENTER);
   image(bgImg,x,y);

   //sun
   fill(253,184,19);
   stroke(255,255,0);
   strokeWeight(5);
   ellipse(x+270,y-190,120,120);

   //grass
   fill(124,204,05);
   noStroke();
   rectMode(CENTER);
   rect(x,y-80,640,30);
   
   //soil
   image(soilImg,x,y+80);
   
   //groundhog
   image(groundhogImg,x,y-120);
   
   //life
   image(lifeImg,40,35);
   image(lifeImg,110,35);
   image(lifeImg,180,35);
   
   //soldier
   soldierX = soldierX + soldierXspeed;
   soldierX = soldierX %(640+soldierWidth);
   if (soldierY<240) {soldierY = 160;}
   else if (soldierY<320){soldierY = 240;}
   else if (soldierY<400){soldierY = 320;}
   else if (soldierY<480){soldierY = 400;}
   image(soldierImg,soldierX++,soldierY+40);
   
   //robot
   if (robotY<240) {robotY = 160;}
   else if (robotY<320){robotY = 240;}
   else if (robotY<400){robotY = 320;}
   else if (robotY<480){robotY = 400;}
   image(robotImg,robotX,robotY+40);
   
   //laser
   if(laserX > 145 - 14.5)
   {
     laserX = 0;
     robotHand = 0;
   }
   
   stroke(255,0,0);
   strokeWeight(10);
   
   if(robotHand < 40) // grow
   {
     line(laserX1 - robotHand - 14.5 ,robotY+37,laserX1 - 14.5 ,robotY+37);
    robotHand += laserXSpeed;
   }
   else // move
   {
     laserX += laserXSpeed;
    line(laserX1 - laserX - robotHand - 14.5 ,robotY+37,laserX1 - laserX - robotHand + 40 - 14.5, robotY+37);
   } 
}
