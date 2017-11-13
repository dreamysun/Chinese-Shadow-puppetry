class Haibao{
  float X,Y;
  float aH,aAL,aAR,aLL,aLR;
  float sc;
  int id;
  
  Haibao(int _id){
    id = _id;
    X = map(jts[id][1].x,0,width,width*0.1,width*0.9);
    Y = height*random(0.65,0.8);
    sc = 0.25;
  }
  
  void update(){
    X = map(jts[id][1].x,0,width,width*0.1,width*0.9);
    aH = constrain(map(hds[id][1],-PI,0,-0.6,0.6),-0.6,0.6);
    aAL = constrain(map(hds[id][2],-0.3,PI-0.3,-2,0.3),-2,0.3);
    aAR = constrain(map(hds[id][3],0.3,PI+0.3,-0.6,0.6),-0.6,0.6);
    aLL = constrain(map(hds[id][4],PI*0.6-1,PI*0.6+1,-1.2,0.6),-1.2,0.6);
    aLR = constrain(map(hds[id][5],PI*0.4-1,PI*0.4+1,-0.6,0.6),-0.6,0.6);
  }
  
  void display(){
    update();
    
    pushMatrix();
    translate(X,Y);
    rotate(aH);
    
        pushMatrix();
        translate(width*0.04,height*0.01);
        rotate(aAR);
          image(hArmR,0,0,800*sc,1000*sc);
        popMatrix();
    
        pushMatrix();
        translate(-width*0.025,height*0.05);
        rotate(aLL);
          image(hLegL,0,0,591*sc,472*sc);
        popMatrix();
        
    image(hHead,0,0,800*sc,1000*sc);
    
        pushMatrix();
        translate(-width*0.03,0);
        rotate(aAL);
           image(hArmL,0,0,800*sc,1000*sc);
        popMatrix();
        
        pushMatrix();
        translate(width*0.02,height*0.063);
        rotate(aLR);
           image(hLegR,0,0,591*sc,472*sc);
        popMatrix();
    popMatrix();
  }
}
