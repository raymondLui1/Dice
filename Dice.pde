Die first;
int play = 1;
void setup()
{
  size(500,500);
  noLoop();
  first = new Die(50,0);
}
void draw()
{
  background(0, 200, 10);
  fill(#907D0F);
  noStroke();
  beginShape();
  vertex(190, 100);
  vertex(200, 40);
  vertex(225, 40);
  vertex(225, 40);
  vertex(225, 5);
  vertex(250, 10);
  vertex(275, 5);
  vertex(275, 40);
  vertex(275, 40);
  vertex(300, 40);
  vertex(310, 100);
  endShape();
  fill(255, 255, 255);
  ellipse(250, 100, 100, 100);
  fill(0, 0, 0);
  rect(215, 70, 30, 20);
  rect(255, 70, 30, 20);
  rect(245, 75, 10, 10);
  noFill();
  stroke(0, 0, 0);
  strokeWeight(3);
  if(play == 1)
  {
    fill(255, 0, 0);
    strokeWeight(6);
    curve(200, 0, 225, 120, 275, 120, 300, 0);
    fill(0, 0, 0);
    textSize(50);
    textAlign(CENTER);
    text("CLICK TO PLAY! :D", 250, 250);
    textAlign(BASELINE);
  }
  first.show(0, 0);
  first.houseShow(0, 0);
  play++;
}
void mousePressed()
{
   redraw();
}
class Die
{
  int myX, myY, mySize, dotCount, houseDotCount, yourValue, houseValue, yourScore, houseScore;
  Die(int x, int y)
  {
    mySize = 50;
    myX = x;
    myY = y;
    dotCount = 0;
    houseDotCount = 0;
    yourValue = 0;
    houseValue = 0;
    yourScore = 0;
    houseScore = 0;
  }
  void roll()
  {
  }
  void show(int myX, int myY)
  {
    if(play > 1)
    {
      for(myY = 300; myY < 359; myY += 50) {
        for(myX = 0; myX < 500; myX += 50) {
          fill(255,255,255);
          stroke(0, 0, 255);
          rect(myX,myY,mySize,mySize);
          stroke(0, 0, 0);
          fill(0, 0, 0);
          int dots = (int)(Math.random()*6+1);
          int dotFactor = 10;
          dotCount = dotCount + dots;
          if(dots==1 || dots==3 || dots==5)
            ellipse(myX+mySize/2, myY+(mySize/2), mySize/dotFactor, mySize/dotFactor);
          if(dots != 1) {
            ellipse(myX+(mySize/4), myY+(7*mySize/40), mySize/dotFactor, mySize/dotFactor);
            ellipse(myX+(3*mySize/4), myY+(33*mySize/40), mySize/dotFactor, mySize/dotFactor);
          }
          if(dots==6 || dots==5 || dots==4) {
            ellipse(myX+(3*mySize/4), myY+(7*mySize/40), mySize/dotFactor, mySize/dotFactor);
            ellipse(myX+(mySize/4), myY+(33*mySize/40), mySize/dotFactor, mySize/dotFactor);
            if(dots==6) {
              ellipse(myX+(mySize/4), myY+(mySize/2), mySize/dotFactor, mySize/dotFactor);
              ellipse(myX+(3*mySize/4), myY+(mySize/2), mySize/dotFactor, mySize/dotFactor);
            }
          }
        }
      }
      textSize(12);
      text("The sum of your rolls is " + dotCount, 0, 490);
      yourValue = dotCount;
      dotCount = 0;
    }
  }
  void houseShow(int myX, int myY)
  {
    if(play>1)
    {
      for(myY = 160; myY < 219; myY += 50) {
        for(myX = 0; myX < 500; myX += 50) {
          fill(255,255,255);
          stroke(255, 0, 0);
          rect(myX,myY,mySize,mySize);
          stroke(0, 0, 0);
          fill(0, 0, 0);
          int houseDots = (int)(Math.random()*6+1);
          int dotFactor = 10;
          if(houseDots == 5)
            houseDots = (int)(Math.random()*2+5);
          if(houseDots == 4)
            houseDots = (int)(Math.random()*2+4);
          if(houseDots == 3)
          {
            houseDots = (int)(Math.random()*2+3);
            if(houseDots == 3)
              houseDots = (int)(Math.random()*2+3);
          }
          if(houseDots == 2)
          {
            houseDots = (int)(Math.random()*2+2);
            if(houseDots == 2)
              houseDots = (int)(Math.random()*2+2);
          }
          if(houseDots == 1)
          {
            houseDots = (int)(Math.random()*2+1);
            if(houseDots == 1)
              houseDots = (int)(Math.random()*2+1);
          }
          houseDotCount = houseDotCount + houseDots;
          if(houseDots==1 || houseDots==3 || houseDots==5)
            ellipse(myX+mySize/2, myY+(mySize/2), mySize/dotFactor, mySize/dotFactor);
          if(houseDots != 1) {
            ellipse(myX+(mySize/4), myY+(7*mySize/40), mySize/dotFactor, mySize/dotFactor);
            ellipse(myX+(3*mySize/4), myY+(33*mySize/40), mySize/dotFactor, mySize/dotFactor);
          }
          if(houseDots==6 || houseDots==5 || houseDots==4) {
            ellipse(myX+(3*mySize/4), myY+(7*mySize/40), mySize/dotFactor, mySize/dotFactor);
            ellipse(myX+(mySize/4), myY+(33*mySize/40), mySize/dotFactor, mySize/dotFactor);
            if(houseDots==6) {
              ellipse(myX+(mySize/4), myY+(mySize/2), mySize/dotFactor, mySize/dotFactor);
              ellipse(myX+(3*mySize/4), myY+(mySize/2), mySize/dotFactor, mySize/dotFactor);
            }
          }
        }
      }
      textSize(12);
      text("The sum of Gam Buller's rolls is " + houseDotCount, 0, 30);
      houseValue = houseDotCount;
      houseDotCount = 0;
      textSize(30);
      textAlign(CENTER);
      if(yourValue > houseValue)
      {
        fill(0, 0, 255);
        text("YOU WON :D", 250, 290);
        strokeWeight(6);
        fill(255, 0, 0);
        curve(200, 250, 225, 135, 275, 135, 300, 250);
        yourScore++;
      }
      if(yourValue < houseValue)
      {
        fill(255, 0, 0);
        text("YOU LOST :(", 250, 290);
        strokeWeight(6);
        curve(200, 0, 225, 120, 275, 120, 300, 0);
        houseScore++;
      }
      if(yourValue == houseValue)
      {
        fill(0, 0, 0);
        text("YOU TIED, ROLL AGAIN", 250, 290);
        strokeWeight(6);
        curve(200, 150, 225, 130, 275, 130, 275, 130);
      }
      textAlign(BASELINE);
      textSize(20);
      fill(0, 0, 0);
      text("$$ profit = $" + (yourScore-houseScore), 320, 30);
      textSize(15);
      if(houseScore-yourScore > 100)
        text("You should probably stop...", 300, 45);
      textSize(20);
      fill(0, 0, 255);
      text("Your Score : " + yourScore, 332, 470);
      fill(255, 0, 0);
      text("Gam Buller's Score : " + houseScore, 258, 440);
    }
  }
} 
