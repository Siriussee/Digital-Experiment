`timescale 1ns / 1ps

module clock_alarm (
input wire [1:0] choose, //选择时钟显示的内容
input wire clk, //输入的 W5接口的 100MHz的时钟 
input wire clr, //暂停记时 
input wire rst, //清零显示，清零闹钟 
input wire set, //时间设置 
input wire set_hour, //选择设置小时位 
input wire set_minute, //选择设置分钟位 
input wire plus, //时间 + 
input wire alarm_begin, //闹钟开关 
input wire alarm, //闹钟模式 
input wire fastMode, //一秒变快了
output reg [6:0] a_to_g, //数码管的七段 
output reg [3:0] an, //显示屏的位置 
output reg [3:0] led, //闹钟到点时的显示 led 
output reg [3:0] led_screen //第几屏

);
reg clk1; //频率为 1s的时钟 
reg [7:0] year; //年，[7:4]为第三位，[3:0]为第四位
reg [7:0] month; //月，[7:4]为十位，[3:0]为个位
reg [7:0] day; //日，[7:4]为十位，[3:0]为个位
reg [7:0] hour; //小时，[7:4]为小时的十位，[3:0]为小时的个位 
reg [7:0] minute; //分钟，[7:4]为分钟的十位，[3:0]为分钟的个位 
reg [7:0] second; //秒，[7:4]为秒的十位，[3:0]为秒的个位 

reg [7:0] alarm_hour; //闹钟的小时 
reg [7:0] alarm_minute; //闹钟的分钟 
reg [7:0] alarm_second; //闹钟的秒 

wire [1:0] s; //扫码显示用频率 
wire [1:0] l; //闹钟led显示用频率 
reg [3:0] digit; //数码管 
reg [19:0] clkdiv; //分频 
wire [3:0] aen; 
integer i; //生成1s的时间 

assign aen = 4'b1111;

/****************生成 1s 的时钟clk1****************************/ 
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
                        clk1=~clk1;  //秒表频率1Hz
                        i <= 0;
                    end
                    else
                        i <= i+1;  
                end
                if(fastMode == 1)
               begin
                   if(i ==4999)
                   begin
                        clk1=~clk1;  //秒表频率10kHz
                        i <= 0;
                   end
                   else
                        i <= i+1;  
               end
                  
        end
	end
/**********************分频，用于生成s和l *******************/ 
always @ (posedge clk or posedge clr)
	begin
		if (clr == 1)
			clkdiv <= 0;
		else
			clkdiv <= clkdiv + 1;
	end

assign s = clkdiv[19:18];
assign l = clkdiv[17:16];
/**********************多功能时钟****************************/ 
always @ (posedge clk1 )
begin
    if ( rst == 1)  //清零功能 ,月日置01，其余全部置0
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
/******************** 正常计时 ******************************/

	    second[3:0] <= second[3:0] + 4'b0001;	//秒的个位+1
	        
	    if(second[3:0]==4'b1001)                //秒个位到9，个位变0，十位加1
        begin
            second[3:0] <= 4'b0000;
            second[7:4] <= second[7:4] + 4'b0001;
        end 
        
	    if(second[7:4] == 4'b0101 && second[3:0] ==4'b1001)    //秒到59，全部变0，分个位加1
        begin
            second[7:4] <= 4'b0000;
            minute[3:0] <= minute[3:0] + 4'b0001;
        end
        
	    if(minute[3:0] == 4'b1001)             //分个位到9，个位变0，十位加1
        begin
            minute[3:0] <= 4'b0000;
            minute[7:4] <= minute[7:4] + 4'b0001;
        end
        
	    if(minute[7:4]==4'b0101 && minute[3:0]==4'b1001)//分到59，全部变0，分个位加1
        begin
            minute[7:4] <= 4'b0000;
            hour[3:0] <= hour[3:0] +4'b0001;
        end
        
	    if(hour[3:0]==4'b1001)              //分个位到9，个位变0，十位加1
        begin
            hour[3:0] <= 4'b0000;
            hour[7:4] <=hour[7:4]+4'b0001;
        end
        
	    if(hour[7:4]==4'b0010 && hour[3:0]==4'b0100)   //时到24，全部变0，日个位++
        begin
            hour[3:0]<=4'b0000;
            hour[7:4]<=4'b0000;
            day[3:0]<= day[3:0]+4'b0001;
        end
        
         if(day[3:0]==4'b1001)   //日=9，个位变0，十位加1
         begin
             day[3:0]<=4'b0000;
             day[7:4]<= day[7:4] + 4'b0001;
         end
         
         if( day[7:4]==4'b0011 && day[3:0]==4'b0000)   //日到30，全部变0，月个位++
         begin
                     day[3:0]<=4'b0000;
                     day[7:4]<=4'b0000;
                     month[3:0]<= month[3:0]+4'b0001;
         end
          if(month[3:0]==4'b1001)   //月=9，个位变0，十位加1
          begin
                     month[3:0]<=4'b0000;
                     month[7:4]<= day[7:4] + 4'b0001;
          end
          if( month[7:4]==4'b0001 && month[3:0]==4'b0010)   //月到12，全部变0，年个位++
          begin
                month[3:0]<=4'b0000;
                month[7:4]<=4'b0000;
                year[3:0]<= year[3:0]+4'b0001;
          end
          
           if(year[3:0]==4'b1001)   //年=9，个位变0，十位加1
           begin
               year[3:0]<=4'b0000;
               year[7:4]<= day[7:4] + 4'b0001;
           end
           
            if( year[7:4]==4'b1001 && year[3:0]==4'b1001)   //年到99，全部变0，
            begin
                 year[3:0]<=4'b0000;
                 year[7:4]<=4'b0000;
            end
         
 /******************时间设置************************/       
 	    if (set == 1)
        begin
            if(set_hour == 1 && set_minute == 0)
            begin
                if (plus == 1)
                begin
                    hour[3:0] <= hour[3:0] + 4'b0001;
                    if(hour[3:0]==4'b1001)  //时低位
                    begin
                        hour[3:0] <= 4'b0000;
                        hour[7:4] <=hour[7:4]+4'b0001;
                    end
                    if(hour[7:4]==4'b0010 && hour[3:0]==4'b0100)    //时高位
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
                    if(minute[3:0] == 4'b1001)  //分低位
                    begin
                        minute[3:0] <= 4'b0000;
                        minute[7:4] <= minute[7:4] + 4'b0001;
                    end
                    if(minute[7:4]==4'b0101 && minute[3:0]==4'b1001)   //分高位
                    begin
                        minute[3:0] <= 4'b0000;
                        minute[7:4] <= 4'b0000;    
                    end
                end
            end
        end       
/********************闹钟设置*********************/        
	    if(alarm == 1)
        begin 
            if(set_hour == 1 && set_minute == 0)
            begin
                if (plus == 1)
                begin
                    alarm_hour[3:0] <= alarm_hour[3:0] + 4'b0001;
                    if(alarm_hour[3:0]==4'b1001)  //时低位
                    begin
                        alarm_hour[3:0] <= 4'b0000;
                        alarm_hour[7:4] <= alarm_hour[7:4]+4'b0001;
                    end
                    if(alarm_hour[7:4]==4'b0010 && alarm_hour[3:0]==4'b0100)   //时高位
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
                    if(alarm_minute[3:0] == 4'b1001)  //分低位
                    begin
                        alarm_minute[3:0] <= 4'b0000;
                        alarm_minute[7:4] <= alarm_minute[7:4] + 4'b0001;
                    end
                    if(alarm_minute[7:4]==4'b0101 && alarm_minute[3:0]==4'b1001)    //分高位
                    begin
                        alarm_minute[3:0] <= 4'b0000;
                        alarm_minute[7:4] <= 4'b0000;    
                    end
                end 
            end
/*******************闹钟响应**********************/
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
/*****************选择显示模式：正常计时 or 闹钟界面******************/ 
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
/****************数码管显示*****************************/ 
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
/******************显示位置扫描**************************/ 
always @ ( * )
    begin
        an = 4'b1111;
        if (aen[s] == 1)    //s：0-3变换的CLK
        an[s] = 0;
    end
endmodule
