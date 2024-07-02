#include <Servo.h>

Servo servo1;
Servo servo2;
Servo servo3;
Servo servo4;
//#define PI 3.1415926535897932384626433832795

int i=0;
int flag_1 = 1; // 1 means add, 0 means substract
int flag_2 = 1; // 1 means add, 0 means substract
int flag_3 = 1; // 1 means add, 0 means substract
int flag_4 = 1; // 1 means add, 0 means substract

int pos_1;
int pos_2;
int pos_3;
int pos_4;

int pos_min = 70;
int pos_max= 110;
float pos_phase =0.8; //0.26 radians = 15-->degree; 0.8,1  // 0.261 0.524  0.8
float mean_angle=(pos_min+pos_max)/2;
int A=15; // 10 15 20
int f=2; //1 2 3
float t;


void setup(){
  servo1.attach(3);
  servo2.attach(5);
  servo3.attach(9);
  servo4.attach(11);
  Serial.begin(9600);
}

void loop(){
    t=millis()/1000.0; //convert milli to sec
    printf("%f", t);
    pos_1 = (mean_angle+ A*sin(2*(3.14)*f*t-pos_phase));
    pos_2 = (mean_angle+ A*sin(2*3.14*f*t+pos_phase));
    pos_3 = (mean_angle+ A*sin(2*3.14*f*t+3*pos_phase));
    pos_4 = (mean_angle+ A*sin(2*3.14*f*t+5*pos_phase));

    //Serial.println(t);
    Serial.println(sin(2*3.14*f*t+pos_phase));
    Serial.println(sin(2*3.14*f*t+3*pos_phase));
    //Serial.println(pos_3);
   
    servo1.write(pos_1);
    servo2.write(pos_2); 
    servo3.write(pos_3);
    servo4.write(pos_4);
    
    delay(10);
}
