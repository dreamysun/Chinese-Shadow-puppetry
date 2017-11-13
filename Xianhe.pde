class Xianhe{
  float X,Y;
  float aB,aH,aLL,aLR;
  float sc;
  int id;
  
  Xianhe(int _id){
    id = _id;
    X = map(jts[id][1].x,0,width,width*0.1,width*0.9);
    Y = height*random(0.65,0.8);
    sc = 0.25;
  }
  
  void update(){
    X = map(jts[id][1].x,0,width,width*0.1,width*0.9);
    aB = constrain(map(hds[id][0],-PI,0,-0.6,0.6),-0.6,0.6);
    aH = constrain(map(hds[id][1],-PI,0,-0.6,0.6),-0.6,0.6);
    aLL = constrain(map(hds[id][4],PI*0.6-1,PI*0.6+1,-0.6,0.6),-0.6,0.6);
    aLR = constrain(map(hds[id][5],PI*0.4-1,PI*0.4+1,-0.6,0.6),-0.6,0.6);
  }
  
  void display(){
    update();
    
    pushMatrix();
    translate(X,Y);
    rotate(aB);
    
        pushMatrix();
        translate(width*0.015,-height*0.04);
        rotate(aH);
          image(xHead,0,0,800*sc,1000*sc);
        popMatrix();
    
        pushMatrix();
        translate(-width*0.0125,height*0.028);
        rotate(aLL);
          image(xLegL,0,0,800*sc,1000*sc);
        popMatrix();
        
        pushMatrix();
        translate(-width*0.005,height*0.028);
        rotate(aLR);
           image(xLegR,0,0,800*sc,1000*sc);
        popMatrix();
        
    image(xBody,0,0,800*sc,1000*sc);
    

    popMatrix();
  }
}
