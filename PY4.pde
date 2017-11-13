ArrayList<Female> f;
ArrayList<Male> m;
ArrayList<Haibao> h;
ArrayList<Xianhe> x;

long lTm;
float tintHue=0;

void setup(){
  size(1080,768,P3D);
  
  colorMode(HSB);
  
  imageMode(CENTER);
  
  minim = new Minim(this);

  loadFiles();
  
  f = new ArrayList<Female>();
  m = new ArrayList<Male>();
  h = new ArrayList<Haibao>();
  x = new ArrayList<Xianhe>();
  
  for(int j=0;j<6;j++){
    for(int i=0;i<15;i++){
      jts[j][i] = new PVector();
    }
  }
  
  context = new SimpleOpenNI(this);
  if(context.isInit() == false)
  {
     println("Can't init SimpleOpenNI, maybe the camera is not connected!"); 
     exit();
     return;  
  }
  
  context.enableDepth();
  context.enableUser();
}

void draw(){
  tint((30+tintHue)%256,115,225);
  image(bg,width/2,height/2,width,height);
  noTint();
  
  context.update();
  
  int[] userList = context.getUsers();
  for(int i=0;i<userList.length;i++)
  {
     if(context.isTrackingSkeleton(userList[i])){
        updateData(userList[i]);
     }
  }
  
  image(boat1,b1X,height*0.8,240*0.5,159*0.5);
  image(boat2,b2X,height*0.68,236*0.5,157*0.5);
  image(bird,bX,height*0.4,662*0.5,396*0.5);
  
  if(b1Flag){
    b1X+=b1Stp;
    if(b1X<width*0.5)b1Stp*=-1;
    if(b1X>=width*0.7){
      b1X=width*0.7;
      b1Stp*=-1;
      b1Flag=false;
      b1.pause();
    }
  }
  
  if(b2Flag){
    b2X+=b2Stp;
    if(b2X>width*0.5)b2Stp*=-1;
    if(b2X<=width*0.3){
      b2X=width*0.3;
      b2Stp*=-1;
      b2Flag=false;
      b2.pause();
    }
  }
  
  if(bFlag){
    bX+=bStp;
    if(bX<-width*0.1){
      bX = width*1.1;
    }
    if(abs(bX-width*0.7)<abs(bStp)){
      bX=width*0.7;
      bFlag=false;
      birds.pause();
    }
  }
  
  tintHue=255;
  
  for(int i=0; i<f.size(); i++){
    tintHue+=map(f.get(i).X,0,width,-20,20);
    f.get(i).display();
    if(!heFlag & f.get(i).X>width*0.65){
      heFlag = true;
      lotus.rewind();
      lotus.loop();
    }
    if(!b1Flag & f.get(i).X>width*0.67 & f.get(i).X<width*0.73){
      b1Flag = true;
      b1.rewind();
      b1.loop();
    }
    if(!b2Flag & f.get(i).X>width*0.27 & f.get(i).X<width*0.33){
      b2Flag = true;
      b2.rewind();
      b2.loop();
    }
    if(!bFlag & f.get(i).X>width*0.47 & f.get(i).X<width*0.53){
      bFlag = true;
      birds.rewind();
      birds.loop();
    }
    if(!liuFlag & f.get(i).X>width*0.18 & f.get(i).X<width*0.25){
      liuFlag = true;
      lTm = millis();
      willow.rewind();
      willow.loop();
    }
  }
  
  for(int i=0; i<m.size(); i++){
    tintHue+=map(m.get(i).X,0,width,-20,20);
    m.get(i).display();
    if(!heFlag & m.get(i).X>width*0.65){
      heFlag = true;
      lotus.rewind();
      lotus.loop();
    }
    if(!b1Flag & m.get(i).X>width*0.67 & m.get(i).X<width*0.73){
      b1Flag = true;
      b1.rewind();
      b1.loop();
    }
    if(!b2Flag & m.get(i).X>width*0.27 & m.get(i).X<width*0.33){
      b2Flag = true;
      b2.rewind();
      b2.loop();
    }
    if(!bFlag & m.get(i).X>width*0.47 & m.get(i).X<width*0.53){
      bFlag = true;
      birds.rewind();
      birds.loop();
    }
    if(!liuFlag & m.get(i).X>width*0.18 & m.get(i).X<width*0.25){
      liuFlag = true;
      lTm = millis();
      willow.rewind();
      willow.loop();
    }
  }
  
  for(int i=0; i<h.size(); i++){
    tintHue+=map(h.get(i).X,0,width,-20,20);
    h.get(i).display();
    if(!heFlag & h.get(i).X>width*0.65){
      heFlag = true;
      lotus.rewind();
      lotus.loop();
    }
    if(!b1Flag & h.get(i).X>width*0.67 & h.get(i).X<width*0.73){
      b1Flag = true;
      b1.rewind();
      b1.loop();
    }
    if(!b2Flag & h.get(i).X>width*0.27 & h.get(i).X<width*0.33){
      b2Flag = true;
      b2.rewind();
      b2.loop();
    }
    if(!bFlag & h.get(i).X>width*0.47 & h.get(i).X<width*0.53){
      bFlag = true;
      birds.rewind();
      birds.loop();
      
    } 
    if(!liuFlag & h.get(i).X>width*0.18 & h.get(i).X<width*0.25){
      liuFlag = true;
      lTm = millis();
      willow.rewind();
      willow.loop();
    }
  }
  
  for(int i=0; i<x.size(); i++){
    tintHue+=map(x.get(i).X,0,width,-20,20);
    x.get(i).display();
    if(!heFlag & x.get(i).X>width*0.65){
      heFlag = true;
      lotus.rewind();
      lotus.loop();
    }
    if(!b1Flag & x.get(i).X>width*0.67 & x.get(i).X<width*0.73){
      b1Flag = true;
      b1.rewind();
      b1.loop();
    }
    if(!b2Flag & x.get(i).X>width*0.27 & x.get(i).X<width*0.33){
      b2Flag = true;
      b2.rewind();
      b2.loop();
    }
    if(!bFlag & x.get(i).X>width*0.47 & x.get(i).X<width*0.53){
      bFlag = true;
      birds.rewind();
      birds.loop();
    }
    if(!liuFlag & x.get(i).X>width*0.18 & x.get(i).X<width*0.25){
      liuFlag = true;
      lTm = millis();
      willow.rewind();
      willow.loop();
    }
  }
  
  
  if(heFlag){
    tint(255,heAlp);
    image(he,width/2,heY,width,height);
    noTint();
      
    if(heY>height*0.5)heY-=1;
    
    if(abs(heY-height*0.5)<5)heAlp--;
    if(heAlp<=0){
      heFlag=false;
      lotus.pause();
      heY = height*0.7;
      heAlp = 255;
    }
  }
    
  if(liuFlag){
    image(liu[liuID],width/2,height/2,width,height);
    if(frameCount%liuSp==0){
      liuID++;
      if(liuID>4)liuID=0;
    }
    if(millis()-lTm>3000)liuFlag=false;
  }else{
    image(liu[0],width/2,height/2,width,height);
  }
}
