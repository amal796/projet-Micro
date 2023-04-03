//char med1[30][]="ebixa 10mg 2/j";
//char med2[30][]="aricept 10mg 3/j";

sbit LCD_RS at RD4_bit;
sbit LCD_EN at RD5_bit;
sbit LCD_D7 at RD3_bit;
sbit LCD_D6 at RD2_bit;
sbit LCD_D5 at RD1_bit;
sbit LCD_D4 at RD0_bit;

sbit LCD_RS_Direction at TRISD4_bit;
sbit LCD_EN_Direction at TRISD5_bit;
sbit LCD_D7_Direction at TRISD3_bit;
sbit LCD_D6_Direction at TRISD2_bit;
sbit LCD_D5_Direction at TRISD1_bit;
sbit LCD_D4_Direction at TRISD0_bit;

int i,NB;
float Temp,Temp1;
char Temperature[3]; //= " 00.0 C";
void ledBuzzer(){

//blink led
 for( i=0;i<3;i++){


    PORTD.F6 = 1;   //making port D High
    delay_ms(100); //1 sec delay
    PORTD.F6 = 0; //making port D low
    delay_ms(100); //1 sec delay$
          PORTA.F0=1; //making buzzer high
      delay_ms(1000); //1 sec delay
   }
     PORTA.F0=0;
}
void sens_horaire()
{
     PORTC.F0=1;
     PORTC.F1=0;
      delay_ms(2000);
}

void sens_antihoraire()
{
     PORTC.F0=0;
     PORTC.F1=1;
      delay_ms(2000);
}
void disp_text_frm_eeprom(int start_address, int end_address,short row, short colum)
{
  char txt[16];
  int s=0,n=0;
  for(s=start_address;s<=end_address;s++)
  {
    txt[n]=EEPROM_Read(s);
    n++;
  }
  Lcd_Out(row,colum,txt);
  Delay_ms(2);
}
void write_text_frm_eeprom(int start_address, int end_address,short row, short colum,char txt[])
{
  //char txt[]="Ebixa 10mg 2/J";
  int s=0,n=0;
  for(s=start_address;s<=end_address;s++)
  {
    EEPROM_Write(s,txt[n]);
    n++;
  }
  Lcd_Out(row,colum,txt);
  Delay_ms(2);
}
void interrupt(){
     if(intcon.inte && intcon.intf)  //ntesti si fama interruption walé
     {
       ledBuzzer();
       intcon.INTF=0;
     }
          if( intcon.rbif)
     {
             if (PORTB.F4=1)
             {sens_horaire();

              intcon.rbif=0;}
              PORTC.F0=0;
              PORTC.F1=0;
              if(PORTB.F5=1)
              {sens_antihoraire();
              intcon.rbif=0;}
              PORTC.F0=0;
              PORTC.F1=0;
     }
     if(INTCON.T0IF == 1){

   NB--;
   if (NB==0){
      //temperature();
   Sound_Play(400, 250);
    NB=122;
    TMR0=0;
   }INTCON.T0IF = 0;
  }
}

void main()
{
TRISB.F0=1;         //// declares pin number 0 of PORTB as a input pin
TRISD.F6=0;         //// declares pin number 6 of PORTD as a output pin
PORTD.F6 = 0; //LED OFF
TRISA.F0=0;
PORTA.F0=0;
TRISB.F4=1; // boutton d'interruption  (declencher le moteur dans le sens horaire)
TRISB.F5=1; // boutton d'interruption  (declencher le moteur dans le sens anti-horaire)
TRISC.F0=0;    //MOTEUR
TRISC.F1=0;    //MOTEUR
PORTC.F0=0;    //MOTEUR
PORTC.F1=0;    //MOTEUR
TRISA.F4=1; //Capteur temperature
TRISA.F2=0;
PORTA.F2 = 0; //LED OFF
TRISA.F3=0;
PORTA.F3 = 0; //LED OFF
TRISD.F7=0; //speaker
lcd_init() ;
ADC_Init();
Sound_Init(&PORTD,7);
lcd_cmd(_lcd_cursor_off);
ADCON1 = 0x8E; //configure gpio of the adc
         //interruption buzzer sur RB0
    INTCON.INTE = 1;  //enable external interrupts
    INTCON.GIE  = 1;  //enable Global interrupts
option_reg.INTEDG =1;     //sens de transition
        //interruption moteur sur RB4 et RB5
     intcon.gie=1;
     intcon.inte=1;  //active interruption
     intcon.rbie=1;                 //rb0
     option_reg.INTEDG=1;

     //interruption timer:
 INTCON.GIE=1;              // utiliser interrupt
 INTCON.T0IE = 1;     //une interruption est déclenché à chaque passage du timer à 0
 OPTION_REG.T0CS=0;    //mode de fonct timer
 OPTION_REG.PS0=1;
 OPTION_REG.PS1=1;              //Les bits de configuration de la valeur du prédiviseur  ( 256 )
 OPTION_REG.PS2=0;
 OPTION_REG.PSA=0;
 TMR0=0;
 NB=122;

     lcd_out(1, 1, "AMAL");
     lcd_out(2, 1, "Have A Good Day");

     delay_ms(1000);
     lcd_Cmd(_LCD_CLEAR);             // clear LCD





while(1)
 {
Temp= ADC_Read(1);  // * 5 / 1023; //Read analog voltage and convert to digital

Temp1 = temp * 0.489;   //  convert it to degree Celsius (0.489 = 500/1023)
//delay_ms(50) ;
     IntToStr(Temp1,Temperature);
    //delay_ms(50)  ;
    Lcd_Cmd(_LCD_CLEAR);
    lcd_out(1, 1, "Temperature:");
    lcd_out(2, 3, Temperature);              // Display LM35 temperature result

    delay_ms(1000);
    Lcd_Cmd(_LCD_CLEAR);
    /* if(Temp1>37)
        {
        if(Temp1<39)
        {
             PORTA.F3=1;   //LED ON    GREEN
             PORTA.F2 = 0; //LED OFF blue
             PORTD.F6=0;  //LED OFF   RED
             delay_ms(5000);
        }
        if(Temp1>=39)
        {

             PORTA.F3=0;   //LED OFF    GREEN
             PORTA.F2 = 1; //LED ON blue
             PORTD.F6=0;  //LED OFF   RED
             delay_ms(5000);
        }


     }
     if(Temp1<37)
     {
     PORTA.F3 = 0; //LED OFF
     PORTA.F2 = 0; //LED OFF
           for(i=0 ; i<3 ; i++ )
    {
        PORTD.F6=1;   //LED ON RED
        delay_ms(30) ;
        PORTD.F6=0;
        delay_ms(30)  ;
    }
    }   */
     //rappel medicaments
      write_text_frm_eeprom(0x00,0x0F,1,1,"Ebixa 10mg 2/J");
      write_text_frm_eeprom(0x10,0x1F,2,1,"Aricept 10mg 3/J");
      disp_text_frm_eeprom(0x00,0x0F,1,1);
      disp_text_frm_eeprom(0x10,0x1F,2,1);
       delay_ms(500);
       
      /* if(Temp1==37){
        int i;
        for(i=0;i<3;i++) {
      PORTD.F6=1;
      delay_ms(30) ;
                PORTD.F6=0;

                 delay_ms(30)  ;
      }

     }  */
        if(Temp1>37){
             PORTA.F2=1;

        }

        if(Temp1<37){
                PORTA.F3=1;


        }
 }}