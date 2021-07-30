 //<>// //<>//

import ddf.minim.*;
Minim minim;
 
import oscP5.*;
import netP5.*;

OscP5 oscP5;

float arcadeValue; //0 or 1; -->  lever

///////////////////////////
int randomStart=0;  ////////////////////////////////////////////////////////
//////////////////////////////



AudioSample slotM;
AudioSample win1;
AudioSample win2;
AudioSample zong;


int nrPictRnd=3; //before result
int side_or_middle; 
// |n=1| |rnd| |n=n+1|  --> that's how avoid the coincidence of three same elements
//BUT because it seems bad only right+middle or only left+middle to be identical
//I create one more randomization in order to have 2 positions
// |n=rnd1| |rnd2| |n=rnd1+1| 
// |rnd2| |n=rnd1| |n=rnd1+1| 
//side_or_middle determines which form the two positions I will choose


//String[] vid_name_el = new String[146];
boolean start_SM;
int timer_SM;

int delta_time = 60;
int timer=0;


////////////////////CYL A   ///////////////////
int cylA1;
int cylA2;

int turnsA1;
int turnsA2;

int rndA1;
int pointerImgArrayA1=0;
int pointerImgArrayA2=0;

PImage imgA1;
PImage imgA2;

PImage[] arrayA1 = new PImage[10];



////////////////////CYL B   ///////////////////
int cylB1;
int cylB2;

int turnsB1;
int turnsB2;

int rndB1;
int pointerImgArrayB1=0;
int pointerImgArrayB2=0;

PImage imgB1;
PImage imgB2;

PImage[] arrayB1 = new PImage[10];


////////////////////CYL C   ///////////////////
int cylC1;
int cylC2;

int turnsC1;
int turnsC2;

int rndC1;
int pointerImgArrayC1=0;
int pointerImgArrayC2=0;

PImage imgC1;
PImage imgC2;

PImage[] arrayC1 = new PImage[10];

//////////////////////////////////////////////





PImage[] img_table = new PImage[10];
PImage bg_img;


int Lucky_Inc=-1;  // OLD
IntList urnList = new IntList(10);
int LuckyOne=0;


int rnd_sides;
int rnd_middle;


IntList chance8p = new IntList(13);  //NEW
int LuckyCounter;
int roundsPlay=-1;
                //5 200, 20 NANO
int[] historyWin = {0,0, 0,0, 0,0, 0,3, //10  
                    1,0, 0,0, 0,0, 0,0, 0,0, 3,0, 0,0, 0,0, 3,0, 0,0,
                    0,0, 0,0, 0,1, 0,0, 0,0, 0,0, 0,3, 3,0, 3,0, 0,0, 
                    0,0, 0,0, 0,0, 3,1, 0,0, 0,0, 0,0, 3,3, 3,0, 0,0,
                    1,0, 0,0, 0,0, 0,0, 0,0, 0,0, 0,0, 3,3, 3,2, 0,0,
                    0,0, 0,0, 1,   0,0, 3,3, 0,0, 0,0, 0,0, 0,0, 0,0,
                    0,0, 0,0, 0,0, 0,0, 0,1, 0,0, 0,0, 0,0, 0,0, 0,0,
                    0,0, 0,0, 0,1, 0,0, 0,0, 0,3, 0,0, 0,0, 0,0, 0,3,
                    0,0, 0,0, 0,0, 0,0, 0,3, 3,3, 0,2, 0,0, 0,0, 3,0,
                    0,0, 1,   0,0, 0,0, 0,0, 3,2, 0,0, 3,0, 0,0, 0,0,
                    3,0, 0,0, 0,0, 3,0, 0,3, 0,0, 0,0, 0,3, 1,   0,3,
                    
                    1,   0,0, 0,0, 0,3, 0,0, 2,0, 0,0, 0,0, 3,0, 0,0,
                    0,0, 0,0, 0,1, 0,0, 0,0, 0,0, 0,3, 3,0, 3,0, 2,0, 
                    0,0, 0,0, 0,0, 3,0, 0,0, 0,0, 0,2, 0,0, 3,0, 0,0,
                    0,0, 0,0, 1,0, 0,0, 0,0, 0,0, 0,3, 3,0, 3,3, 3,2,
                    0,0, 0,0, 1,   0,0, 3,3, 0,0, 0,0, 0,0, 2,0, 0,0,
                    0,0, 0,0, 0,0, 2,0, 0,1, 0,0, 0,0, 0,0, 0,0, 0,0,
                    0,0, 0,0, 0,1, 0,0, 0,0, 2,3, 0,0, 0,0, 0,0, 0,3,
                    0,0, 0,0, 0,0, 0,0, 0,3, 3,3, 0,0, 0,0, 0,0, 3,0,
                    0,0, 1,   0,0, 0,0, 0,0, 3,2, 0,0, 3,0, 0,0, 0,0,
                    3,1, 0,0, 0,0, 3,0, 0,3, 0,0, 0,0, 0,3, 0,0, 0,3
                  };

/*


   _____  ______  _______  _    _  _____  
  / ____||  ____||__   __|| |  | ||  __ \ 
 | (___  | |__      | |   | |  | || |__) |
  \___ \ |  __|     | |   | |  | ||  ___/ 
  ____) || |____    | |   | |__| || |     
 |_____/ |______|   |_|    \____/ |_|     
                                          
                                          
 
*/


void setup() {
 
  //fullScreen();
  //size(400,400);
 size(1280,720);
 frameRate(25);
 
 LuckyCounter=int(random(randomStart));
 
 
 oscP5 = new OscP5(this,12000);
 
   //size(1366, 768, P3D);
  minim = new Minim(this);
  slotM = minim.loadSample( "wheel4.wav", 512);
  win1 = minim.loadSample( "win1.wav", 512);
  win2 = minim.loadSample( "win2.wav", 512);
  zong = minim.loadSample( "zong.wav", 512);
  
 //################CHANCE TABLES############################### 
 
chance8p.set(0,1); //1W
chance8p.set(1,0); //2
chance8p.set(2,0);
chance8p.set(3,0); //3W
chance8p.set(4,1);
chance8p.set(5,1); //4W
chance8p.set(6,0); //5
chance8p.set(7,0);
chance8p.set(8,0); //6W
chance8p.set(9,1); 

chance8p.set(10,0); //7
chance8p.set(11,0); 
chance8p.set(12,0); //8
chance8p.set(13,0);

//#################################################################3 

img_table[0] = loadImage("00.jpg");
img_table[1] = loadImage("01.jpg");
img_table[2] = loadImage("02.jpg");
img_table[3] = loadImage("03.jpg");
img_table[4] = loadImage("04.jpg");
img_table[5] = loadImage("05.jpg");
img_table[6] = loadImage("06.jpg");
img_table[7] = loadImage("07.jpg");
img_table[8] = loadImage("08.jpg");


//arrayA1 = {img_table[0],img_table[0],img_table[0]};

//YOU NEED AND THIS ONE WHEN IT IS INSIDE RANDOM CHOOSE
arrayA1[0] = img_table[0]; 
arrayA1[1] = img_table[1]; 
arrayA1[2] = img_table[2];
arrayA1[3] = img_table[3]; 
arrayA1[4] = img_table[4]; 
arrayA1[5] = img_table[5];
arrayA1[6] = img_table[6]; 
arrayA1[7] = img_table[7]; 
arrayA1[8] = img_table[8];


imgA1=loadImage("00.jpg");
imgA2=loadImage("01.jpg");

arrayB1[0] = img_table[0]; 
arrayB1[1] = img_table[1]; 
arrayB1[2] = img_table[2];
arrayB1[3] = img_table[3]; 
arrayB1[4] = img_table[4]; 
arrayB1[5] = img_table[5];
arrayB1[6] = img_table[6]; 
arrayB1[7] = img_table[7]; 
arrayB1[8] = img_table[8];


imgB1=loadImage("01.jpg");
imgB2=loadImage("02.jpg");


arrayC1[0] = img_table[0]; 
arrayC1[1] = img_table[1]; 
arrayC1[2] = img_table[2];
arrayC1[3] = img_table[3]; 
arrayC1[4] = img_table[4]; 
arrayC1[5] = img_table[5];
arrayC1[6] = img_table[6]; 
arrayC1[7] = img_table[7]; 
arrayC1[8] = img_table[8];


imgC1=loadImage("01.jpg");
imgC2=loadImage("00.jpg");


bg_img=loadImage("bg-13.png");

      for(int i=0; i<10; i++){
      urnList.set(i,i);    
      }
 //historyWin ={1,2,3};     
      
}



/*


  _____   _____        __          __
 |  __ \ |  __ \     /\\ \        / /
 | |  | || |__) |   /  \\ \  /\  / / 
 | |  | ||  _  /   / /\ \\ \/  \/ /  
 | |__| || | \ \  / ____ \\  /\  /   
 |_____/ |_|  \_\/_/    \_\\/  \/    
                                     
                                     


*/


void draw(){
background(0); 
  
  if(start_SM){
    
    timer_SM +=4; //25frames*4=100 --> timer count per 100
    //println(timer_SM);

     //background(0);   
     timer+=delta_time; 
     
     
     
     /*
     
   _____ __     __ _                 
  / ____|\ \   / /| |          /\    
 | |      \ \_/ / | |         /  \   
 | |       \   /  | |        / /\ \  
 | |____    | |   | |____   / ____ \ 
  \_____|   |_|   |______| /_/    \_\
                                                                      
     */
     
     cylA1  = (timer % 800) - 400;    
     cylA2  = ((timer+400) % 800)-400;
     //println(cylA1);
    // cylA1  = (timer % 600) - 300;    
     //cylA2  = ((timer+300) % 600)-300;
     
     
    //CHANGE PICTURE --> SMART SOLUTION 
    // When photo is in the next step of the limit bound 
    //(which is 600) and the next step delta_time =>
    //600+ delta_time   THEN the photo changes 250=600-350   //800-160
    //PLZ notice that 
     if(cylA1+delta_time>380){
       
       if(timer_SM<280){
         /*pointerImgArrayA1+=1;
         pointerImgArrayA1 = pointerImgArrayA1 % 5;
         imgA1 = arrayA1[pointerImgArrayA1];  */
              int rnd_pictA1;
              
     rnd_pictA1=int(random(nrPictRnd));
     imgA1 = img_table[rnd_pictA1];
         
       }else if(timer_SM>280 /* && LuckyOne==1 */){ // οι δύο ακριανές πλευρές πάντα διαφορετικές!
         
         if(historyWin[LuckyCounter]==0){ 
           
            if(side_or_middle==0){ ////////////////////////////
            
            
            
           imgA1 = arrayA1[rnd_sides];
            }else{
           imgA1 = arrayA1[rnd_middle];
            }
           
          }else if(historyWin[LuckyCounter]==1){
            imgA1 = arrayA1[0];
          }else if(historyWin[LuckyCounter]==2){
            imgA1 = arrayA1[1];
          }else if(historyWin[LuckyCounter]==3){
            imgA1 = arrayA1[2];
          }
       } 

     }
       
     if(cylA2+delta_time>380){ 
     int rnd_pictA2;
     rnd_pictA2=int(random(3));
     imgA2 = img_table[rnd_pictA2];
     //println(rnd_pictA2);
     }

     if(timer_SM>320){ 

       cylA1=0;
       cylA2=-800;

     }
     
    image(imgA1, 150, cylA1+160);
    image(imgA2, 150, cylA2+160);
    
    
         /*
   _____ __     __ _        ____  
  / ____|\ \   / /| |      |  _ \ 
 | |      \ \_/ / | |      | |_) |
 | |       \   /  | |      |  _ < 
 | |____    | |   | |____  | |_) |
  \_____|   |_|   |______| |____/ 
                                                                                               
     */
     
     cylB1  = (timer % 800) - 400;    
     cylB2  = ((timer+400) % 800)-400; 
     
     
     
    //CHANGE PICTURE --> SMART SOLUTION 
    // When photo is in the next step of the limit bound 
    //(which is 600) and the next step delta_time =>
    //600+ delta_time   THEN the photo changes
    //PLZ notice that 
     if(cylB1+delta_time>380){
       
       if(timer_SM<280){
           
      int rnd_pictB1;          
     rnd_pictB1=int(random(nrPictRnd));
     imgB1 = img_table[rnd_pictB1]; 
         
       }else if(timer_SM>280 /*&& LuckyOne==1 */){
         //imgB1 = arrayB1[rnd_middle];
          if(historyWin[LuckyCounter]==0){
            
            if(side_or_middle==1){ ////////////////////////////
           imgB1 = arrayB1[rnd_sides];
            }else{
           imgB1 = arrayB1[rnd_middle];
            }
             
          }else if(historyWin[LuckyCounter]==1){
            imgB1 = arrayB1[0];
          }else if(historyWin[LuckyCounter]==2){
            imgB1 = arrayB1[1];
          }else if(historyWin[LuckyCounter]==3){
            imgB1 = arrayB1[2];
          }
       }
     }
       
     if(cylB2+delta_time>380){ 
     int rnd_pictB2;
     rnd_pictB2=int(random(3));
     imgB2 = img_table[rnd_pictB2];
     //println(rnd_pictA2);
     }
     
     if(timer_SM>320){ 

       cylB1=0;
       cylB2=-800;

     }
     
    image(imgB1, 490, cylB1+160);
    image(imgB2, 490, cylB2+160);
    
    
     /* 

   _____ __     __ _         _____ 
  / ____|\ \   / /| |       / ____|
 | |      \ \_/ / | |      | |     
 | |       \   /  | |      | |     
 | |____    | |   | |____  | |____ 
  \_____|   |_|   |______|  \_____|
                                                                
                                                                      
     */
     
     cylC1  = (timer % 800) - 400;    
     cylC2  = ((timer+400) % 800)-400;
     
     
    //CHANGE PICTURE --> SMART SOLUTION 
    // Wen photo is in the next step of the limit bound 
    //(which is 600) and the next step delta_time =>
    //600+ delta_time   THEN the photo changes
    //PLZ notice that 
     if(cylC1+delta_time>380){
       
       if(timer_SM<280){
         /*pointerImgArrayA1+=1;
         pointerImgArrayA1 = pointerImgArrayA1 % 5;
         imgA1 = arrayA1[pointerImgArrayA1];  */
      int rnd_pictC1;          
     rnd_pictC1=int(random(nrPictRnd));
     imgB1 = img_table[rnd_pictC1]; 
         
       }else if(timer_SM>280 /*&& LuckyOne==1 */){
         
          if(historyWin[LuckyCounter]==0){
         imgC1 = arrayC1[(rnd_sides+1)%nrPictRnd];
          }else if(historyWin[LuckyCounter]==1){
            imgC1 = arrayC1[0];
          }else if(historyWin[LuckyCounter]==2){
            imgC1 = arrayC1[1];
          }else if(historyWin[LuckyCounter]==3){
            imgC1 = arrayC1[2];
          }
       } 

     }
     
     if(cylC2+delta_time>380){ 
     int rnd_pictC2;
     rnd_pictC2=int(random(3));
     imgC2 = img_table[rnd_pictC2];
     //println(rnd_pictA2);
     }
     
     if(timer_SM>320){ 

       cylC1=0;
       cylC2=-800;

     }
     
    image(imgC1, 830, cylC1+160);
    image(imgC2, 830, cylC2+160);
    
   
    /*
    
   _____ __     __ _        ______  _   _  _____  
  / ____|\ \   / /| |      |  ____|| \ | ||  __ \ 
 | |      \ \_/ / | |      | |__   |  \| || |  | |
 | |       \   /  | |      |  __|  | . ` || |  | |
 | |____    | |   | |____  | |____ | |\  || |__| |
  \_____|   |_|   |______| |______||_| \_||_____/ 
                                                                                               

    */
    
     if(historyWin[LuckyCounter]==1 &&timer_SM==320){
      win1.trigger();
    }
     if(historyWin[LuckyCounter]==2 &&timer_SM==320){
      win1.trigger();
    }
    
     if(historyWin[LuckyCounter]==3 &&timer_SM==320){
      zong.trigger();
    }
    
    
    
    } //// /////////  IF BUTTON = V
   image(bg_img, 0, 0); 
    
    
      
}//void draw



void keyPressed() {  
   
    //println(" value: "+arcadeValue); 
    
     if (key==' '){    //key==' '
      print("JJJJJJJJJJJJJJJJJJJJJJJ");
      slotM.trigger();
      rnd_sides=int(random(nrPictRnd));
      rnd_middle=int(random(nrPictRnd));
      
      start_SM = true;
      timer_SM =0;
      
      side_or_middle=int(random(2));
      
      
    LuckyCounter+=1;
    LuckyCounter%=390; //399
    
    println(LuckyCounter);
    
    //println("LC"+LuckyCounter);
    
    //print(historyWin[LuckyCounter]);
   }
    
} // END

void oscEvent(OscMessage theOscMessage) {
    arcadeValue = theOscMessage.get(0).floatValue();
    //println(" value: "+arcadeValue); 
    
     if (arcadeValue>0){    //key==' '
      print("JJJJJJJJJJJJJJJJJJJJJJJ");
      slotM.trigger();
      rnd_sides=int(random(nrPictRnd));
      rnd_middle=int(random(nrPictRnd));
      
      start_SM = true;
      timer_SM =0;
      
      side_or_middle=int(random(2));
      
      
    LuckyCounter+=1;
    LuckyCounter%=390; //399
    
    println(LuckyCounter);
    
    //println("LC"+LuckyCounter);
    
    //print(historyWin[LuckyCounter]);
   }
}
