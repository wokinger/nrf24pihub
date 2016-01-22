
USER_HOME_DIR=/home/pi


picture_width=1000
picture_height=600
limit_max_temperature=35    
limit_min_temperature=10
limit_max_humidity=70
limit_min_humidity=20
limit_max_pressure=103500
limit_min_pressure=98000

common_graph_settings="	--rigid \
                        --width $picture_width \
                    	--height $picture_height \
                    	"	


rrdtool graph \
	$USER_HOME_DIR/pics/Weatherstation_monthly.png   \
	--title "Weatherstation" \
	--vertical-label 'degC, %humidity' \
	-s 'now - 1 month' -e 'now'   \
	--lower-limit   0 \
	--upper-limit 100 \
    $common_graph_settings \
  	DEF:temp=$USER_HOME_DIR/Weatherstation.rrd:temp:AVERAGE   \
  	DEF:temp0=$USER_HOME_DIR/Weatherstation.rrd:temp0:AVERAGE   \
	DEF:temp1=$USER_HOME_DIR/Weatherstation.rrd:temp1:AVERAGE   \
  	DEF:temp2=$USER_HOME_DIR/Weatherstation.rrd:temp2:AVERAGE   \
	DEF:temp3=$USER_HOME_DIR/Weatherstation.rrd:temp3:AVERAGE   \
	DEF:temp4=$USER_HOME_DIR/Weatherstation.rrd:temp4:AVERAGE   \
    DEF:humid=$USER_HOME_DIR/Weatherstation.rrd:humid:AVERAGE   \
    DEF:humid0=$USER_HOME_DIR/Weatherstation.rrd:humid0:AVERAGE   \
	DEF:humid1=$USER_HOME_DIR/Weatherstation.rrd:humid1:AVERAGE   \
	DEF:humid2=$USER_HOME_DIR/Weatherstation.rrd:humid2:AVERAGE   \
	DEF:humid3=$USER_HOME_DIR/Weatherstation.rrd:humid3:AVERAGE   \
	DEF:humid4=$USER_HOME_DIR/Weatherstation.rrd:humid4:AVERAGE   \
    DEF:voltage0=$USER_HOME_DIR/Weatherstation.rrd:voltage0:AVERAGE   \
	DEF:voltage1=$USER_HOME_DIR/Weatherstation.rrd:voltage1:AVERAGE   \
	DEF:voltage2=$USER_HOME_DIR/Weatherstation.rrd:voltage2:AVERAGE   \
	DEF:voltage3=$USER_HOME_DIR/Weatherstation.rrd:voltage3:AVERAGE   \
	DEF:voltage4=$USER_HOME_DIR/Weatherstation.rrd:voltage4:AVERAGE   \
	LINE0:temp#B7B4D5:temp \
	LINE1:temp0#9891D7:temp0 \
 	LINE2:temp1#7F76D5:T_Schlafzimmer   \
	LINE3:temp2#695DD5:T_Badezimmer \
 	LINE4:temp3#4838D5:T_Wohnzimmer   \
 	LINE5:temp4#220FD2:T_Babyzimmer   \
 	LINE6:humid#DBFFDA:Humidity   \
 	LINE7:humid0#BBFDBA:Humidity0   \
 	LINE8:humid1#96FC94:H_Schlafzimmer   \
 	LINE9:humid2#75FB73:H_Badezimmer   \
 	LINE10:humid3#51FC4E:H_Wohnzimmer   \
 	LINE11:humid4#26FD22:H_Babyzimmer   \
 	LINE12:voltage0#FEEDCF:Voltage0   \
 	LINE13:voltage1#FDDCA3:V_Schlafzimmer   \
 	LINE14:voltage2#FCCC79:V_Badezimmer   \
 	LINE15:voltage3#FEB83E:V_Wohnzimmer   \
 	LINE16:voltage4#FEA101:V_Babyzimmer   
 	
rrdtool graph \
	$USER_HOME_DIR/pics/Weatherstation_yearly.png   \
	--title "Weatherstation" \
	--vertical-label 'degC, %humidity' \
	-s 'now - 1 year' -e 'now'   \
	--lower-limit   0 \
	--upper-limit 100 \
    $common_graph_settings \
  	DEF:temp=$USER_HOME_DIR/Weatherstation.rrd:temp:AVERAGE   \
  	DEF:temp0=$USER_HOME_DIR/Weatherstation.rrd:temp0:AVERAGE   \
	DEF:temp1=$USER_HOME_DIR/Weatherstation.rrd:temp1:AVERAGE   \
  	DEF:temp2=$USER_HOME_DIR/Weatherstation.rrd:temp2:AVERAGE   \
	DEF:temp3=$USER_HOME_DIR/Weatherstation.rrd:temp3:AVERAGE   \
	DEF:temp4=$USER_HOME_DIR/Weatherstation.rrd:temp4:AVERAGE   \
    DEF:humid=$USER_HOME_DIR/Weatherstation.rrd:humid:AVERAGE   \
    DEF:humid0=$USER_HOME_DIR/Weatherstation.rrd:humid0:AVERAGE   \
	DEF:humid1=$USER_HOME_DIR/Weatherstation.rrd:humid1:AVERAGE   \
	DEF:humid2=$USER_HOME_DIR/Weatherstation.rrd:humid2:AVERAGE   \
	DEF:humid3=$USER_HOME_DIR/Weatherstation.rrd:humid3:AVERAGE   \
	DEF:humid4=$USER_HOME_DIR/Weatherstation.rrd:humid4:AVERAGE   \
    DEF:voltage0=$USER_HOME_DIR/Weatherstation.rrd:voltage0:AVERAGE   \
	DEF:voltage1=$USER_HOME_DIR/Weatherstation.rrd:voltage1:AVERAGE   \
	DEF:voltage2=$USER_HOME_DIR/Weatherstation.rrd:voltage2:AVERAGE   \
	DEF:voltage3=$USER_HOME_DIR/Weatherstation.rrd:voltage3:AVERAGE   \
	DEF:voltage4=$USER_HOME_DIR/Weatherstation.rrd:voltage4:AVERAGE   \
	LINE0:temp#B7B4D5:temp \
	LINE1:temp0#9891D7:temp0 \
 	LINE2:temp1#7F76D5:T_Schlafzimmer   \
	LINE3:temp2#695DD5:T_Badezimmer \
 	LINE4:temp3#4838D5:T_Wohnzimmer   \
 	LINE5:temp4#220FD2:T_Babyzimmer   \
 	LINE6:humid#DBFFDA:Humidity   \
 	LINE7:humid0#BBFDBA:Humidity0   \
 	LINE8:humid1#96FC94:H_Schlafzimmer   \
 	LINE9:humid2#75FB73:H_Badezimmer   \
 	LINE10:humid3#51FC4E:H_Wohnzimmer   \
 	LINE11:humid4#26FD22:H_Babyzimmer   \
 	LINE12:voltage0#FEEDCF:Voltage0   \
 	LINE13:voltage1#FDDCA3:V_Schlafzimmer   \
 	LINE14:voltage2#FCCC79:V_Badezimmer   \
 	LINE15:voltage3#FEB83E:V_Wohnzimmer   \
 	LINE16:voltage4#FEA101:V_Babyzimmer   

rrdtool graph \
	$USER_HOME_DIR/pics/Weatherstation_daily.png   \
	--title "Weatherstation" \
	--vertical-label 'degC, %humidity' \
	-s 'now - 1 day' -e 'now'   \
	--lower-limit   0 \
	--upper-limit 100 \
    $common_graph_settings \
  	DEF:temp=$USER_HOME_DIR/Weatherstation.rrd:temp:AVERAGE   \
  	DEF:temp0=$USER_HOME_DIR/Weatherstation.rrd:temp0:AVERAGE   \
	DEF:temp1=$USER_HOME_DIR/Weatherstation.rrd:temp1:AVERAGE   \
  	DEF:temp2=$USER_HOME_DIR/Weatherstation.rrd:temp2:AVERAGE   \
	DEF:temp3=$USER_HOME_DIR/Weatherstation.rrd:temp3:AVERAGE   \
	DEF:temp4=$USER_HOME_DIR/Weatherstation.rrd:temp4:AVERAGE   \
    DEF:humid=$USER_HOME_DIR/Weatherstation.rrd:humid:AVERAGE   \
    DEF:humid0=$USER_HOME_DIR/Weatherstation.rrd:humid0:AVERAGE   \
	DEF:humid1=$USER_HOME_DIR/Weatherstation.rrd:humid1:AVERAGE   \
	DEF:humid2=$USER_HOME_DIR/Weatherstation.rrd:humid2:AVERAGE   \
	DEF:humid3=$USER_HOME_DIR/Weatherstation.rrd:humid3:AVERAGE   \
	DEF:humid4=$USER_HOME_DIR/Weatherstation.rrd:humid4:AVERAGE   \
    DEF:voltage0=$USER_HOME_DIR/Weatherstation.rrd:voltage0:AVERAGE   \
	DEF:voltage1=$USER_HOME_DIR/Weatherstation.rrd:voltage1:AVERAGE   \
	DEF:voltage2=$USER_HOME_DIR/Weatherstation.rrd:voltage2:AVERAGE   \
	DEF:voltage3=$USER_HOME_DIR/Weatherstation.rrd:voltage3:AVERAGE   \
	DEF:voltage4=$USER_HOME_DIR/Weatherstation.rrd:voltage4:AVERAGE   \
	LINE0:temp#B7B4D5:temp \
	LINE1:temp0#9891D7:temp0 \
 	LINE2:temp1#7F76D5:T_Schlafzimmer   \
	LINE3:temp2#695DD5:T_Badezimmer \
 	LINE4:temp3#4838D5:T_Wohnzimmer   \
 	LINE5:temp4#220FD2:T_Babyzimmer   \
 	LINE6:humid#DBFFDA:Humidity   \
 	LINE7:humid0#BBFDBA:Humidity0   \
 	LINE8:humid1#96FC94:H_Schlafzimmer   \
 	LINE9:humid2#75FB73:H_Badezimmer   \
 	LINE10:humid3#51FC4E:H_Wohnzimmer   \
 	LINE11:humid4#26FD22:H_Babyzimmer   \
 	LINE12:voltage0#FEEDCF:Voltage0   \
 	LINE13:voltage1#FDDCA3:V_Schlafzimmer   \
 	LINE14:voltage2#FCCC79:V_Badezimmer   \
 	LINE15:voltage3#FEB83E:V_Wohnzimmer   \
 	LINE16:voltage4#FEA101:V_Babyzimmer   

rrdtool graph \
	$USER_HOME_DIR/pics/Weatherstation_Temp_daily.png   \
	--title "Weatherstation" \
	--vertical-label 'degC' \
	-s 'now - 1 day' -e 'now'   \
	--lower-limit   0 \
	--upper-limit 35 \
    $common_graph_settings \
	DEF:temp=$USER_HOME_DIR/Weatherstation.rrd:temp:AVERAGE   \
	DEF:temp0=$USER_HOME_DIR/Weatherstation.rrd:temp0:AVERAGE   \
	DEF:temp1=$USER_HOME_DIR/Weatherstation.rrd:temp1:AVERAGE   \
	DEF:temp2=$USER_HOME_DIR/Weatherstation.rrd:temp2:AVERAGE   \
	DEF:temp3=$USER_HOME_DIR/Weatherstation.rrd:temp3:AVERAGE   \
	DEF:temp4=$USER_HOME_DIR/Weatherstation.rrd:temp4:AVERAGE   \
	LINE0:temp#B7B4D5:temp \
	LINE1:temp0#9891D7:temp0 \
 	LINE2:temp1#7F76D5:T_Schlafzimmer   \
	LINE3:temp2#695DD5:T_Badezimmer \
 	LINE4:temp3#4838D5:T_Wohnzimmer   \
 	LINE5:temp4#220FD2:T_Babyzimmer   \
 	VDEF:TEMP=temp,LAST                	"GPRINT:TEMP:%.1lf °C"	 \
 	VDEF:T_0=temp0,LAST    	"GPRINT:T_0:%.1lf °C"	 \
 	VDEF:T_Schlafzimmer=temp1,LAST    	"GPRINT:T_Schlafzimmer:%.1lf °C"	 \
 	VDEF:T_Badezimmer=temp2,LAST    	"GPRINT:T_Badezimmer:%.1lf °C"   \
 	VDEF:T_Wohnzimmer=temp3,LAST    	"GPRINT:T_Wohnzimmer:%.1lf °C"	 \
 	VDEF:T_Babyzimmer=temp4,LAST    	"GPRINT:T_Babyzimmer:%.1lf °C"	 


rrdtool graph \
	$USER_HOME_DIR/pics/Weatherstation_Humid.png   \
	--title "Weatherstation" \
	--vertical-label '%humidity' \
	-s 'now - 1 week' -e 'now'   \
	--lower-limit   0 \
	--upper-limit 100 \
    $common_graph_settings \
	DEF:humid=$USER_HOME_DIR/Weatherstation.rrd:humid:AVERAGE   \
	DEF:humid0=$USER_HOME_DIR/Weatherstation.rrd:humid0:AVERAGE   \
	DEF:humid1=$USER_HOME_DIR/Weatherstation.rrd:humid1:AVERAGE   \
	DEF:humid2=$USER_HOME_DIR/Weatherstation.rrd:humid2:AVERAGE   \
	DEF:humid3=$USER_HOME_DIR/Weatherstation.rrd:humid3:AVERAGE   \
	DEF:humid4=$USER_HOME_DIR/Weatherstation.rrd:humid4:AVERAGE   \
 	LINE1:humid#DBFFDA:Humidity   \
 	LINE2:humid0#BBFDBA:Humidity0   \
 	LINE3:humid1#96FC94:H_Schlafzimmer   \
 	LINE4:humid2#75FB73:H_Badezimmer   \
 	LINE5:humid3#51FC4E:H_Wohnzimmer   \
 	LINE6:humid4#26FD22:H_Babyzimmer   \
 	VDEF:HUMID=humid,LAST  	"GPRINT:HUMID:%.1lf percent"	 \
 	VDEF:H_0=humid0,LAST  	"GPRINT:H_0:%.1lf percent"	 \
 	VDEF:H_Schlafzimmer=humid1,LAST  	"GPRINT:H_Schlafzimmer:%.1lf percent"	 \
 	VDEF:H_Badezimmer=humid2,LAST  	"GPRINT:H_Badezimmer:%.1lf percent"	 \
 	VDEF:H_Wohnzimmer=humid3,LAST  	"GPRINT:H_Wohnzimmer:%.1lf percent"	 \
 	VDEF:H_Babyzimmer=humid4,LAST  	"GPRINT:H_Babyzimmer:%.1lf percent"	 

rrdtool graph \
	$USER_HOME_DIR/pics/Weatherstation_Humid_daily.png   \
	--title "Weatherstation" \
	--vertical-label '%humidity' \
	-s 'now - 1 day' -e 'now'   \
	--lower-limit   0 \
	--upper-limit 100 \
    $common_graph_settings \
	DEF:humid=$USER_HOME_DIR/Weatherstation.rrd:humid:AVERAGE   \
	DEF:humid0=$USER_HOME_DIR/Weatherstation.rrd:humid0:AVERAGE   \
	DEF:humid1=$USER_HOME_DIR/Weatherstation.rrd:humid1:AVERAGE   \
	DEF:humid2=$USER_HOME_DIR/Weatherstation.rrd:humid2:AVERAGE   \
	DEF:humid3=$USER_HOME_DIR/Weatherstation.rrd:humid3:AVERAGE   \
	DEF:humid4=$USER_HOME_DIR/Weatherstation.rrd:humid4:AVERAGE   \
 	LINE1:humid#DBFFDA:Humidity   \
 	LINE2:humid0#BBFDBA:Humidity0   \
 	LINE3:humid1#96FC94:H_Schlafzimmer   \
 	LINE4:humid2#75FB73:H_Badezimmer   \
 	LINE5:humid3#51FC4E:H_Wohnzimmer   \
 	LINE6:humid4#26FD22:H_Babyzimmer   \
 	VDEF:HUMID=humid,LAST  	"GPRINT:HUMID:%.1lf percent"	 \
 	VDEF:H_0=humid0,LAST  	"GPRINT:H_0:%.1lf percent"	 \
 	VDEF:H_Schlafzimmer=humid1,LAST  	"GPRINT:H_Schlafzimmer:%.1lf percent"	 \
 	VDEF:H_Badezimmer=humid2,LAST  	"GPRINT:H_Badezimmer:%.1lf percent"	 \
 	VDEF:H_Wohnzimmer=humid3,LAST  	"GPRINT:H_Wohnzimmer:%.1lf percent"	 \
 	VDEF:H_Babyzimmer=humid4,LAST  	"GPRINT:H_Babyzimmer:%.1lf percent"	 

rrdtool graph \
	$USER_HOME_DIR/pics/Weatherstation_Voltage.png   \
	--title "Weatherstation" \
	--vertical-label 'Voltage' \
	-s 'now - 1 week' -e 'now'   \
	--lower-limit   3 \
	--upper-limit 4.5 \
	$common_graph_settings_daily \
    $common_graph_settings \
	DEF:voltage0=$USER_HOME_DIR/Weatherstation.rrd:voltage0:AVERAGE   \
	DEF:voltage1=$USER_HOME_DIR/Weatherstation.rrd:voltage1:AVERAGE   \
	DEF:voltage2=$USER_HOME_DIR/Weatherstation.rrd:voltage2:AVERAGE   \
	DEF:voltage3=$USER_HOME_DIR/Weatherstation.rrd:voltage3:AVERAGE   \
	DEF:voltage4=$USER_HOME_DIR/Weatherstation.rrd:voltage4:AVERAGE   \
	LINE1:voltage0#C71585:V_xxxx   \
 	LINE2:voltage1#CD5C5C:V_Schlafzimmer   \
 	LINE3:voltage2#CD853F:V_Badezimmer   \
 	LINE4:voltage3#D2691E:V_Wohnzimmer   \
 	LINE5:voltage4#DB691E:V_Babyzimmer   \
 	VDEF:V_xxxx=voltage0,LAST  	"GPRINT:V_xxxx:%.2lf V"	 \
 	VDEF:V_Schlafzimmer=voltage1,LAST  	"GPRINT:V_Schlafzimmer:%.2lf V"	 \
 	VDEF:V_Badezimmer=voltage2,LAST  	"GPRINT:V_Badezimmer:%.2lf V"	 \
 	VDEF:V_Wohnzimmer=voltage3,LAST  	"GPRINT:V_Wohnzimmer:%.2lf V"	 \
 	VDEF:V_Babyzimmer=voltage4,LAST  	"GPRINT:V_Babyzimmer:%.2lf V"	 

