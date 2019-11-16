class Button
{
  float x,y,w,h,l,Size;
  color c, string;
  String str;
  Button(String strng, float size, color std, float xx,float yy,float ww,float hh,float ll,color cc)
  {
    str=strng;
    Size=size;
    string=std;
    x=xx;
    y=yy;
    w=ww;
    h=hh;
    l=ll;
    c=cc;
  }
  void display()
  {
    fill(c);
    rect(x,y,w,h,l);
    fill(string);
    textSize(Size);
    textAlign(CENTER,CENTER);
    text(str,x+w/2,y+h/2);
  }
  boolean pressed()
  {
    boolean res=false;
    if(mouseX>=x && mouseX<=x+w && mouseY>y && mouseY<=y+h && mousePressed)
    {
    c=color(red(c),110,blue(c));
    res=true;
    }
    else
    {
    c=color(red(c),0,blue(c));
    res=false;
    }
    return res;
  }
}