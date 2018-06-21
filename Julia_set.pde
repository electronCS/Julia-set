float a;
float b;
float minx = -2;
float maxx = 2;
float miny = -2;
float maxy = 2;

void setup()
{
   size(640, 480);
   colorMode(HSB, 20);
   
}

void draw()
{
   background(255);
   a = map(mouseX, 0, width, minx, maxx);
   b = map(mouseY, 0, height, miny, maxy);
   //double a_ = minx;
   float b_ = miny;
   loadPixels();
   //b = 0.1428;
   for (int i = 0; i < width; i++)
   {
       float a_ = minx;
       for(int j = 0; j < height; j++)
       {
          float olda = a_;
          float oldb = b_;
          int count = 0;
          while (count < 20)
          {
              float newa = olda* olda - oldb * oldb + a;
              float newb = 2 * olda * oldb + b;
              olda = newa;
              oldb = newb;
              count++;
              if (newa * newa + newb * newb > 5)
                 break;
          }
   
           if (count == 20)
           {
              pixels[i+j*width] = color(0);

           }
           else 
           {
             //stroke(count, 20, 20);
             pixels[i + j * width] = color(count, 20, 20);
           }
           //stroke(255);
           //point(i,j);
           a_ += (maxx - minx)/height;
       }
       b_ += (maxy - miny)/width;
   }
   updatePixels();
   println(frameRate);
}

void mousePressed()
{
   if (mouseX > 0 && mouseX < width && mouseY > 0 && mouseY < width)
   {
       float xPixel = map (mouseX, 0, width, minx, maxx);  
       float yPixel = map (mouseY, 0, height, miny, maxy);
       
       minx = (minx + xPixel)/2;
       maxx = (maxx + xPixel)/2;
       
       miny = (miny + yPixel)/2;
       maxy = (maxy + yPixel)/2;
       
       //System.out.println("\n" + minx + " " + maxx + "\n" + miny + " " + maxy);
   }
}