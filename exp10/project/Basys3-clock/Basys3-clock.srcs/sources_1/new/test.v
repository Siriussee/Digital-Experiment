`timescale 1ns / 1ps

module clock_alarm (
input wire [1:0] choose, //ѡ��ʱ����ʾ������
input wire clk, //����� W5�ӿڵ� 100MHz��ʱ�� 
input wire clr, //��ͣ��ʱ 
input wire rst, //������ʾ���������� 
input wire set, //ʱ������ 
input wire set_hour, //ѡ������Сʱλ 
input wire set_minute, //ѡ�����÷���λ 
input wire plus, //ʱ�� + 
input wire alarm_begin, //���ӿ��� 
input wire alarm, //����ģʽ 
input wire fastMode, //һ������
output reg [6:0] a_to_g, //����ܵ��߶� 
output reg [3:0] an, //��ʾ����λ�� 
output reg [3:0] led, //���ӵ���ʱ����ʾ led 
output reg [3:0] led_screen //�ڼ���

);
reg clk1; //Ƶ��Ϊ 1s��ʱ�� 
reg [7:0] year; //�꣬[7:4]Ϊ����λ��[3:0]Ϊ����λ
reg [7:0] month; //�£�[7:4]Ϊʮλ��[3:0]Ϊ��λ
reg [7:0] day; //�գ�[7:4]Ϊʮλ��[3:0]Ϊ��λ
reg [7:0] hour; //Сʱ��[7:4]ΪСʱ��ʮλ��[3:0]ΪСʱ�ĸ�λ 
reg [7:0] minute; //���ӣ�[7:4]Ϊ���ӵ�ʮλ��[3:0]Ϊ���ӵĸ�λ 
reg [7:0] second; //�룬[7:4]Ϊ���ʮλ��[3:0]Ϊ��ĸ�λ 

reg [7:0] alarm_hour; //���ӵ�Сʱ 
reg [7:0] alarm_minute; //���ӵķ��� 
reg [7:0] alarm_second; //���ӵ��� 

wire [1:0] s; //ɨ����ʾ��Ƶ�� 
wire [1:0] l; //����led��ʾ��Ƶ�� 
reg [3:0] digit; //����� 
reg [19:0] clkdiv; //��Ƶ 
wire [3:0] aen; 
integer i; //����1s��ʱ�� 

assign aen = 4'b1111;

/****************���� 1s ��ʱ��clk1****************************/ 
always @ (posedge clk or posedge clr)
	begin
		if (clr == 1)
                i <= 0;
        else
        begin
                if(fastMode == 0)
                begin
                    if(i == 49999999)
                    begin
                        clk1=~clk1;  //���Ƶ��1Hz
                        i <= 0;
                    end
                    else
                        i <= i+1;  
                end
                if(fastMode == 1)
               begin
                   if(i ==4999)
                   begin
                        clk1=~clk1;  //���Ƶ��10kHz
                        i <= 0;
                   end
                   else
                        i <= i+1;  
               end
                  
        end
	end
/**********************��Ƶ����������s��l *******************/ 
always @ (posedge clk or posedge clr)
	begin
		if (clr == 1)
			clkdiv <= 0;
		else
			clkdiv <= clkdiv + 1;
	end

assign s = clkdiv[19:18];
assign l = clkdiv[17:16];
/**********************�๦��ʱ��****************************/ 
always @ (posedge clk1 )
begin
    if ( rst == 1)  //���㹦�� ,������01������ȫ����0
    begin 
        year[7:0] <= 0;
        month[7:4] <= 0;
        month[3:0] <= 4'b0001;
        day[7:4] <= 0;
        day[3:0] <= 4'b0001;
        hour[7:0] <= 0;
        minute[7:0] <= 0;
        second[7:0] <= 0;
        alarm_hour[7:0] <= 0;
        alarm_minute[7:0] <= 0;
        alarm_second[7:0] <= 0;
        led <= 4'b0000;
    end
    else
    begin
/******************** ������ʱ ******************************/

	    second[3:0] <= second[3:0] + 4'b0001;	//��ĸ�λ+1
	        
	    if(second[3:0]==4'b1001)                //���λ��9����λ��0��ʮλ��1
        begin
            second[3:0] <= 4'b0000;
            second[7:4] <= second[7:4] + 4'b0001;
        end 
        
	    if(second[7:4] == 4'b0101 && second[3:0] ==4'b1001)    //�뵽59��ȫ����0���ָ�λ��1
        begin
            second[7:4] <= 4'b0000;
            minute[3:0] <= minute[3:0] + 4'b0001;
        end
        
	    if(minute[3:0] == 4'b1001)             //�ָ�λ��9����λ��0��ʮλ��1
        begin
            minute[3:0] <= 4'b0000;
            minute[7:4] <= minute[7:4] + 4'b0001;
        end
        
	    if(minute[7:4]==4'b0101 && minute[3:0]==4'b1001)//�ֵ�59��ȫ����0���ָ�λ��1
        begin
            minute[7:4] <= 4'b0000;
            hour[3:0] <= hour[3:0] +4'b0001;
        end
        
	    if(hour[3:0]==4'b1001)              //�ָ�λ��9����λ��0��ʮλ��1
        begin
            hour[3:0] <= 4'b0000;
            hour[7:4] <=hour[7:4]+4'b0001;
        end
        
	    if(hour[7:4]==4'b0010 && hour[3:0]==4'b0100)   //ʱ��24��ȫ����0���ո�λ++
        begin
            hour[3:0]<=4'b0000;
            hour[7:4]<=4'b0000;
            day[3:0]<= day[3:0]+4'b0001;
        end
        
         if(day[3:0]==4'b1001)   //��=9����λ��0��ʮλ��1
         begin
             day[3:0]<=4'b0000;
             day[7:4]<= day[7:4] + 4'b0001;
         end
         
         if( day[7:4]==4'b0011 && day[3:0]==4'b0000)   //�յ�30��ȫ����0���¸�λ++
         begin
                     day[3:0]<=4'b0000;
                     day[7:4]<=4'b0000;
                     month[3:0]<= month[3:0]+4'b0001;
         end
          if(month[3:0]==4'b1001)   //��=9����λ��0��ʮλ��1
          begin
                     month[3:0]<=4'b0000;
                     month[7:4]<= day[7:4] + 4'b0001;
          end
          if( month[7:4]==4'b0001 && month[3:0]==4'b0010)   //�µ�12��ȫ����0�����λ++
          begin
                month[3:0]<=4'b0000;
                month[7:4]<=4'b0000;
                year[3:0]<= year[3:0]+4'b0001;
          end
          
           if(year[3:0]==4'b1001)   //��=9����λ��0��ʮλ��1
           begin
               year[3:0]<=4'b0000;
               year[7:4]<= day[7:4] + 4'b0001;
           end
           
            if( year[7:4]==4'b1001 && year[3:0]==4'b1001)   //�굽99��ȫ����0��
            begin
                 year[3:0]<=4'b0000;
                 year[7:4]<=4'b0000;
            end
         
 /******************ʱ������************************/       
 	    if (set == 1)
        begin
            if(set_hour == 1 && set_minute == 0)
            begin
                if (plus == 1)
                begin
                    hour[3:0] <= hour[3:0] + 4'b0001;
                    if(hour[3:0]==4'b1001)  //ʱ��λ
                    begin
                        hour[3:0] <= 4'b0000;
                        hour[7:4] <=hour[7:4]+4'b0001;
                    end
                    if(hour[7:4]==4'b0010 && hour[3:0]==4'b0100)    //ʱ��λ
                    begin
                        hour[3:0]<=4'b0000;
                        hour[7:4]<=4'b0000;
                    end
                end
            end
            if(set_minute == 1 && set_hour == 0)
            begin
                if(plus == 1)
                begin
                    minute[3:0] <= minute[3:0] + 4'b0001;
                    if(minute[3:0] == 4'b1001)  //�ֵ�λ
                    begin
                        minute[3:0] <= 4'b0000;
                        minute[7:4] <= minute[7:4] + 4'b0001;
                    end
                    if(minute[7:4]==4'b0101 && minute[3:0]==4'b1001)   //�ָ�λ
                    begin
                        minute[3:0] <= 4'b0000;
                        minute[7:4] <= 4'b0000;    
                    end
                end
            end
        end       
/********************��������*********************/        
	    if(alarm == 1)
        begin 
            if(set_hour == 1 && set_minute == 0)
            begin
                if (plus == 1)
                begin
                    alarm_hour[3:0] <= alarm_hour[3:0] + 4'b0001;
                    if(alarm_hour[3:0]==4'b1001)  //ʱ��λ
                    begin
                        alarm_hour[3:0] <= 4'b0000;
                        alarm_hour[7:4] <= alarm_hour[7:4]+4'b0001;
                    end
                    if(alarm_hour[7:4]==4'b0010 && alarm_hour[3:0]==4'b0100)   //ʱ��λ
                    begin
                        alarm_hour[3:0]<=4'b0000;
                        alarm_hour[7:4]<=4'b0000;
                    end
                end
            end 
            end   
            if(set_minute == 1 && set_hour == 0)
            begin
                if(plus == 1)
                begin
                    alarm_minute[3:0] <= alarm_minute[3:0] + 4'b0001;
                    if(alarm_minute[3:0] == 4'b1001)  //�ֵ�λ
                    begin
                        alarm_minute[3:0] <= 4'b0000;
                        alarm_minute[7:4] <= alarm_minute[7:4] + 4'b0001;
                    end
                    if(alarm_minute[7:4]==4'b0101 && alarm_minute[3:0]==4'b1001)    //�ָ�λ
                    begin
                        alarm_minute[3:0] <= 4'b0000;
                        alarm_minute[7:4] <= 4'b0000;    
                    end
                end 
            end
/*******************������Ӧ**********************/
        if (alarm_begin == 1)
        begin
            if (hour[3:0] == alarm_hour[3:0] && hour[7:4] == alarm_hour[7:4] && minute[7:4] == alarm_minute[7:4] && minute[3:0] == alarm_minute[3:0])
            begin
              case (l)
                0: led = 4'b0001;
                1: led = 4'b0011;
                2: led = 4'b0111;
                3: led = 4'b1111;
            	default: led <= 0;
            	endcase  
            end
            else
            begin
                led = 4'b0000;
            end
        end
        if (alarm_begin == 0)
        begin led = 4'b0000; end
    end        
end 
/*****************ѡ����ʾģʽ��������ʱ or ���ӽ���******************/ 
always @ ( * )
    begin
	if (choose == 0)   //ss00
	begin
        led_screen = 4'b0001;
	   case (s)
			0: digit = 0;
			1: digit = 0;
			2: digit = second[3:0];
			3: digit = second[7:4];
		default: digit <= second[3:0];
		endcase
	end
		
    if (choose == 1)    //hhmm
    begin
       led_screen = 4'b0010;
		case (s)
			0: digit = minute[3:0];
			1: digit = minute[7:4];
			2: digit = hour[3:0];
			3: digit = hour[7:4];
        default: digit <= minute[3:0];
        endcase
    end
    
    if (choose == 2)    //mmdd
    begin
       led_screen = 4'b0100;
    	case (s)
    		0: digit = day[3:0];
			1: digit = day[7:4];
			2: digit = month[3:0];
			3: digit = month[7:4];
		default: digit <= day[3:0];
		endcase
	end
		
	 if (choose == 3)  //yyyy
	 begin
	   led_screen = 4'b1000;
         case (s)
            0: digit = year[3:0];
            1: digit = year[7:4];
            2: digit = 0;
            3: digit = 2;
        default: digit <= day[3:0];
        endcase
    end
end
/****************�������ʾ*****************************/ 
always @ ( * )
	case (digit)
		0: a_to_g = 7'b0000001;
		1: a_to_g = 7'b1001111;
		2: a_to_g = 7'b0010010;
		3: a_to_g = 7'b0000110;
		4: a_to_g = 7'b1001100;
		5: a_to_g = 7'b0100100;
		6: a_to_g = 7'b0100000;
		7: a_to_g = 7'b0001111;
		8: a_to_g = 7'b0000000;
		9: a_to_g = 7'b0000100;
		default: a_to_g = 7'b0000001; // 0
	endcase
/******************��ʾλ��ɨ��**************************/ 
always @ ( * )
    begin
        an = 4'b1111;
        if (aen[s] == 1)    //s��0-3�任��CLK
        an[s] = 0;
    end
endmodule
