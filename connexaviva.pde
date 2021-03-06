import processing.opengl.*;
import processing.video.*;
import glitchP5.*; // import GlitchP5
import processing.serial.*;
import ddf.minim.*;

Minim minim;
AudioPlayer player;

GlitchP5 glitchP5; // declare an instance of GlitchP5. only one is needed

PFont font = createFont("Sans Serif", 20);
Movie movie,movie1,movie2,movie3,movie4;


Serial myPort;  

String state="repos";
boolean glitch=false;
int videoIndex;

void setup()
{
  size(1280, 800, OPENGL);
  myPort = new Serial(this, "/dev/tty.usbmodem1421", 9600);
  myPort.bufferUntil('\n');
  
  movie = new Movie(this, "cv.mov");
  movie1 = new Movie(this, "cv3.mov");
  movie2 = new Movie(this, "cv3.mov");
  movie3 = new Movie(this, "cv3.mov");
  movie4 = new Movie(this, "cv3.mov");
  movie.loop();
  
  glitchP5 = new GlitchP5(this); // initiate the glitchP5 instance;
  textFont(font);
  
    // we pass this to Minim so that it can load files from the data directory
  minim = new Minim(this);
  
  // loadFile will look in all the same places as loadImage does.
  // this means you can find files that are in the data folder and the 
  // sketch folder. you can also pass an absolute path, or a URL.
  player = minim.loadFile("11056.mp3");
  

  
}


void draw()
{
  background(0);
  
  if ( myPort.available() > 0) {  // If data is available,
   int inBuffer = myPort.read();   
   //println(inBuffer);
    if (inBuffer ==48) {
      //println(inBuffer);
      println("glitch");
        glitchP5.glitch(width/2, height/2, width/3, height/3, width/2, 1200, 3, 1.0f, 10, 10);
  // play the file
  player.play(0);
      }
        if (inBuffer ==49 & state=="repos") {
      //println(inBuffer);
      println("next");
      movie.noLoop();
      state="next";
      videoIndex=ceil(random(1,4));
      

      } 
      
      
    }
  
  if (state=="next"){
      if(movie.time()==movie.duration()){
           println("play video metamorph : "+ videoIndex);
           
          if (videoIndex==1){
             //movie1.jump(0);
             movie1.play();
             image(movie1, 0, 0, width, height);
             if(movie1.time()==movie1.duration()){
             state="repos";
             println("repos");
             movie.jump(0);
             movie.loop();
             
             }
          }
             if (videoIndex==2){
             //movie1.jump(0);
             movie2.play();
             image(movie2, 0, 0, width, height);
             if(movie2.time()==movie2.duration()){
             state="repos";
             println("repos");
             movie.jump(0);
             movie.loop();
             
             }
             }
              if (videoIndex==3){
             //movie1.jump(0);
             movie3.play();
             image(movie3, 0, 0, width, height);
             if(movie3.time()==movie3.duration()){
               state="repos";
               println("repos");
               movie.jump(0);
               movie.loop();
             
               }
              }
               if (videoIndex==4){
             //movie1.jump(0);
             movie4.play();
             image(movie4, 0, 0, width, height);
             if(movie4.time()==movie4.duration()){
             state="repos";
             println("repos");
             movie.jump(0);
             movie.loop();
             
             }
            }
          
           
      }else{
           image(movie, 0, 0, width, height);
      }
      
  }else{
image(movie, 0, 0, width, height);
   
  }
  fill(200,100);
 // text("click to glitch", 10, 30);
 // text("framerate: "+frameRate, 10, height-10);

  glitchP5.run(); // this needs to be at the end of draw(). anything after it will not be drawn to the screen
  
  
}

void movieEvent(Movie m) {
  m.read();
}

void mousePressed()
{
  // trigger a glitch: glitchP5.glitch(  posX,       // 
  //                               posY,       // position on screen(int)
  //          posJitterX,     // 
  //          posJitterY,     // max. position offset(int)
  //          sizeX,       // 
  //          sizeY,       // size (int)
  //          numberOfGlitches,   // number of individual glitches (int)
  //          randomness,     // this is a jitter for size (float)
  //          attack,     // max time (in frames) until indiv. glitch appears (int)
  //          sustain      // max time until it dies off after appearing (int)
  //              );

  //glitchP5.glitch(width/2, height/2, width/3, height/3, width/2, 1200, 3, 1.0f, 10, 10);
}