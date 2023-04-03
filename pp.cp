#line 1 "C:/Users/Amal/Desktop/projet micro/pp.c"



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
char Temperature[3];
void ledBuzzer(){


 for( i=0;i<3;i++){


 PORTD.F6 = 1;
 delay_ms(100);
 PORTD.F6 = 0;
 delay_ms(100);
 PORTA.F0=1;
 delay_ms(1000);
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
 if(intcon.inte && intcon.intf)
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

 Sound_Play(400, 250);
 NB=122;
 TMR0=0;
 }INTCON.T0IF = 0;
 }
}

void main()
{
TRISB.F0=1;
TRISD.F6=0;
PORTD.F6 = 0;
TRISA.F0=0;
PORTA.F0=0;
TRISB.F4=1;
TRISB.F5=1;
TRISC.F0=0;
TRISC.F1=0;
PORTC.F0=0;
PORTC.F1=0;
TRISA.F4=1;
TRISA.F2=0;
PORTA.F2 = 0;
TRISA.F3=0;
PORTA.F3 = 0;
TRISD.F7=0;
lcd_init() ;
ADC_Init();
Sound_Init(&PORTD,7);
lcd_cmd(_lcd_cursor_off);
ADCON1 = 0x8E;

 INTCON.INTE = 1;
 INTCON.GIE = 1;
option_reg.INTEDG =1;

 intcon.gie=1;
 intcon.inte=1;
 intcon.rbie=1;
 option_reg.INTEDG=1;


 INTCON.GIE=1;
 INTCON.T0IE = 1;
 OPTION_REG.T0CS=0;
 OPTION_REG.PS0=1;
 OPTION_REG.PS1=1;
 OPTION_REG.PS2=1;
 OPTION_REG.PSA=0;
 TMR0=0;
 NB=122;

 lcd_out(1, 1, "AMAL");
 lcd_out(2, 1, "Have A Good Day");

 delay_ms(1000);
 lcd_Cmd(_LCD_CLEAR);





while(1)
 {
Temp= ADC_Read(1);

Temp1 = temp * 0.489;

 IntToStr(Temp1,Temperature);

 Lcd_Cmd(_LCD_CLEAR);
 lcd_out(1, 1, "Temperature:");
 lcd_out(2, 3, Temperature);

 delay_ms(1000);
 Lcd_Cmd(_LCD_CLEAR);
#line 207 "C:/Users/Amal/Desktop/projet micro/pp.c"
 write_text_frm_eeprom(0x00,0x0F,1,1,"Ebixa 10mg 2/J");
 write_text_frm_eeprom(0x10,0x1F,2,1,"Aricept 10mg 3/J");
 disp_text_frm_eeprom(0x00,0x0F,1,1);
 disp_text_frm_eeprom(0x10,0x1F,2,1);
 delay_ms(500);
#line 224 "C:/Users/Amal/Desktop/projet micro/pp.c"
 if(Temp1>37){
 PORTA.F2=1;

 }

 if(Temp1<37){
 PORTA.F3=1;


 }
 }}
