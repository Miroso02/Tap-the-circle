class Ellipse
{
  float x, y, r, n;
  color c;
  Ellipse(float xx, float yy,color cc, float rr, float nn)
  {
    x=xx;
    y=yy;
    c=cc;
    r=rr;
    n=nn;
  }
  void display()
  {
    fill(c);
    if(x>xp+150||x<xp-300)
    {
    ellipse(x, y, r, r);
    r=r+n;
    if (r<=1) { 
      n=1; 
      x=(random(675)+375)*c1;
      y=(random(450)+100)*q1;
      c=color(random(255),random(255),random(255));
    }
    }
    else
    r=0;
    if (r>=50*(c1+q1))
   { 
    n=-1;
    }
  }
}