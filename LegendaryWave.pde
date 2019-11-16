class LegendaryWave
{
  int x,y,w,op;
  color c;
  LegendaryWave(int xx,int yy,int ww,int dibil,color cc)
  {
    x=xx;
    y=yy;
    w=ww;
    op=dibil;
    c=cc;
  }
  void display(boolean cj)
  {
    strokeWeight(1.3);
    stroke(c,op);
    fill(0,0);
    if(cj)
    {
    ellipse(x,y,w,w);
    if(!paused)
    w+=10;
    }
    else 
    {
    rectMode(CENTER);
    rect(x,y,w,w);
    rectMode(CORNER);
    if(!paused)
    w+=10;
    }
    if(!paused)
    {
    if(op>=3)
    op-=6;
    }
  }
}