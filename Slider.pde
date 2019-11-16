class Slider  // |—————[]——| //
{
  String str;
  int k=100;
  float x, y, w, startX;
  Slider(String strr, float xx, float yy, float ww)
  {
    str=strr;
    x=xx;
    y=yy;
    w=ww; 
    startX=w/3+x-20;
  }
  void display()
  {
    if( mouseX>=x && mouseX<=x+w+10 && mouseY>y && mouseY<y+50*q1 )
    k=int(((mouseX-x)*300/w)/20)*10+50;
    fill(255,0,0);
    rect(x,y,w,30*q1);
    fill(120);
    rect(startX,y-15*q1,40*c1,60*q1,5*(c1+q1));
    textAlign(LEFT);
    fill(0);
    textSize(15*(c1+q1));
    text(str+k+"%",x,y+67*q1);
    if(mousePressed && mouseX>x && mouseX<x+w && mouseY>y && mouseY<y+50*q1 )
    {
    startX=mouseX-20*c1;
    }
  }
}