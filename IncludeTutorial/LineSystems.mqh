


void Create_Horizontal_Line(string pName, double pPrice, long addColor=clrGold){
   
   ObjectCreate(0, pName, OBJ_HLINE, 0, 0, pPrice);
   
   ObjectSetInteger(0, pName, OBJPROP_COLOR, addColor);
   
}


void Create_Vertical_Line(string pName, datetime pTime, long addColor=clrGold){
   
   ObjectCreate(0, pName, OBJ_VLINE, 0, pTime, 0);
   
   ObjectSetInteger(0, pName, OBJPROP_COLOR, addColor);
   
}


void Create_Trend_Line(string pName, double pPrice1, double pPrice2, datetime pTime1, datetime pTime2, long addColor=clrRed){
   
   ObjectCreate(0, pName, OBJ_TREND, 0, pTime1, pPrice1, pTime2, pPrice2);
   
   ObjectSetInteger(0, pName, OBJPROP_RAY_LEFT, true);
   
   ObjectGetInteger(0, pName, OBJPROP_COLOR, addColor);
   
}