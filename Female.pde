class Female{
  float X,Y;
  float aH,aAL,aAR,aB,aLL,aLR;
  int id;
  
  Female(int _id){
    id = _id;
    
    X = map(jts[id][1].x,0,width,width*0.1,width*0.9);
    Y = height*random(0.55,0.65);
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
        translate(-width*0.008,-height*0.1);
        rotate(aH);
           image(fHead,0,0,236,384);  // 1/4 of the pic size
        popMatrix();
        
        pushMatrix();
        translate(-width*0.015,-height*0.08);
        rotate(aAL);
           image(fArmL,0,0,207,384);
        popMatrix();
       
    image(fBody,0,0,200,250);
        
        pushMatrix();
        translate(-width*0.015,-height*0.065);
        rotate(aAR);
          image(fArmR,0,0,384,250);
        popMatrix();
    
        pushMatrix();
        translate(-width*0.015,height*0.08);
        rotate(aLL);
          image(fLegL,0,0,200,472);
        popMatrix();
        
        pushMatrix();
        translate(width*0.004,height*0.08);
        rotate(aLR);
           image(fLegR,0,0,200,472);
        popMatrix();
    
    popMatrix();
  }
}
