import ddf.minim.*;
Minim minim;
AudioPlayer birds,b1,b2,bob,crane,lotus,willow,male,female;
PImage bg;
PImage fArmL,fArmR,fBody,fHead,fLegL,fLegR;
PImage mArmL,mArmR,mBody,mHead,mLegL,mLegR;
PImage hArmL,hArmR,hHead,hLegL,hLegR;
PImage xBody,xHead,xLegL,xLegR;
PImage boat1,boat2;
PImage bird;
PImage he;
PImage[] liu;
boolean liuFlag = false;
int liuID = 0;
int liuSp = 10;

boolean bFlag = false;
float bX;
float bStp = -2.5;

boolean b1Flag = false;
boolean b2Flag = false;
float b1X,b2X;
float b1Stp = -1;
float b2Stp = 0.7;

boolean heFlag = false;
float heY;
float heAlp = 255;

void loadFiles(){
  birds = minim.loadFile("bird.mp3");
  b1 = minim.loadFile("boat1.mp3");
  b2 = minim.loadFile("boat2.mp3");
  bob = minim.loadFile("bob.mp3"); 
  crane = minim.loadFile("crane.mp3");
  lotus = minim.loadFile("lotus.mp3");
  willow = minim.loadFile("willow.mp3");
  male = minim.loadFile("male.mp3"); 
  female = minim.loadFile("female.mp3");
  birds.pause();
  b1.pause();
  b2.pause();
  bob.pause();
  crane.pause();
  lotus.pause();
  willow.pause();
  male.pause();
  female.pause();
  
  bg = loadImage("bg.png");
  fArmL = loadImage("fArmL.png");
  fArmR = loadImage("fArmR.png");
  fBody = loadImage("fBody.png");
  fHead = loadImage("fHead.png");
  fLegL = loadImage("fLegL.png");
  fLegR = loadImage("fLegR.png");
  
  mArmL = loadImage("mArmL.png");
  mArmR = loadImage("mArmR.png");
  mBody = loadImage("mBody.png");
  mHead = loadImage("mHead.png");
  mLegL = loadImage("mLegL.png");
  mLegR = loadImage("mLegR.png");
  
  hArmL = loadImage("hArmL.png");
  hArmR = loadImage("hArmR.png");
  hHead = loadImage("hHead.png");
  hLegL = loadImage("hLegL.png");
  hLegR = loadImage("hLegR.png");
  
  xBody = loadImage("xBody.png");
  xHead = loadImage("xHead.png");
  xLegL = loadImage("xLegL.png");
  xLegR = loadImage("xLegR.png");
  
  boat1 = loadImage("boat1.png");
  boat2 = loadImage("boat2.png");
  bird = loadImage("bird.png");
  he = loadImage("he.png");
  
  liu = new PImage[5];
  for(int i=0; i<5; i++){
    String s = "liu/c" +(i+1)+ ".png";
    liu[i] = loadImage(s);
  }
  
  heY = height*0.7;
  b1X = width*0.7;
  b2X = width*0.3;
  bX = width*0.7;
}
