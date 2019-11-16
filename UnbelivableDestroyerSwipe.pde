class UnbelivableDestroyerSwipe
{
  int x,y,x1,y1;
  float r2,r1, dist1, dist2;
  color c;
  UnbelivableDestroyerSwipe(int xx,int yy,int x11,int y11, float rr,float r11,color cc)
  {
    x=xx;
    y=yy;
    x1=x11;
    y1=y11;
    r2=rr;
    r1=r11;
    c=cc;
  }
  void display()
  {
    dist1=dist(x, y, mouseX, mouseY);
    dist2=dist(x1, y1, mouseX, mouseY);
    fill(c);
    if(tap())
    {
    stroke(255);
    strokeWeight(5);
    line(x,y,mouseX,mouseY);
    stroke(0);
    strokeWeight(1);
    ellipse(x1,y1,r1,r1);
    fill(255);
    ellipse(x1,y1,0.5*r1,0.5*r1); //rs1
    fill(c);
    ellipse(x1,y1,0.3*r1,0.3*r1); //rs1
    fill(255);
    ellipse(x1,y1,0.1*r1,0.1*r1);
    }
    stroke(0);
    fill(c);
    strokeWeight(1);
    ellipse(x,y,r2,r2);
    fill(255);
    ellipse(x,y,0.5*r2,0.5*r2);  //rs
    fill(c);
    ellipse(x,y,0.3*r2,0.3*r2);  //rs
    fill(255);
    ellipse(x,y,0.1*r2,0.1*r2);
  }
  boolean tap()
  {
    boolean res=false;
    if(mousePressed)
    {
      if(doing)
      {
   //   if(dist1<r2/2)
      if(mouseX>x-r2/2 && mouseX<x+r2/2 && mouseY>y-r2/2 && mouseY<y+r2/2)
      {
      pufpuf=true;
      }
      else
      minusPoint=true;
      doing=false;
      }
    }
    if(!mousePressed)
    pufpuf=false;
        if(pufpuf)
    res=true;
      return res;
  }
  boolean swipe()
  {
    boolean res=false;
    if(tap())
    {
     // if(dist2<r1/2)
      if( mouseX>x1-r1/2 && mouseX<x1+r2/2 && mouseY>y1-r1/2 && mouseY<y1+r1/2)
      {
      sww=false;
      res=true;
      points+=plus*3;
      waveS=true;
      clicks++;
      waveS1=new LegendaryWave(x,y,int(r2),255,c);
      waveS2=new LegendaryWave(x1,y1,int(r1),255, c);
      combo+=2;
      co=color(0,green(co),0);
      }
    }
    return res;
  }
  void _new()
  {
      rs=r0*(c1+q1)/50;
      rs1=r0*(c1+q1)/50;
      r2=r0*(c1+q1)/2;
      r1=r0*(c1+q1)/2;
      x=int(random(100,1000)*c1);
      y=int(random(100,500)*q1);
      x1=int(random(100,1000)*c1);
      y1=int(random(100,500)*q1);
      while(dist(x,y,x1,y1)<r2*2+40)
      {
      x=int(random(100,1000)*c1);
      y=int(random(100,500)*q1);
      x1=int(random(100,1000)*c1);
      y1=int(random(100,500)*q1);
      }
      c=color(int(random(70,255)),int(random(70,255)),int(random(70,255)));
      pufpuf=false;
  }
  void decrease()
  {
    if(!tap())
    {
      if(r2>0 && rs1>0)
      {
        r2-=deltaR;
        rs-=deltaR/25;
      }
    }
    else
    {
      if(r1>0 && rs1>0)
      {
    r1-=deltaR;
    rs1-=deltaR/25;
    }
    }
    if(r1<=0 ||r2<=0)
    {
    combo=0;
    clicks=0;
    r=0;
    r1=1;
    r2=1;
    plus=1;
    }
  }
}