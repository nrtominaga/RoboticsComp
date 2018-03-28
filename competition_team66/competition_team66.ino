/****************************************************************
 *    Author Name: Naoki Tominaga and Daniel Webber
 *    Date: 4/18/15
 *    Sketch Name: competition_team66
 *    Sketch Description: This sketch is our competition code.  
 *                        
 *    Button Usage: Up/Down    -  
 *                  Left/Right -  
 *                  Select     -  
 *                 
 *    Pin Usage:      Pin type/number    Hardware 
 *                    ----------------   ----------------
 *                    Analog pin A0      Romeo's onboard buttons
 *
 *****************************************************************
 
/****************************
 ** #defines and #includes **
 ****************************/ 
 #include<Servo.h>
/***********************
 ** Global Variables ***
 ***********************/
Servo launcherServo; 
Servo reloaderServo;
// *** Declare & Initialize ANALOG Pins ***
const int buttonPin = A0;
const int irSensorPin = A5;
// *** Declare & Initialize DIGITAL Pins ***
const int motorDirPin = 4;  
const int motorPowerPin = 5;
const int solDirPin = 7;
const int solPowPin = 6;
const int launcherServoPin = 9;
const int reloaderServoPin = 10;
const int leftContactPin = 11;
const int rightContactPin = 12;
const int irLedPin = 13;
// *** Declare & Initialize Program Variables ***
int buttonReading;
int buttonPressed;
int motorPower = 255;
int motorDir = HIGH;
int leftContactReading = LOW;
int rightContactReading = LOW;
int irSensorReading = 0;
int irSensorThreshold = 600;
boolean currentirSensorValue = 0;
boolean lastirSensorValue = 0;
int counts = 0;
boolean motorLeftFlag = 0;
boolean motorRunningFlag = 0;
unsigned long currentTime = 0;
unsigned long lastReadingTime = 0;
unsigned long elapsedTime = 0;
const int ENCODER_MAX = 38;
int desiredPos = 0;
int homie = 35;
int releaser = 8;
int launcherServoAngleHome = 60;
int solenoidPower = 255;
int solenoidActivationTime = 750;
int irLEDOnOffTime = 1000;
int row[6];
double column[6];
int target;
double servoAngle[6];
double launchAngle[6];
double v0 = 2.96;
double thetaLO = 14.16;
double thetaSO = 31.90;
/*******************
 ** Setup Function **
 *******************/  
void setup(void){
  // PUT YOUR SETUP CODE HERE, TO RUN ONCE:

  // *** Configure Digital Pins & Attach Servos ***
  launcherServo.attach(launcherServoPin);
  reloaderServo.attach(reloaderServoPin);
  pinMode(motorDirPin, OUTPUT);
  pinMode(motorPowerPin, OUTPUT);
  pinMode(solDirPin, OUTPUT);
  pinMode(solPowPin, OUTPUT);
  pinMode(leftContactPin, INPUT_PULLUP);
  pinMode(rightContactPin, INPUT_PULLUP);
  pinMode(irLedPin, OUTPUT);
  // *** Initialize Serial Communication ***
  
  Serial.begin(9600);
   
  // *** Take Initial Readings ***
  lastReadingTime = millis();
  
  lastirSensorValue = threshold();
  
  leftContactReading = digitalRead(leftContactPin);
  rightContactReading = digitalRead(rightContactPin);
  
  lastirSensorValue = threshold();
  // *** Move Hardware to Desired Initial Positions ***
  launcherServo.write(launcherServoAngleHome);
  reloaderServo.write(homie);
  byte coordinates[3];
  for(int k=0;k<6;k++){
    for (int i=0; i<3;i++){  
      while(Serial.available() < 1){
       //wait
      }
      coordinates[i] = Serial.read();
  }
    row[k] = coordinates[0];
    column[k] = (double)(coordinates[1]*256.0+coordinates[2])/1000.0;
    Serial.print("The row coordinate is ");
    Serial.println(row[k]);
    Serial.print("The column coordinate is ");
    Serial.println(column[k] + .65);
    column[k] = column[k]+.65;
    row[k] = row[k] - 5;
    launchAngle[k] = compute_launch_angle(column[k], v0);
    servoAngle[k] = compute_servo_angle(launchAngle[k], thetaLO, thetaSO);
}
  goHome();
  irLED();
  target = 0;
}// end setup() function

/*******************
 ** Loop Function **
 *******************/
void loop(void){
  if(target < 5){
    desiredPos = row[target];
    move_launcher(desiredPos);
    launcherServo.write(servoAngle[target]);
    delay(500);
    fireSolenoid(1000);
    launcherServo.write(launcherServoAngleHome);
    delay(200);
    goToReloader();
    delay(200);
    reloader();
    target++;
  }
  else{
    desiredPos = row[target];
    move_launcher(desiredPos);
    launcherServo.write(servoAngle[target]);
    delay(500);
    fireSolenoid(1000);
    goHome();
    irLED();
    launcherServo.write(35);
    //goToReloader(); 
    while(3 > 2){
    
    }  
  }
} // end loop() function

/**********************
 ** Button Functions **
 **********************/

/*********************
 ** DC Motor Functions **
 *********************/
void turn_motor_on(void){
  
  // This function turns the motor on with the power stored in motorPower
  // and the direction stored in motorDir.  Note that motorPower and motorDir
  // are global variables.
  
  //LAB 7: Set the value on the motor direction pin to motorDir
  //       using digitalWrite().
  digitalWrite(motorDirPin, motorDir);
  
  //LAB 7: Power the motor power pin to turn on the motor with power 
  //       motorPower using analogWrite().
  analogWrite(motorPowerPin, motorPower);
  return;
    
} //end turn_motor_on function

void brake(){
   if(motorRunningFlag == 1){
     analogWrite(motorPowerPin, 0);
     delay(50);
      if(motorLeftFlag  == 1){
         motorDir = LOW; 
         turn_motor_on();
      }
      else{
         motorDir = HIGH;
        turn_motor_on(); 
      }
       delay(10);
   }
  analogWrite(motorPowerPin, 0);
 return; 
}

void move_launcher(int pos){
  if(pos < counts){
    motorDir = HIGH;
    motorLeftFlag = 1;
  }
  else if(pos > counts){
    motorDir = LOW;
    motorLeftFlag = 0;
  }
  turn_motor_on(); 
  while(counts != pos){
    count_stripes();
    leftContactReading = digitalRead(leftContactPin);
    rightContactReading = digitalRead(rightContactPin);
    if(motorDir == HIGH && leftContactReading == HIGH){
      counts = 0;
      break; 
    }
    else if(motorDir == LOW && rightContactReading == HIGH){
      counts = ENCODER_MAX;
      break; 
    } 
  }
  motorRunningFlag = 1;
  brake();
}

void goToReloader(){
  motorDir = LOW;
  motorRunningFlag = 1;
  motorLeftFlag = 0;
  turn_motor_on();
  rightContactReading = digitalRead(rightContactPin);
  while(rightContactReading == LOW){
   rightContactReading = digitalRead(rightContactPin);
  }
  brake();
  counts = ENCODER_MAX;
}

void goHome(){
  motorDir = HIGH;
  motorLeftFlag = 1;
  motorRunningFlag = 1;
  turn_motor_on();
  leftContactReading = digitalRead(leftContactPin);
  while(leftContactReading == LOW){
    leftContactReading = digitalRead(leftContactPin);
  }
  brake();  
}

/*********************
 ** Servo Functions **
 *********************/
void reloader(){
   reloaderServo.write(releaser);
  delay(400); // this may change
  reloaderServo.write(homie);
  return;
}

/*********************
 ** Solenoid Functions **
 *********************/
void fireSolenoid(int shotDelay){
  
  // This function fires the solenoid continuously with a delay of shotDelay in milliseconds
  
  // LAB 4: Set the direction on the solenoid direction pin to
  //        HIGH using the digitalWrite command. You may need
  //        to flip your magnet to get your solenoid to fire.
  digitalWrite(solDirPin, HIGH);
  
  // LAB 4: Power the solenoid pin to fire your solenoid
  //        using the analogWrite command.
  analogWrite(solPowPin, solenoidPower);

  // LAB 4: Use the delay command to delay the number of milliseconds stored
  //        in your solenoidActivationTime variable.  (This is how long the
  //        solenoid will be powered.)  
  delay(solenoidActivationTime);
  
  // LAB 4: Cut power to the solenoid pin using the analogWrite command.  
  analogWrite(solPowPin, 0);

  // Delay (shotDelay - solenoidActivationTime) milliseconds so that the total 
  // delay between shots is shotDelay milliseconds.
  delay(shotDelay - solenoidActivationTime);
  
  return;
    
}

/*********************
 ** Other Functions **
 *********************/
 boolean threshold(){
   irSensorReading = analogRead(irSensorPin);
//    Serial.print("The irSensorReading is ");
//    Serial.println(irSensorReading);
    if(irSensorReading <= irSensorThreshold){
       return 0; 
    }
    else if(irSensorReading > irSensorThreshold){
       return 1;
    }
 }
 
 void count_stripes(){
   currentirSensorValue = threshold();
   currentTime = millis();
   elapsedTime = currentTime - lastReadingTime;
   
   if(currentirSensorValue != lastirSensorValue && elapsedTime > 10){
     if(motorLeftFlag == 1){
       counts--;  
      }  
      else{
        counts++;  
      }
      lastirSensorValue = currentirSensorValue;
      lastReadingTime = currentTime;
    }
//    Serial.println(counts);
 }
 
 void irLED(){
   digitalWrite(irLedPin, HIGH);
   delay(irLEDOnOffTime);
   digitalWrite(irLedPin, LOW);
   delay(irLEDOnOffTime); 
 }
// create more headings as necessary to clearly organize your sketch

double compute_landing_distance(double v0, double launch_angle){
	double launchAngleR,g,d1,d2,d3, x0,y0, a, b, c, landingT, landingD;
	g = 9.81;
	d1 = 6.3/100.0;
	d2 = 15.9/100.0;
	d3 = 7.5/100.0;
	launchAngleR = (launch_angle *M_PI)/180.0;
	x0 = 0;
	y0 = 0;
	a = 0;
	b = 0;
	c = 0;
	landingT = 0;
	landingD = 0;
	x0 = d2 * cos(launchAngleR) - d3 * sin(launchAngleR);
	y0 = d1 + d2 * sin(launchAngleR) + d3 * cos(launchAngleR);
	a = -g/2.0;
	b = v0 * sin(launchAngleR);
	c = y0;
	landingT = quadratic(a,b,c,-1);
	landingD = x0 + v0 * cos(launchAngleR) * landingT;
	return landingD;
}


double quadratic(double a, double b, double c,int posNeg){
	double x;
	double d = b*b-4.0*a*c;
	x = (-b +posNeg*sqrt(d))/(2.0*a);
	
	return x;
}

double compute_range(double v0){
	double max_dist = 0;
	double range_angle = 0;
	double landing_dist = 0;
	double distance;
	double i;
	for (i=25;i<85;i = i +.01){
		distance = compute_landing_distance(v0,i);
		if (distance > landing_dist){
			landing_dist = distance;
			range_angle = i;
		}
			else {
			break;
		}
	}
	 return range_angle;
}

double compute_launch_angle(double target, double v0){
	double max_angle = compute_range(v0);
	double max_distance = compute_landing_distance(v0, max_angle);
	double achieve = compute_landing_distance(v0, 84.0);
	if(target > max_distance){
		return max_angle;	
	}
	else if(target < achieve){
		return 84.0;	
	}
	else{
		while(max_distance > target){
			max_angle = max_angle + .01;
			max_distance = compute_landing_distance(v0, max_angle);
		}
	}
	return max_angle;
}
double compute_servo_angle(double thetal,double launchOffset,double servoOffset){
	double H1, H2, H3, H4;
	H1 = 13.2/100.0;
	H2 = 9.5/100.0;
	H3 = 8.8/100.0;
	H4 = 4.7/100.0;
	double K1 = H1 / H2;
	double K2 = H1 / H4;
	double K3 = (pow(H1,2.0) + pow(H2,2.0) - pow(H3,2.0) + pow(H4,2.0)) / (2.0 * (H2 * H4));
	double theta2 = thetal - launchOffset;
	theta2 = theta2 * M_PI / 180.0;
	double A = cos(theta2) - K1 - K2 * cos(theta2) + K3;
	double B = -2.0 * sin(theta2);
	double C = K1 - (K2 + 1.0) * cos(theta2) + K3;
	double theta4 = (2.0 * atan((-B - sqrt(pow(B,2.0) - 4.0 * A * C))/(2.0 * A))) * 180.0 / M_PI;
	int servoAngle = theta4 + servoOffset;
	return servoAngle;
}
