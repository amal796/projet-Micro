
_ledBuzzer:

;pp.c,21 :: 		void ledBuzzer(){
;pp.c,24 :: 		for( i=0;i<3;i++){
	CLRF       _i+0
	CLRF       _i+1
L_ledBuzzer0:
	MOVLW      128
	XORWF      _i+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__ledBuzzer33
	MOVLW      3
	SUBWF      _i+0, 0
L__ledBuzzer33:
	BTFSC      STATUS+0, 0
	GOTO       L_ledBuzzer1
;pp.c,27 :: 		PORTD.F6 = 1;   //making port D High
	BSF        PORTD+0, 6
;pp.c,28 :: 		delay_ms(100); //1 sec delay
	MOVLW      130
	MOVWF      R12+0
	MOVLW      221
	MOVWF      R13+0
L_ledBuzzer3:
	DECFSZ     R13+0, 1
	GOTO       L_ledBuzzer3
	DECFSZ     R12+0, 1
	GOTO       L_ledBuzzer3
	NOP
	NOP
;pp.c,29 :: 		PORTD.F6 = 0; //making port D low
	BCF        PORTD+0, 6
;pp.c,30 :: 		delay_ms(100); //1 sec delay$
	MOVLW      130
	MOVWF      R12+0
	MOVLW      221
	MOVWF      R13+0
L_ledBuzzer4:
	DECFSZ     R13+0, 1
	GOTO       L_ledBuzzer4
	DECFSZ     R12+0, 1
	GOTO       L_ledBuzzer4
	NOP
	NOP
;pp.c,31 :: 		PORTA.F0=1; //making buzzer high
	BSF        PORTA+0, 0
;pp.c,32 :: 		delay_ms(1000); //1 sec delay
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L_ledBuzzer5:
	DECFSZ     R13+0, 1
	GOTO       L_ledBuzzer5
	DECFSZ     R12+0, 1
	GOTO       L_ledBuzzer5
	DECFSZ     R11+0, 1
	GOTO       L_ledBuzzer5
	NOP
	NOP
;pp.c,24 :: 		for( i=0;i<3;i++){
	INCF       _i+0, 1
	BTFSC      STATUS+0, 2
	INCF       _i+1, 1
;pp.c,33 :: 		}
	GOTO       L_ledBuzzer0
L_ledBuzzer1:
;pp.c,34 :: 		PORTA.F0=0;
	BCF        PORTA+0, 0
;pp.c,35 :: 		}
L_end_ledBuzzer:
	RETURN
; end of _ledBuzzer

_sens_horaire:

;pp.c,36 :: 		void sens_horaire()
;pp.c,38 :: 		PORTC.F0=1;
	BSF        PORTC+0, 0
;pp.c,39 :: 		PORTC.F1=0;
	BCF        PORTC+0, 1
;pp.c,40 :: 		delay_ms(2000);
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_sens_horaire6:
	DECFSZ     R13+0, 1
	GOTO       L_sens_horaire6
	DECFSZ     R12+0, 1
	GOTO       L_sens_horaire6
	DECFSZ     R11+0, 1
	GOTO       L_sens_horaire6
	NOP
	NOP
;pp.c,41 :: 		}
L_end_sens_horaire:
	RETURN
; end of _sens_horaire

_sens_antihoraire:

;pp.c,43 :: 		void sens_antihoraire()
;pp.c,45 :: 		PORTC.F0=0;
	BCF        PORTC+0, 0
;pp.c,46 :: 		PORTC.F1=1;
	BSF        PORTC+0, 1
;pp.c,47 :: 		delay_ms(2000);
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_sens_antihoraire7:
	DECFSZ     R13+0, 1
	GOTO       L_sens_antihoraire7
	DECFSZ     R12+0, 1
	GOTO       L_sens_antihoraire7
	DECFSZ     R11+0, 1
	GOTO       L_sens_antihoraire7
	NOP
	NOP
;pp.c,48 :: 		}
L_end_sens_antihoraire:
	RETURN
; end of _sens_antihoraire

_disp_text_frm_eeprom:

;pp.c,49 :: 		void disp_text_frm_eeprom(int start_address, int end_address,short row, short colum)
;pp.c,52 :: 		int s=0,n=0;
	CLRF       disp_text_frm_eeprom_s_L0+0
	CLRF       disp_text_frm_eeprom_s_L0+1
	CLRF       disp_text_frm_eeprom_n_L0+0
	CLRF       disp_text_frm_eeprom_n_L0+1
;pp.c,53 :: 		for(s=start_address;s<=end_address;s++)
	MOVF       FARG_disp_text_frm_eeprom_start_address+0, 0
	MOVWF      disp_text_frm_eeprom_s_L0+0
	MOVF       FARG_disp_text_frm_eeprom_start_address+1, 0
	MOVWF      disp_text_frm_eeprom_s_L0+1
L_disp_text_frm_eeprom8:
	MOVLW      128
	XORWF      FARG_disp_text_frm_eeprom_end_address+1, 0
	MOVWF      R0+0
	MOVLW      128
	XORWF      disp_text_frm_eeprom_s_L0+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__disp_text_frm_eeprom37
	MOVF       disp_text_frm_eeprom_s_L0+0, 0
	SUBWF      FARG_disp_text_frm_eeprom_end_address+0, 0
L__disp_text_frm_eeprom37:
	BTFSS      STATUS+0, 0
	GOTO       L_disp_text_frm_eeprom9
;pp.c,55 :: 		txt[n]=EEPROM_Read(s);
	MOVF       disp_text_frm_eeprom_n_L0+0, 0
	ADDLW      disp_text_frm_eeprom_txt_L0+0
	MOVWF      FLOC__disp_text_frm_eeprom+0
	MOVF       disp_text_frm_eeprom_s_L0+0, 0
	MOVWF      FARG_EEPROM_Read_Address+0
	CALL       _EEPROM_Read+0
	MOVF       FLOC__disp_text_frm_eeprom+0, 0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
;pp.c,56 :: 		n++;
	INCF       disp_text_frm_eeprom_n_L0+0, 1
	BTFSC      STATUS+0, 2
	INCF       disp_text_frm_eeprom_n_L0+1, 1
;pp.c,53 :: 		for(s=start_address;s<=end_address;s++)
	INCF       disp_text_frm_eeprom_s_L0+0, 1
	BTFSC      STATUS+0, 2
	INCF       disp_text_frm_eeprom_s_L0+1, 1
;pp.c,57 :: 		}
	GOTO       L_disp_text_frm_eeprom8
L_disp_text_frm_eeprom9:
;pp.c,58 :: 		Lcd_Out(row,colum,txt);
	MOVF       FARG_disp_text_frm_eeprom_row+0, 0
	MOVWF      FARG_Lcd_Out_row+0
	MOVF       FARG_disp_text_frm_eeprom_colum+0, 0
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      disp_text_frm_eeprom_txt_L0+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;pp.c,59 :: 		Delay_ms(2);
	MOVLW      3
	MOVWF      R12+0
	MOVLW      151
	MOVWF      R13+0
L_disp_text_frm_eeprom11:
	DECFSZ     R13+0, 1
	GOTO       L_disp_text_frm_eeprom11
	DECFSZ     R12+0, 1
	GOTO       L_disp_text_frm_eeprom11
	NOP
	NOP
;pp.c,60 :: 		}
L_end_disp_text_frm_eeprom:
	RETURN
; end of _disp_text_frm_eeprom

_write_text_frm_eeprom:

;pp.c,61 :: 		void write_text_frm_eeprom(int start_address, int end_address,short row, short colum,char txt[])
;pp.c,64 :: 		int s=0,n=0;
	CLRF       write_text_frm_eeprom_s_L0+0
	CLRF       write_text_frm_eeprom_s_L0+1
	CLRF       write_text_frm_eeprom_n_L0+0
	CLRF       write_text_frm_eeprom_n_L0+1
;pp.c,65 :: 		for(s=start_address;s<=end_address;s++)
	MOVF       FARG_write_text_frm_eeprom_start_address+0, 0
	MOVWF      write_text_frm_eeprom_s_L0+0
	MOVF       FARG_write_text_frm_eeprom_start_address+1, 0
	MOVWF      write_text_frm_eeprom_s_L0+1
L_write_text_frm_eeprom12:
	MOVLW      128
	XORWF      FARG_write_text_frm_eeprom_end_address+1, 0
	MOVWF      R0+0
	MOVLW      128
	XORWF      write_text_frm_eeprom_s_L0+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__write_text_frm_eeprom39
	MOVF       write_text_frm_eeprom_s_L0+0, 0
	SUBWF      FARG_write_text_frm_eeprom_end_address+0, 0
L__write_text_frm_eeprom39:
	BTFSS      STATUS+0, 0
	GOTO       L_write_text_frm_eeprom13
;pp.c,67 :: 		EEPROM_Write(s,txt[n]);
	MOVF       write_text_frm_eeprom_s_L0+0, 0
	MOVWF      FARG_EEPROM_Write_Address+0
	MOVF       write_text_frm_eeprom_n_L0+0, 0
	ADDWF      FARG_write_text_frm_eeprom_txt+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      FARG_EEPROM_Write_data_+0
	CALL       _EEPROM_Write+0
;pp.c,68 :: 		n++;
	INCF       write_text_frm_eeprom_n_L0+0, 1
	BTFSC      STATUS+0, 2
	INCF       write_text_frm_eeprom_n_L0+1, 1
;pp.c,65 :: 		for(s=start_address;s<=end_address;s++)
	INCF       write_text_frm_eeprom_s_L0+0, 1
	BTFSC      STATUS+0, 2
	INCF       write_text_frm_eeprom_s_L0+1, 1
;pp.c,69 :: 		}
	GOTO       L_write_text_frm_eeprom12
L_write_text_frm_eeprom13:
;pp.c,70 :: 		Lcd_Out(row,colum,txt);
	MOVF       FARG_write_text_frm_eeprom_row+0, 0
	MOVWF      FARG_Lcd_Out_row+0
	MOVF       FARG_write_text_frm_eeprom_colum+0, 0
	MOVWF      FARG_Lcd_Out_column+0
	MOVF       FARG_write_text_frm_eeprom_txt+0, 0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;pp.c,71 :: 		Delay_ms(2);
	MOVLW      3
	MOVWF      R12+0
	MOVLW      151
	MOVWF      R13+0
L_write_text_frm_eeprom15:
	DECFSZ     R13+0, 1
	GOTO       L_write_text_frm_eeprom15
	DECFSZ     R12+0, 1
	GOTO       L_write_text_frm_eeprom15
	NOP
	NOP
;pp.c,72 :: 		}
L_end_write_text_frm_eeprom:
	RETURN
; end of _write_text_frm_eeprom

_interrupt:
	MOVWF      R15+0
	SWAPF      STATUS+0, 0
	CLRF       STATUS+0
	MOVWF      ___saveSTATUS+0
	MOVF       PCLATH+0, 0
	MOVWF      ___savePCLATH+0
	CLRF       PCLATH+0

;pp.c,73 :: 		void interrupt(){
;pp.c,74 :: 		if(intcon.inte && intcon.intf)  //ntesti si fama interruption walé
	BTFSS      INTCON+0, 4
	GOTO       L_interrupt18
	BTFSS      INTCON+0, 1
	GOTO       L_interrupt18
L__interrupt31:
;pp.c,76 :: 		ledBuzzer();
	CALL       _ledBuzzer+0
;pp.c,77 :: 		intcon.INTF=0;
	BCF        INTCON+0, 1
;pp.c,78 :: 		}
L_interrupt18:
;pp.c,79 :: 		if( intcon.rbif)
	BTFSS      INTCON+0, 0
	GOTO       L_interrupt19
;pp.c,81 :: 		if (PORTB.F4=1)
	BSF        PORTB+0, 4
	BTFSS      PORTB+0, 4
	GOTO       L_interrupt20
;pp.c,82 :: 		{sens_horaire();
	CALL       _sens_horaire+0
;pp.c,84 :: 		intcon.rbif=0;}
	BCF        INTCON+0, 0
L_interrupt20:
;pp.c,85 :: 		PORTC.F0=0;
	BCF        PORTC+0, 0
;pp.c,86 :: 		PORTC.F1=0;
	BCF        PORTC+0, 1
;pp.c,87 :: 		if(PORTB.F5=1)
	BSF        PORTB+0, 5
	BTFSS      PORTB+0, 5
	GOTO       L_interrupt21
;pp.c,88 :: 		{sens_antihoraire();
	CALL       _sens_antihoraire+0
;pp.c,89 :: 		intcon.rbif=0;}
	BCF        INTCON+0, 0
L_interrupt21:
;pp.c,90 :: 		PORTC.F0=0;
	BCF        PORTC+0, 0
;pp.c,91 :: 		PORTC.F1=0;
	BCF        PORTC+0, 1
;pp.c,92 :: 		}
L_interrupt19:
;pp.c,93 :: 		if(INTCON.T0IF == 1){
	BTFSS      INTCON+0, 2
	GOTO       L_interrupt22
;pp.c,95 :: 		NB--;
	MOVLW      1
	SUBWF      _NB+0, 1
	BTFSS      STATUS+0, 0
	DECF       _NB+1, 1
;pp.c,96 :: 		if (NB==0){
	MOVLW      0
	XORWF      _NB+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__interrupt42
	MOVLW      0
	XORWF      _NB+0, 0
L__interrupt42:
	BTFSS      STATUS+0, 2
	GOTO       L_interrupt23
;pp.c,98 :: 		Sound_Play(400, 250);
	MOVLW      144
	MOVWF      FARG_Sound_Play_freq_in_hz+0
	MOVLW      1
	MOVWF      FARG_Sound_Play_freq_in_hz+1
	MOVLW      250
	MOVWF      FARG_Sound_Play_duration_ms+0
	CLRF       FARG_Sound_Play_duration_ms+1
	CALL       _Sound_Play+0
;pp.c,99 :: 		NB=122;
	MOVLW      122
	MOVWF      _NB+0
	MOVLW      0
	MOVWF      _NB+1
;pp.c,100 :: 		TMR0=0;
	CLRF       TMR0+0
;pp.c,101 :: 		}INTCON.T0IF = 0;
L_interrupt23:
	BCF        INTCON+0, 2
;pp.c,102 :: 		}
L_interrupt22:
;pp.c,103 :: 		}
L_end_interrupt:
L__interrupt41:
	MOVF       ___savePCLATH+0, 0
	MOVWF      PCLATH+0
	SWAPF      ___saveSTATUS+0, 0
	MOVWF      STATUS+0
	SWAPF      R15+0, 1
	SWAPF      R15+0, 0
	RETFIE
; end of _interrupt

_main:

;pp.c,105 :: 		void main()
;pp.c,107 :: 		TRISB.F0=1;         //// declares pin number 0 of PORTB as a input pin
	BSF        TRISB+0, 0
;pp.c,108 :: 		TRISD.F6=0;         //// declares pin number 6 of PORTD as a output pin
	BCF        TRISD+0, 6
;pp.c,109 :: 		PORTD.F6 = 0; //LED OFF
	BCF        PORTD+0, 6
;pp.c,110 :: 		TRISA.F0=0;
	BCF        TRISA+0, 0
;pp.c,111 :: 		PORTA.F0=0;
	BCF        PORTA+0, 0
;pp.c,112 :: 		TRISB.F4=1; // boutton d'interruption  (declencher le moteur dans le sens horaire)
	BSF        TRISB+0, 4
;pp.c,113 :: 		TRISB.F5=1; // boutton d'interruption  (declencher le moteur dans le sens anti-horaire)
	BSF        TRISB+0, 5
;pp.c,114 :: 		TRISC.F0=0;    //MOTEUR
	BCF        TRISC+0, 0
;pp.c,115 :: 		TRISC.F1=0;    //MOTEUR
	BCF        TRISC+0, 1
;pp.c,116 :: 		PORTC.F0=0;    //MOTEUR
	BCF        PORTC+0, 0
;pp.c,117 :: 		PORTC.F1=0;    //MOTEUR
	BCF        PORTC+0, 1
;pp.c,118 :: 		TRISA.F4=1; //Capteur temperature
	BSF        TRISA+0, 4
;pp.c,119 :: 		TRISA.F2=0;
	BCF        TRISA+0, 2
;pp.c,120 :: 		PORTA.F2 = 0; //LED OFF
	BCF        PORTA+0, 2
;pp.c,121 :: 		TRISA.F3=0;
	BCF        TRISA+0, 3
;pp.c,122 :: 		PORTA.F3 = 0; //LED OFF
	BCF        PORTA+0, 3
;pp.c,123 :: 		TRISD.F7=0; //speaker
	BCF        TRISD+0, 7
;pp.c,124 :: 		lcd_init() ;
	CALL       _Lcd_Init+0
;pp.c,125 :: 		ADC_Init();
	CALL       _ADC_Init+0
;pp.c,126 :: 		Sound_Init(&PORTD,7);
	MOVLW      PORTD+0
	MOVWF      FARG_Sound_Init_snd_port+0
	MOVLW      7
	MOVWF      FARG_Sound_Init_snd_pin+0
	CALL       _Sound_Init+0
;pp.c,127 :: 		lcd_cmd(_lcd_cursor_off);
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;pp.c,128 :: 		ADCON1 = 0x8E; //configure gpio of the adc
	MOVLW      142
	MOVWF      ADCON1+0
;pp.c,130 :: 		INTCON.INTE = 1;  //enable external interrupts
	BSF        INTCON+0, 4
;pp.c,131 :: 		INTCON.GIE  = 1;  //enable Global interrupts
	BSF        INTCON+0, 7
;pp.c,132 :: 		option_reg.INTEDG =1;     //sens de transition
	BSF        OPTION_REG+0, 6
;pp.c,134 :: 		intcon.gie=1;
	BSF        INTCON+0, 7
;pp.c,135 :: 		intcon.inte=1;  //active interruption
	BSF        INTCON+0, 4
;pp.c,136 :: 		intcon.rbie=1;                 //rb0
	BSF        INTCON+0, 3
;pp.c,137 :: 		option_reg.INTEDG=1;
	BSF        OPTION_REG+0, 6
;pp.c,140 :: 		INTCON.GIE=1;              // utiliser interrupt
	BSF        INTCON+0, 7
;pp.c,141 :: 		INTCON.T0IE = 1;     //une interruption est déclenché à chaque passage du timer à 0
	BSF        INTCON+0, 5
;pp.c,142 :: 		OPTION_REG.T0CS=0;    //mode de fonct timer
	BCF        OPTION_REG+0, 5
;pp.c,143 :: 		OPTION_REG.PS0=1;
	BSF        OPTION_REG+0, 0
;pp.c,144 :: 		OPTION_REG.PS1=1;              //Les bits de configuration de la valeur du prédiviseur  ( 256 )
	BSF        OPTION_REG+0, 1
;pp.c,145 :: 		OPTION_REG.PS2=1;
	BSF        OPTION_REG+0, 2
;pp.c,146 :: 		OPTION_REG.PSA=0;
	BCF        OPTION_REG+0, 3
;pp.c,147 :: 		TMR0=0;
	CLRF       TMR0+0
;pp.c,148 :: 		NB=122;
	MOVLW      122
	MOVWF      _NB+0
	MOVLW      0
	MOVWF      _NB+1
;pp.c,150 :: 		lcd_out(1, 1, "AMAL");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr1_pp+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;pp.c,151 :: 		lcd_out(2, 1, "Have A Good Day");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr2_pp+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;pp.c,153 :: 		delay_ms(1000);
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L_main24:
	DECFSZ     R13+0, 1
	GOTO       L_main24
	DECFSZ     R12+0, 1
	GOTO       L_main24
	DECFSZ     R11+0, 1
	GOTO       L_main24
	NOP
	NOP
;pp.c,154 :: 		lcd_Cmd(_LCD_CLEAR);             // clear LCD
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;pp.c,160 :: 		while(1)
L_main25:
;pp.c,162 :: 		Temp= ADC_Read(1);  // * 5 / 1023; //Read analog voltage and convert to digital
	MOVLW      1
	MOVWF      FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	CALL       _word2double+0
	MOVF       R0+0, 0
	MOVWF      _Temp+0
	MOVF       R0+1, 0
	MOVWF      _Temp+1
	MOVF       R0+2, 0
	MOVWF      _Temp+2
	MOVF       R0+3, 0
	MOVWF      _Temp+3
;pp.c,164 :: 		Temp1 = temp * 0.489;   //  convert it to degree Celsius (0.489 = 500/1023)
	MOVLW      53
	MOVWF      R4+0
	MOVLW      94
	MOVWF      R4+1
	MOVLW      122
	MOVWF      R4+2
	MOVLW      125
	MOVWF      R4+3
	CALL       _Mul_32x32_FP+0
	MOVF       R0+0, 0
	MOVWF      _Temp1+0
	MOVF       R0+1, 0
	MOVWF      _Temp1+1
	MOVF       R0+2, 0
	MOVWF      _Temp1+2
	MOVF       R0+3, 0
	MOVWF      _Temp1+3
;pp.c,166 :: 		IntToStr(Temp1,Temperature);
	CALL       _double2int+0
	MOVF       R0+0, 0
	MOVWF      FARG_IntToStr_input+0
	MOVF       R0+1, 0
	MOVWF      FARG_IntToStr_input+1
	MOVLW      _Temperature+0
	MOVWF      FARG_IntToStr_output+0
	CALL       _IntToStr+0
;pp.c,168 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;pp.c,169 :: 		lcd_out(1, 1, "Temperature:");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr3_pp+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;pp.c,170 :: 		lcd_out(2, 3, Temperature);              // Display LM35 temperature result
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      3
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _Temperature+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;pp.c,172 :: 		delay_ms(1000);
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L_main27:
	DECFSZ     R13+0, 1
	GOTO       L_main27
	DECFSZ     R12+0, 1
	GOTO       L_main27
	DECFSZ     R11+0, 1
	GOTO       L_main27
	NOP
	NOP
;pp.c,173 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;pp.c,207 :: 		write_text_frm_eeprom(0x00,0x0F,1,1,"Ebixa 10mg 2/J");
	CLRF       FARG_write_text_frm_eeprom_start_address+0
	CLRF       FARG_write_text_frm_eeprom_start_address+1
	MOVLW      15
	MOVWF      FARG_write_text_frm_eeprom_end_address+0
	MOVLW      0
	MOVWF      FARG_write_text_frm_eeprom_end_address+1
	MOVLW      1
	MOVWF      FARG_write_text_frm_eeprom_row+0
	MOVLW      1
	MOVWF      FARG_write_text_frm_eeprom_colum+0
	MOVLW      ?lstr4_pp+0
	MOVWF      FARG_write_text_frm_eeprom_txt+0
	CALL       _write_text_frm_eeprom+0
;pp.c,208 :: 		write_text_frm_eeprom(0x10,0x1F,2,1,"Aricept 10mg 3/J");
	MOVLW      16
	MOVWF      FARG_write_text_frm_eeprom_start_address+0
	MOVLW      0
	MOVWF      FARG_write_text_frm_eeprom_start_address+1
	MOVLW      31
	MOVWF      FARG_write_text_frm_eeprom_end_address+0
	MOVLW      0
	MOVWF      FARG_write_text_frm_eeprom_end_address+1
	MOVLW      2
	MOVWF      FARG_write_text_frm_eeprom_row+0
	MOVLW      1
	MOVWF      FARG_write_text_frm_eeprom_colum+0
	MOVLW      ?lstr5_pp+0
	MOVWF      FARG_write_text_frm_eeprom_txt+0
	CALL       _write_text_frm_eeprom+0
;pp.c,209 :: 		disp_text_frm_eeprom(0x00,0x0F,1,1);
	CLRF       FARG_disp_text_frm_eeprom_start_address+0
	CLRF       FARG_disp_text_frm_eeprom_start_address+1
	MOVLW      15
	MOVWF      FARG_disp_text_frm_eeprom_end_address+0
	MOVLW      0
	MOVWF      FARG_disp_text_frm_eeprom_end_address+1
	MOVLW      1
	MOVWF      FARG_disp_text_frm_eeprom_row+0
	MOVLW      1
	MOVWF      FARG_disp_text_frm_eeprom_colum+0
	CALL       _disp_text_frm_eeprom+0
;pp.c,210 :: 		disp_text_frm_eeprom(0x10,0x1F,2,1);
	MOVLW      16
	MOVWF      FARG_disp_text_frm_eeprom_start_address+0
	MOVLW      0
	MOVWF      FARG_disp_text_frm_eeprom_start_address+1
	MOVLW      31
	MOVWF      FARG_disp_text_frm_eeprom_end_address+0
	MOVLW      0
	MOVWF      FARG_disp_text_frm_eeprom_end_address+1
	MOVLW      2
	MOVWF      FARG_disp_text_frm_eeprom_row+0
	MOVLW      1
	MOVWF      FARG_disp_text_frm_eeprom_colum+0
	CALL       _disp_text_frm_eeprom+0
;pp.c,211 :: 		delay_ms(500);
	MOVLW      3
	MOVWF      R11+0
	MOVLW      138
	MOVWF      R12+0
	MOVLW      85
	MOVWF      R13+0
L_main28:
	DECFSZ     R13+0, 1
	GOTO       L_main28
	DECFSZ     R12+0, 1
	GOTO       L_main28
	DECFSZ     R11+0, 1
	GOTO       L_main28
	NOP
	NOP
;pp.c,224 :: 		if(Temp1>37){
	MOVF       _Temp1+0, 0
	MOVWF      R4+0
	MOVF       _Temp1+1, 0
	MOVWF      R4+1
	MOVF       _Temp1+2, 0
	MOVWF      R4+2
	MOVF       _Temp1+3, 0
	MOVWF      R4+3
	MOVLW      0
	MOVWF      R0+0
	MOVLW      0
	MOVWF      R0+1
	MOVLW      20
	MOVWF      R0+2
	MOVLW      132
	MOVWF      R0+3
	CALL       _Compare_Double+0
	MOVLW      1
	BTFSC      STATUS+0, 0
	MOVLW      0
	MOVWF      R0+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main29
;pp.c,225 :: 		PORTA.F2=1;
	BSF        PORTA+0, 2
;pp.c,227 :: 		}
L_main29:
;pp.c,229 :: 		if(Temp1<37){
	MOVLW      0
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVLW      20
	MOVWF      R4+2
	MOVLW      132
	MOVWF      R4+3
	MOVF       _Temp1+0, 0
	MOVWF      R0+0
	MOVF       _Temp1+1, 0
	MOVWF      R0+1
	MOVF       _Temp1+2, 0
	MOVWF      R0+2
	MOVF       _Temp1+3, 0
	MOVWF      R0+3
	CALL       _Compare_Double+0
	MOVLW      1
	BTFSC      STATUS+0, 0
	MOVLW      0
	MOVWF      R0+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main30
;pp.c,230 :: 		PORTA.F3=1;
	BSF        PORTA+0, 3
;pp.c,233 :: 		}
L_main30:
;pp.c,234 :: 		}}
	GOTO       L_main25
L_end_main:
	GOTO       $+0
; end of _main
