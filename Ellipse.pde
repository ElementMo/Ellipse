float rotationGrow = 0.0;
int lineNum = 50;

void setup()
{
  fullScreen(P3D);
  strokeWeight(3);
  noFill();
  frameRate(100);
  noCursor();
}
void draw()
{
  background(0);
  translate(width/2, height/2);
  rotationGrow +=0.5;

  stroke(255);
  ellipse(0, 0, 800, 800);

  //if (mousePressed)
  //{
  //  if (lineNum<200)
  //  {
  //    lineNum ++;
  //  }
  //}

  for (int i=0; i<lineNum; i++)
  {
    float deltaAngle = TWO_PI/lineNum * i;
    PVector onEdgePoint = new PVector(400*sin(deltaAngle), 400*cos(deltaAngle));
    aline(new PVector(mouseX-width/2, mouseY-height/2), onEdgePoint, radians(90));
  }
  textSize(60);
  text("line Number=" + lineNum, 400, -400);
}

void aline(PVector start, PVector end, float rotation)
{
  PVector midline = PVector.add(start, end);
  midline = midline.div(2);
  PVector halfline1 = PVector.sub(start, end);
  halfline1 = halfline1.div(2);
  PVector halfline2 = PVector.sub(end, start);
  halfline2 = halfline2.div(2);

  PVector afterrotate1 = PVector.add(midline, halfline1.rotate(rotation));
  PVector afterrotate2 = PVector.add(midline, halfline2.rotate(rotation));
  stroke(255, 50);
  line(start.x, start.y, end.x, end.y);
  stroke(255, 150);
  line(afterrotate1.x, afterrotate1.y, afterrotate2.x, afterrotate2.y);
}
//void keyPressed()
//{
//  if (key == 'c')
//  {
//    lineNum =0;
//  } else
//  {
//    lineNum  ++;
//  }
//}
