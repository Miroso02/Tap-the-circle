class Circle
{
  int x;
  int y;
  float h;
  color c;
  Circle(int xx, int yy, float ww,color cc)
  {
    x=xx;
    y=yy;
    h=ww;
    c=cc;
  }
  void display()
  {
    stroke(0);
    strokeWeight(0);
    fill(c);
    ellipse(x, y, h, h);
  }
}