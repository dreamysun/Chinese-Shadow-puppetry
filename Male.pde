class Male{
  float X,Y;
  float aH,aAL,aAR,aB,aLL,aLR;
  int id;
  
  Male(int _id){
    id = _id;
    X = map(jts[id][1].x,0,width,width*0.1,width*0.9);
    Y = height*random(0.65,0.75);
  }
  
  void update(){
    X = map(jts[id][1].x,0,width,width*0.1,width*0.9);
    aB = constrain(map(hds[id][0],-PI,0,-0.6,0.6),-0.6,0.6);
    aH = constrain(map(hds[id][1],-PI,0,-0.6,0.6),-0.6,0.6);
    aAL = constrain(map(hds[id][2],-0.3,PI-0.3,-0.6,0.6),-0.6,0.6);
    aAR = constrain(map(hds[id][3],0.3,PI+0.3,-0.6,0.6),-0.6,0.6);
    aLL = constrain(map(hds[id][4],PI*0.6-1,PI*0.6+1,-0.6,0.6),-0.6,0.6);
    aLR = constrain(map(hds[id][5],PI*0.4-1,PI*0.4+1,-0.6,0.6),-0.6,0.6);
  }
  
  void display(){
    update();
    
    pushMatrix();
    translate(X,Y);
    rotate(aB);
        pushMatrix();
        translate(-width*0.009,-height*0.18);
        rotate(aH);
           image(mHead,0,0,250,313);  // 5/16 of the pic size
        popMatrix();
        
        pushMatrix();
        translate(-width*0.017,-height*0.145);
        rotate(aAL);
           image(mArmL,0,0,250,313);
        popMatrix();
       
    image(mBody,0,0,250,313);
        
        pushMatrix();
        translate(-width*0.017,-height*0.145);
        rotate(aAR);
          image(mArmR,0,0,275,313);
        popMatrix();
    
        pushMatrix();
        translate(-width*0.017,height*0.07);
        rotate(aLL);
          image(mLegL,0,0,250,313);
        popMatrix();
        
        pushMatrix();
        translate(width*0.02,height*0.063);
        rotate(aLR);
           image(mLegR,0,0,250,313);
        popMatrix();
    
    popMatrix();
  }
}
