import android.media.*;
import java.io.IOException;
import android.content.res.AssetManager;
import android.content.res.AssetFileDescriptor;
import android.content.Context;
MediaPlayer snd, snd2;
AssetFileDescriptor fd, fd2;
AssetManager assets;
boolean menu=true, diff=false, play=false;
boolean as=false,AYS=false;
byte i=0,iw=0;
boolean iinc=false,tapSound=false;
int x0=550, y0=300, xR, yR=0, xr, yr, rand, d, xr1, yr1, d1, xp, tp;
int points=0;
byte rt,plus=1,m1,m2;
int n=0, w=0 ,nn=4 ;
float x1=500,x2=500,r0;
int clicks=0;
float c=1100, q=600, c1, q1;
String[] words=new String[7];
String textT;
int combo,oppText=0;
color ci,co=color(255,255,0);
int t1=0, t2=100;
float deltaR=0, xe=500, ye=300, deltad, r=200, p1=QUARTER_PI, p2=TWO_PI-QUARTER_PI, pd, waveW=0 ;
int yourScore=0;
Ellipse[] ellipse = new Ellipse[40];
boolean minusPoint=false, start=false, doing=true, met=false, pac=false, wasp=false;
boolean kub=false,textM=false;
boolean tt=false,paused=false,wasPause=false;
boolean[] wave_= new boolean[4];
Circle circle;
VanilinoviyKub rect;
UnbelivableDestroyerSwipe swipe;
boolean pufpuf=true,circT=false,sww=false,st=false,wave_Kub=false,waveS=false;
boolean help=false;
float rs=8,rs1=8;
Slider DS, CS; //уровень сложности
float vol=1;
boolean mus=true;
byte backCode=0;
Save Scores=new Save();
Button Play, Options, Exit, PlayOk, PlayOkMenu, Pause, HighScores, ExitYes, ExitNo, ExitSave;
LegendaryWave waveKub,waveS1,waveS2 ;
LegendaryWave[] wave=new LegendaryWave[4];