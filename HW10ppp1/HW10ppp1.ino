//Daniel Webber
//Naoki Tominaga

//global
int row[6];
double column[6];

void setup(){
  pinMode(13,OUTPUT); 
  Serial.begin(9600);
  
  byte coordinates[3];
  for(int k=0;k<6;k++){
    for (int i=0; i<3;i++){
  
      while(Serial.available() < 1){
       //wait
      }
 
     coordinates[i] = Serial.read();

}
row[k] = coordinates[0];
column[k] = (double)(coordinates[1]*256+coordinates[2])/1000;
Serial.print("The row coordinate is ");
Serial.println(row[k]);
Serial.print("The column coordinate is ");
Serial.println(column[k]);
column[k] = column[k]+.65;
row[k] = row[k] - 5;
}
digitalWrite(13,HIGH);
delay(1000);
digitalWrite(13,LOW);
}

void loop(){
  
}
