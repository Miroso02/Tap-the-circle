
void setup()
{
  size(displayWidth,displayHeight);
  c1=width/c;
  q1=height/q;
  smooth(8);
  for(byte i=0; i<4; i++)
  wave[i]=new LegendaryWave(0,0,0,0,color(0,0,0));
  rect=new VanilinoviyKub(1480*c1,900*q1,color(random(70,255), random(70,255), random(70,255)),r0*(c1+q1)/2);
  
  DS=new Slider("DS=",350*c1,140*q1,300*c1);
  CS=new Slider("CS=",350*c1,243*q1,300*c1);
  
  ExitYes=   new Button("Yes"       ,20*(c1+q1),color(0), width/2-230*c1, 310*q1, 110*c1, 70*q1,5*(c1+q1), color(255,0,0));
  ExitNo=    new Button("No"        ,20*(c1+q1),color(0), width/2+120*c1, 310*q1, 110*c1, 70*q1,5*(c1+q1), color(255,0,0));
  
  Play=      new Button("Play"      ,30*(c1+q1),color(0), 95*c1, 125*q1,  185*c1, 85*q1,  15*(c1+q1),      color(255,0,0));
  Options=   new Button("Options"   ,25*(c1+q1),color(0), 95*c1, 250*q1,  185*c1, 85*q1,  15*(c1+q1),      color(255,0,0));
  Exit=      new Button("Exit"      ,30*(c1+q1),color(0), 95*c1, 375*q1,  185*c1, 85*q1,  15*(c1+q1),      color(255,0,0));
  
  PlayOk=    new Button("Ok"        ,20*(c1+q1),color(0),   550*c1,350*q1,110*c1, 80*q1,0,  color(0,0,255));
  HighScores=new Button("HighScores",20*(c1+q1),color(0),   width-300, 0, 300,       60,0,  color(255));
  PlayOkMenu=new Button("Menu"      ,40,        color(255), 90,        10,873*c1,    60,0,  color(0,0,255));
  Pause=     new Button("II"        ,0 ,        color(0),   10,        10,60,        60,0,  color(0,0,255));
  ExitSave=  new Button("Back"      ,40,        color(0),   width-300,height-200,120,80,100,color(255,255,0));
  
  swipe=new UnbelivableDestroyerSwipe(width/2,height/2,830,300,200,200,color(100,100,130));
  words[0]="Well Done!";
  words[1]="Good!";
  words[2]="Great!";
  words[3]="Wonderful!";
  words[4]="Amazing!";
  words[5]="Incredible!";
  words[6]="Unstopable!";
   try
    {
      tapSound=false;
      snd2 = new MediaPlayer();
      AssetFileDescriptor fd2 = assets.openFd("tap.bin");
      snd2.setDataSource(fd2.getFileDescriptor(), fd2.getStartOffset(), fd2.getLength());
      snd2.setAudioStreamType(3);
      snd2.setVolume(0,vol);
      snd2.prepare();
    }
    catch(IOException e)
    {
      tapSound=false;
    }
    catch(java.lang.NullPointerException e)
    {
      tapSound=false;
    }
    try
      {
        snd = new MediaPlayer();
        AssetManager assets = getAssets();
        AssetFileDescriptor fd = assets.openFd("mainMenu.wav");
        snd.setDataSource(fd.getFileDescriptor(), fd.getStartOffset(), fd.getLength());
        snd.setAudioStreamType(3);
        snd.setVolume(0,vol);
        snd.prepare();
        snd.setLooping(true);
      }
      catch(IOException e)
      {
      }
  for (byte o=0; o<ellipse.length; o++)
  {
    ellipse[o]= new Ellipse(xe, ye, color(random(255), random(255), random(255)), w, 1);
    w+=3;
    xe=random(400, 1050)*c1;
    ye=random(100, 550)*q1;
  }
  Scores.loadScores();
  orientation(LANDSCAPE);
}
void draw()
{
  if(i>125)i=0;
  
  
  if (menu)
  {
    
    if(mus)
    {
      mus=false;
      snd.start();
    }
    rand=int(random(0, 3600));
    background(20); 
    for(byte gv=0;gv<ellipse.length;gv++)
    {
      ellipse[gv].display();
      w++;
    }
    if (!pac)
    {
      if (rand==100)
      {
        xp=0;
        pac=true;
      }
    }
   else 
   {
      fill(255, 255, 0);
      xp+=5;
      p1-=pd;
      p2+=pd;
      if (p1>=QUARTER_PI)pd=0.05;
      if (p1<=0)pd=-0.05;
      arc(xp, height/2, width/2, width/2, p1, p2);
    }
    if (xp>1400)
    {
      pac=false;
      wasp=true;
    }
    if (wasp)tp++;
    if (tp==60)
    {
      tp=0;
      xp=0;
      wasp=false;
    }
    if (!met)
    {
      if (rand<3)
      {
        met=true;
        xR=int(random(0, 800)*c1);
        yR=0;
      }
    }
    else
    {
      d  =int(random(10, 40));
      d1 =int(random(10, 40));
      xr =int(random(xR-150, xR+25));
      yr =int(random(yR-150, yR+25));
      xr1=int(random(xR-150, xR+25));
      yr1=int(random(yR-150, yR+25));
      fill(255, 255, 0);
      ellipse(xr, yr, d, d);
      ellipse(xr1, yr1, d1, d1);
      fill(200, 150, 0);
      ellipse(xR, yR, 80, 80);
      xR+=20;
      yR+=20;
    }
    if (yR>600*q1)met=false;
    fill(255, 255, 0);
    rect(50*c1, 100*q1, 280*c1, 400*q1, 15*(c1+q1));

    Play.display();
    Options.display();
    Exit.display();
    HighScores.display();
    
    if (!diff)t2++;
    else
    {
      t1++;
      
      fill(255, 255, 0);
      rect(330*c1, 100*q1, 340*c1, 350*q1, 15*(c1+q1));
      
      DS.display();

      CS.display();
      
      PlayOk.display();
     
      m1=byte((DS.k-50)/10);
      if(CS.k<=180)m2=byte((CS.k-30)/20);
      nn=m1+m2;
      fill(0);
      textSize(45*(c1+q1));
      text("Z="+nn,441*c1,380*q1);
      
        if(PlayOk.pressed())
        {
          mousePressed=false;
          backCode=5;
          play=true;
          PlayOk.c=color(0,0,255);
          menu=false;
          deltad=DS.k*(c1+q1)/10240;      
          deltad-=DS.k*(c1+q1)/2560000;               
          r0=(300-CS.k)*(c1+q1)/2;
          circle=new Circle(width/2, height/2, r0*(c1+q1)/2, color(255, 255, 255));
          r=r0;
          iw=0;
          i=0;
          iinc=false;
          tapSound=false;
          wave_[1]=false;
          wave_[2]=false;
          wave_[3]=false;
          wave_[0]=false;
        }
    }
   if(Play.pressed() || backCode==1 && keyCode==4)
      {
        if (t2>=15)
        {
          backCode=1;
          diff=true;
          x1=430*c1;
          x2=430*c1;
          t1=0;
          t2=0;
        }
        if (t1>=15)
        {
          backCode=0;
          diff=false;
          t1=0;
          t2=0;
        }
      }
     if(Options.pressed())
      {
        backCode=2;
        fill(255, 255, 0);
        rect(330*c1, 100*q1, 340*c1, 400*q1, 15*(c1+q1));
      }
    if(HighScores.pressed())
      {
        backCode=3;
        as=true;
        play=false;
        menu=false;
      } 
    if(Exit.pressed())
      {
        Scores.saveScores();
        AYS=true;
      }
   if(AYS==true)
   {
     backCode=0;
     fill(255,230,0);
     rect(275*c1,200*q1,550*c1,200*q1,15*(c1+q1));
     fill(0);
     textSize(20*(c1+q1));
     textAlign(CENTER,CENTER);
     text("Are you sure?\nYou really want to quit?",width/2,250*q1);
     ExitYes.display();
     ExitNo.display();
     if(ExitNo.pressed() || backCode==0 && keyCode==4)
     AYS=false;
   }
    fill(255);
    textAlign(CENTER);
    textSize(40*(c1+q1));
    text("Tap the circle", width/2, 80*q1);
  }
  else  if(play)      ///////////menu==false
  {
    float dist=dist(circle.x, circle.y, mouseX, mouseY);
    background(50);
    Pause.display();
    strokeWeight(1);
    fill(255);
    rect(25,20,7,40);
    rect(45,20,7,40);
      if(start)
      {
        backCode=6;
        if(Pause.pressed()|| backCode==6 && keyCode==4)
        {
          paused=true;
          start=false;
        }
        else
        {
          iinc=false;
          i=0;
          if(paused)
          {
            Scores.saveScores();
            start=true;
            paused=false;
            wasPause=true;
          }
        }
      }
      else if(i<10)mousePressed=false;
    if(paused || !start)
    {
      iinc=true;
      backCode=4;
      if(nn<10)PlayOkMenu.w=900*c1;
      else PlayOkMenu.w =865*c1;
      
      if(points>=10)  PlayOkMenu.w -=35*c1;
      if(points>=100) PlayOkMenu.w -=35*c1;
      if(points>=1000)PlayOkMenu.w -=35*c1;
      
      PlayOkMenu.display();
      
    diff=false;
    if (PlayOkMenu.pressed() || backCode==4 && keyCode==4 && i>10)
    {
      i=0;
      backCode=0;
      menu=true;
      start=false;
      circle.x=width/2;
      circle.y=height/2;
      circle.h=r0*(c1+q1)/2;
      kub=false;
      sww=false;
      circT=true;
      paused=false;
      clicks=0;
      r=r0;
      combo=0;
      plus=1;
      yourScore=points*nn;
      points=0;
    }
  }
    fill(co);
    textSize(30*(c1+q1));
    textAlign(RIGHT);
    text(points+"x"+nn,1090*c1,50*q1);
    textAlign(LEFT);
    text(combo,10*c1,590*q1);
 if (r<=0)
      {
        circT=true;
        start=false;
        circle.h=r0*(c1+q1)/2;
        circle.x=width/2;
        circle.y=height/2;
        r=r0;
        combo=0;
        clicks=0;
        plus=1;
        yourScore=points*nn;
        points=0;
        sww=false;
        Scores.saveHighScore(yourScore);
        mus=true;
        snd.pause();
      }
      else  
    {
      if (!start)
      {
        if(!paused)
        {
        backCode=4;
        textSize(50*(c1+q1));
        textAlign(CENTER);
        text("Your score: " + yourScore , width/2, 550*q1);
        deltaR=1;
        mus=true;
        snd.pause();
        }
      }
      if (minusPoint)
      {
        if(!paused)
        {
        if (points>0)
          {
        points-=plus;
        combo=0;
        plus=1;
        doing=false;
        }
        }
        minusPoint=false;
      }
      //////////
      if(wave_[1])
      {
        wave[1].display(true);
        if(wave[1].op<=0)wave_[1]=false;
      }
      if(wave_[0])
      {
        wave[0].display(true);
        if( wave[0].op<=0)
        {
          iw=0;
          wave_[0]=false;
        }
      }
      if(wave_[2])
      {
        wave[2].display(true);
        if(wave[2].op<=0)wave_[2]=false;
      }
      if(wave_[3])
      {
        wave[3].display(true);
        if(wave[3].op<=0)wave_[3]=false;
      }
        if(wave_Kub)
        {
          waveKub.display(false);
          if( waveKub.op<=0)wave_Kub=false;
        }
        if(waveS)
        {
          waveS1.display(true);
          waveS2.display(true);
        if( waveS1.op<=0)waveS=false;
        }
      
      if (red(co)>0 || green(co)>0)n++;
      if (red(co)==0 && green(co)==0 && blue(co)==0)co=color(red(co),255,blue(co));
      if (n==20)
      {
        co=color(255,255,255);
        n=0;
      }
 if(!tt)
  {
  rt=byte(random(0,2));
  if(combo==50)
  {
  tt=true;
  plus=2;
  textT=words[rt];
  textM=true;
  oppText=255;
  }
 else if(combo==150)
  {
  tt=true;
  plus=3;
  textT=words[rt+2];
  textM=true;
  oppText=255;
  }
 else if(combo==500)
  {
  tt=true;
  plus=5;
  textT=words[rt+4];
  textM=true;
  oppText=255;
  }
 else if(combo==2500)
  {
  tt=true;
  plus=25;
  textT=words[6];
  textM=true;
  oppText=255;
  }
  }
  if(textM)
  {
    fill(0,255,0,oppText);
    textSize(50*(c1+q1));
    textAlign(CENTER);
    text(textT,width/2,height/2);
    if(oppText>0)oppText-=10;
    else textM=false;
  }
  if(combo!=50 && combo!=150 && combo!=500 && combo!=2500)
  tt=false;
  
  if( (clicks-1)%10==0)
  kub=true;
  
  if(rect.w>1)rect.display();
  rect.w-=deltaR*2;
  if(rect.hit(true))
  {
    if(!wasPause)
    {
    combo++;
    points+=2*plus;
    clicks++;
    wave_Kub=true;
    waveKub=new LegendaryWave(int(rect.x),int(rect.y),int(rect.w),255,rect.c);
    }
    rect.x=2000*c1;
    doing=false;
    wasPause=false;
  }
      if(clicks%10==0 && clicks>=20 && kub)
      {
        rect.x=int(random(r0*(c1+q1)/4,width-r0*(c1+q1)/4 ));
        rect.y=int(random(r0*(c1+q1)/4,height-r0*(c1+q1)/4 ));
        rect.w= r0*(c1+q1)/2;
        kub=false;
      }
      if(sww)
      {
        if(st)
        {
          swipe._new();
          st=false;
          }
          if(start && !paused)
          {
          swipe.decrease();
          swipe.tap();
          swipe.swipe();
          }
          swipe.display();
      }
      if((clicks-5)%10<=0 && clicks>=45)
      {
      if(!sww)
        sww=true;
        circT=false;
      }
        else
        circT=true;
        if(circT)
        {
          if(start)
          {
            r-=deltaR;
            circle = new Circle(x0, y0, r, color(ci));
          }
          st=true;
      if (mousePressed && doing )
      {
        if( dist<circle.h/2)
        {
         wave_[iw]=true;
          wave[iw]=new LegendaryWave(circle.x,circle.y,int(r),255,circle.c);
          doing=false;
          iw++;
          x0=int(random(r0*(c1+q1)/2 , width-r0*(c1+q1)/2));
          y0=int(random(r0*(c1+q1)/2 , height-r0*(c1+q1)/2) ); 
          ci=color(random(70,255),random(70,255),random(70,255));
          r=r0*(c1+q1)/2;
          start=true;
          deltaR+=deltad;
//          snd2.start();
       if(!wasPause)
       {
         combo++;
         points+=plus;
         clicks++;
       }
          co=color(0,green(co),0);
          start=true;
         }  
          else
          {
          if(!wasPause && circT)
            minusPoint=true;
          }
          doing=false;
          wasPause=false;
          if( mouseX<20 || mouseX>60 || mouseY<60 || mouseY>90)
          {
          co=color(red(co),0,0);
          }
        }
       circle.display();
      }
       ///
    }
  }
else if(as)
{
        background(255);
        textSize(45);
        text("#",100,50);
        text("Score",400,50);
        text("Date",700,50); 
        for(byte g=0; g<10; g++)
        {
          Scores.display(g,100,50*(g+2));
        }
        //if(mousePressed && mouseX>width/2 && mouseY>height/2 || keyCode==4)  // выход
        if (ExitSave.pressed())
        {
          menu=true;
        }
}

  if (!mousePressed)
  doing=true;
  if(keyCode==4)
  keyCode=0;
  if(iinc)
  i++;
  
}
//boolean drag=false;
void mouseDragged()
{
  //drag=true;
  mousePressed= (mouseX>50*c1 && mouseX<330*c1 && mouseY>100*q1 && mouseY<500*q1 && menu) ? false : true ;
}
void mouseReleased()
{
  if(menu && AYS && mouseX>ExitYes.x && mouseX<ExitYes.x+ExitYes.w && mouseY<ExitYes.y+ExitYes.h && mouseY>ExitYes.y)
  exit();
}
public void onStop()
 {
   paused=true;
   start=false;
   snd.pause();
   mus=true;
  Scores.saveScores();
  super.onStop();
  }
void onDestroy()
{
  Scores.saveScores();
  super.onDestroy();
}
void onBackPressed()
{
  
}