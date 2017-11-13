import SimpleOpenNI.*;

SimpleOpenNI  context;
color[]       userClr = new color[]{ color(255,0,0),
                                     color(0,255,0),
                                     color(0,0,255),
                                     color(255,255,0),
                                     color(255,0,255),
                                     color(0,255,255)};                               
PVector[][] jts = new PVector[6][15];
float[][] hds = new float[6][6];  //headings

void updateData(int userId){  
  for(int i=0;i<15;i++){
    context.getJointPositionSkeleton(userId,i,jts[userId][i]);
    jts[userId][i].y*=-0.4;
    jts[userId][i].x*=0.5;
    jts[userId][i].add(new PVector(width/2,height/2));
    
//    fill(0);
//    ellipse(jts[userId][i].x,jts[userId][i].y,10,10);

  hds[userId][0]=PVector.sub(jts[userId][1],jts[userId][8]).heading(); //body
  hds[userId][1]=PVector.sub(jts[userId][0],jts[userId][1]).heading(); //head
  
  PVector v = PVector.sub(jts[userId][6],jts[userId][2]); 
  v.rotate(-PI*0.3);
  hds[userId][2] = v.heading();
  
  v = PVector.sub(jts[userId][7],jts[userId][3]); //.rotate(-PI*0.28)
  v.rotate(PI*0.3);
  hds[userId][3] = v.heading();
  
  hds[userId][4]=PVector.sub(jts[userId][11],jts[userId][9]).heading();  //left leg
  hds[userId][5]=PVector.sub(jts[userId][12],jts[userId][10]).heading(); //right leg
  }
}

// -----------------------------------------------------------------
// SimpleOpenNI events

void onNewUser(SimpleOpenNI curContext, int userId)
{
  println("onNewUser - userId: " + userId);
  println("\tstart tracking skeleton");
  float r = random(1);
  if(r<0.33){
    f.add(new Female(userId));
    female.rewind();
    female.loop();
  }else if(r<0.66){
    m.add(new Male(userId));
    male.rewind();
    male.loop();
  }else if(r<0.95){
    x.add(new Xianhe(userId));
    crane.rewind();
    crane.loop();
  }else{
    h.add(new Haibao(userId));
    bob.rewind();
    bob.loop();
  }
  
  curContext.startTrackingSkeleton(userId);
}

void onLostUser(SimpleOpenNI curContext, int userId)
{
  println("onLostUser - userId: " + userId);
  for(int i=0; i<f.size(); i++){
    if(f.get(i).id==userId)f.remove(i);
    female.pause();
  }
  for(int i=0; i<m.size(); i++){
    if(m.get(i).id==userId)m.remove(i);
    male.pause();
  }
  for(int i=0; i<h.size(); i++){
    if(h.get(i).id==userId)h.remove(i);
    bob.pause();
  }
  for(int i=0; i<x.size(); i++){
    if(x.get(i).id==userId)x.remove(i);
    crane.pause();
  }
}

void onVisibleUser(SimpleOpenNI curContext, int userId)
{
  //println("onVisibleUser - userId: " + userId);
} 
