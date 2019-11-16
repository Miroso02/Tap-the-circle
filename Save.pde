class Save
{
  
Table highScoreTable;
  void display(byte e, float x, float y)
  {
    background(0);
    fill(200,100,0);
    rect(x-20,y-600,x+700,y+700,100);
    ExitSave.display();
    try{
    TableRow u= highScoreTable.getRow(e);
    fill(0);
    text(u.getInt("#"),x,y);
    text(u.getInt("Score"),x+300,y);
    text(u.getString("Date"),x+600,y);
    }
    catch(java.lang.IllegalArgumentException r)
    {
    }
  }
  void loadScores()
  {
    ///////////
    try
    {
      highScoreTable=loadTable( "score.csv" ,"header");
      println("load : ok");
    }
    catch(java.lang.NullPointerException e)
    {
      e.printStackTrace();
      highScoreTable = new Table();
      
      highScoreTable.addColumn("#");
      highScoreTable.addColumn("Score");
      highScoreTable.addColumn("Date");
      
      for(int s=0; s<10; s++)
      {
        TableRow f= highScoreTable.addRow();
        f.setInt("#", s+1);
        f.setInt("Score", 0);
        f.setString("Date", "0");
      }
      println("not ok");
    } 
    while( highScoreTable.getRowCount()>10)
    {
      highScoreTable.removeRow(10);
    }
    //////////
  }
  void saveHighScore(int score)
  {
    try
    {
     for(int k=0; k<=highScoreTable.lastRowIndex(); k++)
     {
      if( score>=highScoreTable.getInt(k,"Score"))
      {
      for(int g=8; g>=k; g--)
      {
        TableRow i= highScoreTable.getRow(g),i1= highScoreTable.getRow(g+1);
        i1.setInt("Score",i.getInt("Score"));
        i1.setString("Date", i.getString("Date"));
      }
      highScoreTable.setInt(k,"Score",score);
      if(minute()<10)
      highScoreTable.setString(k,"Date", year()+"."+month()+"."+day()+" "+hour()+":"+"0"+minute());
      else
      highScoreTable.setString(k,"Date", year()+"."+month()+"."+day()+" "+hour()+":"+minute());
      break;
    }
    }
    }
    catch(java.lang.ArrayIndexOutOfBoundsException e)
    {
    }
  }
  void saveScores()
  {
    saveTable( highScoreTable, "score.csv" ); 
    print("ok");
  }
}