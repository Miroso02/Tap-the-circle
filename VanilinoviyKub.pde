class VanilinoviyKub
{
  color c;
  float w,x=width+300*c1,y=height;
  VanilinoviyKub(float xx,float yy,color cc,float ww)
  {
    x=xx;
    y=yy;
    c=cc;
    w=ww;
  }
  boolean hit(boolean r)
  {
    if(mouseX>x-w/2 && mouseY>y-w/2 && mouseX<x+w/2 && mouseY<y+w/2 && mousePressed && doing)
    r=true;
    else 
    r=false;
    return r;
  }
  void display()
  {
    stroke(0);
    strokeWeight(0);
    fill(c);
    rectMode(CENTER);
    rect(x,y,w,w);
    rectMode(CORNER);
  }
}