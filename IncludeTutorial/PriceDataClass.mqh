//Accessing Price Data and Candlestick Data Using OOP Approach

class HPriceData{
   
   protected:
      MqlRates price_data_array[]; //Used to store Date OHLCV Data.
      
   public:
      HPriceData(); //Initialize ArraySetAsSeries.
      void Add_Price_Data(); //CopyBuffer Function.
      
      //Get Date OHLCV Data
      
      datetime Get_DateTime_Value(int pIndex=0);
      double Get_Open_Value(int pIndex=0);
      double Get_High_Value(int pIndex=0);
      double Get_Low_Value(int pIndex=0);
      double Get_Close_Value(int pIndex=0);
      int Get_Volume_Value(int pIndex=0);
      
      //Get Bullish Or Bearish State
      
      bool Get_Is_Bullish(int pIndex=0);
      bool Get_Is_Bearish(int pIndex=0);
      string Get_Is_Bullish_Or_Bearish(int pIndex=0);
      
      //Get Candle Data
      //Get Body Size, Upper Wick Size, Lower Wick Size
      
      double Get_Candle_Size(int pIndex=0);
      double Get_Body_Size(int pIndex=0);
      double Get_Upper_Size(int pIndex=0);
      double Get_Lower_Size(int pIndex=0);
      
      //Get Average Candlestick Data
      //Average Body Size, Average Upper Wick Size, Average Lower Wick Size
      
      double Get_Average_Candle_Size(int pIndex=0, int pAvrRange=5);
      double Get_Average_Body_Size(int pIndex=0, int pAvrRange=5);
      double Get_Average_Upper_Size(int pIndex=0, int pAvrRange=5);
      double Get_Average_Lower_Size(int pIndex=0, int pAvrRange=5);
      
      //Get Candle Percentage Values
      //Body Percentage Value Relative To The Total Candle Size
      //Upper Wick Percentage Value Relative To The Total Candle Size
      //Lower Wick Percentage Value Relative To The Total Candle Size
      
      double Get_Body_Percentage(int pIndex=0);
      double Get_Upper_Percentage(int pIndex=0);
      double Get_Lower_Percentage(int pIndex=0);
      
      
      //Get Average Candle Percentage Values
      //Average Body Percentage Value
      //Average Upper Wick Percentage Value
      //Average Lower Wick Percentage Value
      
      double Get_Average_Body_Percentage(int pIndex=0, int pAvrRange=5);
      double Get_Average_Upper_Percentage(int pIndex=0, int pAvrRange=5);
      double Get_Average_Lower_Percentage(int pIndex=0, int pAvrRange=5);
      
      //Determine If The Candle Value Is Long Or Short
      //A Value Is Long If It Is Greater Or Equal To The inp_val times 1.5
      //A Value Is Short If It Is Less Or Equal To The inp_val time 0.5
      
      bool Calculate_Is_Long(double curr_val, double inp_val);
      bool Calculate_Is_Short(double curr_val, double inp_val);
      
      //Determine If The Body Size Is Long Or Short
      //The Body Size Is Long Or Short As Compared To The Average Body Size Value
      
      bool Get_Is_Body_Size_Long(int pIndex=0, int pAvrRange=5);
      bool Get_Is_Body_Size_Short(int pIndex=0, int pAvrRange=5);
      
      //Determine If The Upper Size Is Long Or Short
      //The Upper Size Is Long Or Short As Compared To The Average Upper Size Value
      
      bool Get_Is_Upper_Size_Long(int pIndex=0, int pAvrRange=5);
      bool Get_Is_Upper_Size_Short(int pIndex=0, int pAvrRange=5);
      
      //Determine If The Lower Size Is Long Or Short
      //The Lower Size Is Long Or Short As Compared To The Average Lower Size Value
      
      bool Get_Is_Lower_Size_Long(int pIndex=0, int pAvrRange=5);
      bool Get_Is_Lower_Size_Short(int pIndex=0, int pAvrRange=5);
      
      //Determine If The Candle Size Is Long Or Short
      //The Candle Size Is Long Or Short As Compared To Te Average Candle Size Value
      
      bool Get_Is_Candle_Size_Long(int pIndex=0, int pAvrRange=5);
      bool Get_Is_Candle_Size_Short(int pIndex=0, int pAvrRange=5);
      
      //Get If The Current Percentage Value Is Most, Significant, or Least In The Candle
      //The Percentage Is Most If It Occupies More Than 70% Of The Candle
      //The Percentage Is Significant If It Occupies More Than 50% But Less Than 70%
      //The Percentage Is Least If It Occupies Less Than 30%
      
      bool Calculate_Is_Most_Of_Candle(double curr_perc);
      bool Calculate_Is_Significant_In_Candle(double curr_perc);
      bool Calculate_Is_Least_Of_Candle(double curr_perc);
      
      //Get If The Body Is Most, Significant, or Least In The Candle
      
      bool Get_Body_Is_Most_Of_Candle(int pIndex=0);
      bool Get_Body_Is_Significant_In_Candle(int pIndex=0);
      bool Get_Body_Is_Least_Of_Candle(int pIndex=0);
      
      //Get If The Upper Is Most, Significant, or Least In The Candle
      
      bool Get_Upper_Is_Most_Of_Candle(int pIndex=0);
      bool Get_Upper_Is_Significant_In_Candle(int pIndex=0);
      bool Get_Upper_Is_Least_Of_Candle(int pIndex=0);
      
      //Get If The Lower Is Most, Significant, or Least In The Candle
      
      bool Get_Lower_Is_Most_Of_Candle(int pIndex=0);
      bool Get_Lower_Is_Significant_In_Candle(int pIndex=0);
      bool Get_Lower_Is_Least_Of_Candle(int pIndex=0);
      
      //Get If The Candle Is A Long Body Type
      //A Long Body Type Is A Long And Most Candle
      //A Long Upper Type Is A Long And Most Candle
      //A Long Lower Type Is A Long And Most Candle
      
      bool Get_Long_Body_Type(int pIndex=0, int pAvrRange=5);
      bool Get_Long_Upper_Type(int pIndex=0, int pAvrRange=5);
      bool Get_Long_Lower_Type(int pIndex=0, int pAvrRange=5);
      
      //Get If The Candle Is A Significant Body Type
      //A Significant Body Type Is Long And Significant
      //A Significant Upper Type Is Long And Significant
      //A Significant Lower Type Is Long And Significant
      
      bool Get_Significant_Body_Type(int pIndex=0, int pAvrRange=5);
      bool Get_Significant_Upper_Type(int pIndex=0, int pAvrRange=5);
      bool Get_Significant_Lower_Type(int pIndex=0, int pAvrRange=5);
      
      
      //Get A Bullish And Bearish Marubozu Type
      //A Marubozu Type Candle Has A Long Body and Short Upper and Lower Wicks
      //A Long Marubozu Is A Long Body Type
      //A Significant Marubozu Is A Significant Body Type
      
      bool Get_Long_Bullish_Marubozu_Type(int pIndex=0, int pAvrRange=5);
      bool Get_Significant_Bullish_Marubozu_Type(int pIndex=0, int pAvrRange=5);
      
      bool Get_Long_Bearish_Marubozu_Type(int pIndex=0, int pAvrRange=5);
      bool Get_Significant_Bearish_Marubozu_Type(int pIndex=0, int pAvrRange=5);
      
      
      //Get A Bullish Hammer And Inverted Hammer Type
      //A Hammer Type Has A Long Upper Or Lower Wick
      //A Long Hammer Type Is A Long Lower Type
      //A Long Inverted Hammer Type Is A Long Upper Type
      //A Significant Hammer Type Is A Significant Lower Type
      //A Significant Inverted Hammer Type Is A Significant Upper Type
      
      bool Get_Long_Hammer_Type(int pIndex=0, int pAvrRange=5);
      bool Get_Significant_Hammer_Type(int pIndex=0, int pAvrRange=5);
      
      bool Get_Long_Inverted_Hammer_Type(int pIndex=0, int pAvrRange=5);
      bool Get_Signicant_Inverted_Hammer_Type(int pIndex=0, int pAvrRange=5);
      
      
      //Get A Bearish Hanging Man And Shooting Star Type
      //A Hanging Man Type Is A Long/Significant Lower Type
      //A Shooting Star Type Is A Long/Siginificant Upper Type
      
      bool Get_Long_Hanging_Man_Type(int pIndex=0, int pAvrRange=5);
      bool Get_Significant_Hanging_Man_Type(int pIndex=0, int pAvrRange=5);
      
      bool Get_Long_Shooting_Star_Type(int pIndex=0, int pAvrRange=5);
      bool Get_Significant_Shooting_Star_Type(int pIndex=0, int pAvrRange=5);
      
      
      //Get An Engulfing Candlestick Pattern
      //Based On The Identification Of Long Candlesticks
      
      bool Get_Is_Bullish_Engulfing(int pIndex=0, int pAvrRange=5);
      
      bool Get_Is_Bearish_Engulfing(int pIndex=0, int pAvrRange=5);
      
      //Get A Hrami Candlestick Pattern
      //Based On The Indetifcation Of Long Candlesticks
      
      bool Get_Is_Bullish_Harami(int pIndex=0, int pAvrRange=5);
      
      bool Get_Is_Bearish_Harami(int pIndex=0, int pAvrRange=5);
   
};

HPriceData::HPriceData(void){
   
   ArraySetAsSeries(price_data_array, true);
   
}


void HPriceData::Add_Price_Data(void){
   
   CopyRates(_Symbol, _Period, 0, 100, price_data_array);
   
}


datetime HPriceData::Get_DateTime_Value(int pIndex=0){
   
   datetime date_time_value = price_data_array[pIndex].time;
   
   return(date_time_value);
   
}


double HPriceData::Get_Open_Value(int pIndex=0){
   
   double open_value = price_data_array[pIndex].open;
   
   return(open_value);
   
}


double HPriceData::Get_High_Value(int pIndex=0){
   
   double high_value = price_data_array[pIndex].high;
   
   return(high_value);
   
}


double HPriceData::Get_Low_Value(int pIndex=0){
   
   double low_value = price_data_array[pIndex].low;
   
   return(low_value);
   
}


double HPriceData::Get_Close_Value(int pIndex=0){
   
   double close_value = price_data_array[pIndex].close;
   
   return(close_value);
   
}


int HPriceData::Get_Volume_Value(int pIndex=0){
   
   int volume_value = price_data_array[pIndex].tick_volume;
   
   return(volume_value);
   
}


bool HPriceData::Get_Is_Bullish(int pIndex=0){
   
   double open_value = Get_Open_Value(pIndex);
   
   double close_value = Get_Close_Value(pIndex);
   
   bool is_bull = close_value > open_value;
   
   return(is_bull);
   
}


bool HPriceData::Get_Is_Bearish(int pIndex=0){
   
   double open_value = Get_Open_Value(pIndex);
   
   double close_value = Get_Close_Value(pIndex);
   
   bool is_bear = open_value > close_value;
   
   return(is_bear);
   
}


string HPriceData::Get_Is_Bullish_Or_Bearish(int pIndex=0){
   
   bool is_bull = Get_Is_Bullish(pIndex);
   
   bool is_bear = Get_Is_Bearish(pIndex);
   
   string bull_or_bear = "None";
   
   if(is_bull)
     {
      
      bull_or_bear = "Bullish";
      
     }
   
   if(is_bear)
     {
      
      bull_or_bear = "Bearish";
      
     }
   
   return(bull_or_bear);
   
}


double HPriceData::Get_Candle_Size(int pIndex=0){
   
   double high_value = Get_High_Value(pIndex);
   
   double low_value = Get_Low_Value(pIndex);
   
   double candle_size = MathAbs(high_value - low_value);
   
   return(NormalizeDouble(candle_size, 5));
   
}


double HPriceData::Get_Body_Size(int pIndex=0){
   
   double open_value = Get_Open_Value(pIndex);
   
   double close_value = Get_Close_Value(pIndex);
   
   double body_size = MathAbs(open_value - close_value);
   
   return(NormalizeDouble(body_size, 5));
   
}


double HPriceData::Get_Upper_Size(int pIndex=0){
   
   double high_value = Get_High_Value(pIndex);
   
   double open_value = Get_Open_Value(pIndex);
   
   double close_value = Get_Close_Value(pIndex);
   
   bool is_bull = Get_Is_Bullish(pIndex);
   
   double upper_size = 0;
   
   if(is_bull)
     {
      
      upper_size = MathAbs(high_value - close_value);
      
     }
   
   else
     {
      upper_size = MathAbs(high_value - open_value);
     }
   
   
   return(NormalizeDouble(upper_size, 5));
   
}


double HPriceData::Get_Lower_Size(int pIndex=0){
   
   double low_value = Get_Low_Value(pIndex);
   
   double open_value = Get_Open_Value(pIndex);
   
   double close_value = Get_Close_Value(pIndex);
   
   bool is_bull = Get_Is_Bullish(pIndex);
   
   double lower_size = 0;
   
   
   if(is_bull)
     {
      
      lower_size = MathAbs(low_value - open_value);
      
     }
   
   else
     {
      
      lower_size = MathAbs(low_value - close_value);
      
     }
   
   return(NormalizeDouble(lower_size, 5));
   
}


double HPriceData::Get_Average_Candle_Size(int pIndex=0, int pAvrRange=5){

   int avr_index_range = pAvrRange + 1;
   
   double avr_sum_value = 0;
   
   
   for(int i=1;i<avr_index_range;i++)
     {
      
      int avr_index = pIndex + i;
      
      double candle_size = Get_Candle_Size(avr_index);
      
      avr_sum_value += candle_size;
      
     }

   double avr_candle_size = avr_sum_value / pAvrRange;
   
   return(NormalizeDouble(avr_candle_size, 5));

}


double HPriceData::Get_Average_Body_Size(int pIndex=0, int pAvrRange=5){

   int avr_index_range = pAvrRange + 1;
   
   double avr_sum_value = 0;
   
   
   for(int i=1;i<avr_index_range;i++)
     {
      
      int avr_index = pIndex + i;
      
      double body_size = Get_Body_Size(avr_index);
      
      avr_sum_value += body_size;
      
     }

   double avr_body_size = avr_sum_value / pAvrRange;
   
   return(NormalizeDouble(avr_body_size, 5));

}


double HPriceData::Get_Average_Upper_Size(int pIndex=0, int pAvrRange=5){

   int avr_index_range = pAvrRange + 1;
   
   double avr_sum_value = 0;
   
   
   for(int i=1;i<avr_index_range;i++)
     {
      
      int avr_index = pIndex + i;
      
      double upper_size = Get_Upper_Size(avr_index);
      
      avr_sum_value += upper_size;
      
     }

   double avr_upper_size = avr_sum_value / pAvrRange;
   
   return(NormalizeDouble(avr_upper_size, 5));

}


double HPriceData::Get_Average_Lower_Size(int pIndex=0, int pAvrRange=5){

   int avr_index_range = pAvrRange + 1;
   
   double avr_sum_value = 0;
   
   
   for(int i=1;i<avr_index_range;i++)
     {
      
      int avr_index = pIndex + i;
      
      double lower_size = Get_Lower_Size(avr_index);
      
      avr_sum_value += lower_size;
      
     }

   double avr_lower_size = avr_sum_value / pAvrRange;
   
   return(NormalizeDouble(avr_lower_size, 5));

}


double HPriceData::Get_Body_Percentage(int pIndex=0){
   
   double candle_size = Get_Candle_Size(pIndex);
   
   double body_size = Get_Body_Size(pIndex);
   
   if(candle_size == 0 || body_size == 0)
     {
      
      return(0);
      
     }
   
   double body_div_value = body_size / candle_size;
   
   double body_perc_value = body_div_value * 100;
   
   return(NormalizeDouble(body_perc_value, 5));
   
}


double HPriceData::Get_Upper_Percentage(int pIndex=0){
   
   double candle_size = Get_Candle_Size(pIndex);
   
   double upper_size = Get_Upper_Size(pIndex);
   
   if(candle_size == 0 || upper_size == 0)
     {
      
      return(0);
      
     }
   
   double upper_div_value = upper_size / candle_size;
   
   double upper_perc_value = upper_div_value * 100;
   
   return(NormalizeDouble(upper_perc_value, 5));
   
}


double HPriceData::Get_Lower_Percentage(int pIndex=0){
   
   double candle_size = Get_Candle_Size(pIndex);
   
   double lower_size = Get_Lower_Size(pIndex);
   
   if(candle_size == 0 || lower_size == 0)
     {
      
      return(0);
      
     }
   
   double lower_div_value = lower_size / candle_size;
   
   double lower_perc_value = lower_div_value * 100;
   
   return(NormalizeDouble(lower_perc_value, 5));
   
}


double HPriceData::Get_Average_Body_Percentage(int pIndex=0,int pAvrRange=5){
   
   int avr_index_range = pAvrRange + 1;
   
   double avr_sum_value = 0;
   
   for(int i=1;i<avr_index_range;i++)
     {
      
      int avr_index = pIndex + i;
      
      double body_percentage = Get_Body_Percentage(avr_index);
      
      avr_sum_value += body_percentage;
      
     }
   
   double avr_body_percentage = avr_sum_value / pAvrRange;
   
   return(NormalizeDouble(avr_body_percentage, 5));
   
}


double HPriceData::Get_Average_Upper_Percentage(int pIndex=0,int pAvrRange=5){
   
   int avr_index_range = pAvrRange + 1;
   
   double avr_sum_value = 0;
   
   for(int i=1;i<avr_index_range;i++)
     {
      
      int avr_index = pIndex + i;
      
      double upper_percentage = Get_Upper_Percentage(avr_index);
      
      avr_sum_value += upper_percentage;
      
     }
   
   double avr_upper_percentage = avr_sum_value / pAvrRange;
   
   return(NormalizeDouble(avr_upper_percentage, 5));

}


double HPriceData::Get_Average_Lower_Percentage(int pIndex=0,int pAvrRange=5){
   
   int avr_index_range = pAvrRange + 1;
   
   double avr_sum_value = 0;
   
   
   for(int i=1;i<avr_index_range;i++)
     {
      
      int avr_index = pIndex + i;
      
      double lower_percentage = Get_Lower_Percentage(avr_index);
      
      avr_sum_value += lower_percentage;
      
     }
   
   double avr_lower_percentage = avr_sum_value / pAvrRange;
   
   return(NormalizeDouble(avr_lower_percentage, 5));
   
}


bool HPriceData::Calculate_Is_Long(double curr_val,double inp_val){
   
   bool is_long = curr_val >= (1.3 * inp_val);
   
   return(is_long);
   
}


bool HPriceData::Calculate_Is_Short(double curr_val,double inp_val){
   
   bool is_short = curr_val <= (0.3 * inp_val);
   
   return(is_short);
   
}


bool HPriceData::Get_Is_Body_Size_Long(int pIndex=0,int pAvrRange=5){

   double body_size = Get_Body_Size(pIndex);
   
   double avr_body_size = Get_Average_Body_Size(pIndex, pAvrRange);
   
   bool is_long = Calculate_Is_Long(body_size, avr_body_size);
   
   return(is_long);

}


bool HPriceData::Get_Is_Body_Size_Short(int pIndex=0,int pAvrRange=5){
   
   double body_size = Get_Body_Size(pIndex);
   
   double avr_body_size = Get_Average_Body_Size(pIndex, pAvrRange);
   
   bool is_short = Calculate_Is_Short(body_size, avr_body_size);
   
   return(is_short);
   
}


bool HPriceData::Get_Is_Candle_Size_Long(int pIndex=0,int pAvrRange=5){
   
   double candle_size = Get_Candle_Size(pIndex);
   
   double avr_candle_size = Get_Average_Candle_Size(pIndex, pAvrRange);
   
   bool is_long = Calculate_Is_Long(candle_size, avr_candle_size);
   
   return(is_long);
   
}


bool HPriceData::Get_Is_Candle_Size_Short(int pIndex=0,int pAvrRange=5){
   
   double candle_size = Get_Candle_Size(pIndex);
   
   double avr_candle_size = Get_Average_Candle_Size(pIndex, pAvrRange);
   
   bool is_short = Calculate_Is_Short(candle_size, avr_candle_size);
   
   return(is_short);
   
}


bool HPriceData::Get_Is_Upper_Size_Long(int pIndex=0,int pAvrRange=5){
   
   double upper_size = Get_Upper_Size(pIndex);
   
   double avr_upper_size = Get_Average_Upper_Size(pIndex, pAvrRange);
   
   bool is_long = Calculate_Is_Long(upper_size, avr_upper_size);
   
   return(is_long);
   
}


bool HPriceData::Get_Is_Upper_Size_Short(int pIndex=0,int pAvrRange=5){
   
   double upper_size = Get_Upper_Size(pIndex);
   
   double avr_upper_size = Get_Average_Upper_Size(pIndex, pAvrRange);
   
   bool is_short = Calculate_Is_Short(upper_size, avr_upper_size);
   
   return(is_short);
   
}


bool HPriceData::Get_Is_Lower_Size_Long(int pIndex=0,int pAvrRange=5){
   
   double lower_size = Get_Lower_Size(pIndex);
   
   double avr_lower_size = Get_Average_Lower_Size(pIndex, pAvrRange);
   
   bool is_long = Calculate_Is_Long(lower_size, avr_lower_size);
   
   return(is_long);
   
}


bool HPriceData::Get_Is_Lower_Size_Short(int pIndex=0,int pAvrRange=5){
   
   double lower_size = Get_Lower_Size(pIndex);
   
   double avr_lower_size = Get_Average_Lower_Size(pIndex, pAvrRange);
   
   bool is_short = Calculate_Is_Short(lower_size, avr_lower_size);
   
   return(is_short);
   
}


bool HPriceData::Calculate_Is_Most_Of_Candle(double curr_perc){
   
   bool is_most = curr_perc > 70;
   
   return(is_most);
   
}


bool HPriceData::Calculate_Is_Significant_In_Candle(double curr_perc){
   
   bool is_sig = (curr_perc > 50) && (curr_perc <= 70);
   
   return(is_sig);
   
}


bool HPriceData::Calculate_Is_Least_Of_Candle(double curr_perc){
   
   bool is_least = curr_perc < 30;
   
   return(is_least);
   
}


bool HPriceData::Get_Body_Is_Most_Of_Candle(int pIndex=0){
   
   double body_perc = Get_Body_Percentage(pIndex);
   
   bool is_most = Calculate_Is_Most_Of_Candle(body_perc);
   
   return(is_most);
   
}


bool HPriceData::Get_Body_Is_Significant_In_Candle(int pIndex=0){
   
   double body_perc = Get_Body_Percentage(pIndex);
   
   bool is_sig = Calculate_Is_Significant_In_Candle(body_perc);
   
   return(is_sig);
   
}


bool HPriceData::Get_Body_Is_Least_Of_Candle(int pIndex=0){
   
   double body_perc = Get_Body_Percentage(pIndex);
   
   bool is_least = Calculate_Is_Least_Of_Candle(body_perc);
   
   return(is_least);
   
}


bool HPriceData::Get_Upper_Is_Most_Of_Candle(int pIndex=0){
   
   double upper_perc = Get_Upper_Percentage(pIndex);
   
   bool is_most = Calculate_Is_Most_Of_Candle(upper_perc);
   
   return(is_most);
   
}


bool HPriceData::Get_Upper_Is_Significant_In_Candle(int pIndex=0){
   
   double upper_perc = Get_Upper_Percentage(pIndex);
   
   bool is_sig = Calculate_Is_Significant_In_Candle(upper_perc);
   
   return(is_sig);
   
}


bool HPriceData::Get_Upper_Is_Least_Of_Candle(int pIndex=0){
   
   double upper_perc = Get_Upper_Percentage(pIndex);
   
   bool is_least = Calculate_Is_Least_Of_Candle(upper_perc);
   
   return(is_least);
   
}


bool HPriceData::Get_Lower_Is_Most_Of_Candle(int pIndex=0){
   
   double lower_perc = Get_Lower_Percentage(pIndex);
   
   bool is_most = Calculate_Is_Most_Of_Candle(lower_perc);
   
   return(is_most);
   
}


bool HPriceData::Get_Lower_Is_Significant_In_Candle(int pIndex=0){
   
   double lower_perc = Get_Lower_Percentage(pIndex);
   
   bool is_sig = Calculate_Is_Significant_In_Candle(lower_perc);
   
   return(is_sig);
   
}


bool HPriceData::Get_Lower_Is_Least_Of_Candle(int pIndex=0){
   
   double lower_perc = Get_Lower_Percentage(pIndex);
   
   bool is_least = Calculate_Is_Least_Of_Candle(lower_perc);
   
   return(is_least);
   
}


bool HPriceData::Get_Long_Body_Type(int pIndex=0,int pAvrRange=5){
   
   bool candle_is_long = Get_Is_Candle_Size_Long(pIndex, pAvrRange);
   
   bool body_is_long = Get_Is_Body_Size_Long(pIndex, pAvrRange);
   
   bool body_is_most = Get_Body_Is_Most_Of_Candle(pIndex);
   
   bool is_long_type = (candle_is_long && body_is_long) && body_is_most;
   
   return(is_long_type);
   
}


bool HPriceData::Get_Long_Upper_Type(int pIndex=0,int pAvrRange=5){
   
   bool candle_is_long = Get_Is_Candle_Size_Long(pIndex, pAvrRange);
   
   bool upper_is_long = Get_Is_Upper_Size_Long(pIndex, pAvrRange);
   
   bool upper_is_most = Get_Upper_Is_Most_Of_Candle(pIndex);
   
   bool is_long_type = (candle_is_long && upper_is_long) && upper_is_most;
   
   return(is_long_type);
   
}


bool HPriceData::Get_Long_Lower_Type(int pIndex=0,int pAvrRange=5){
   
   bool candle_is_long = Get_Is_Candle_Size_Long(pIndex, pAvrRange);
   
   bool lower_is_long = Get_Is_Lower_Size_Long(pIndex, pAvrRange);
   
   bool lower_is_most = Get_Lower_Is_Most_Of_Candle(pIndex);
   
   bool is_long_type = (candle_is_long && lower_is_long) && lower_is_most;
   
   return(is_long_type);
   
}


bool HPriceData::Get_Significant_Body_Type(int pIndex=0,int pAvrRange=5){
   
   bool body_is_long = Get_Is_Body_Size_Long(pIndex, pAvrRange);
   
   bool body_is_significant = Get_Body_Is_Significant_In_Candle(pIndex);
   
   bool body_is_sig = (body_is_long && body_is_significant);
   
   return(body_is_sig);
   
}


bool HPriceData::Get_Significant_Upper_Type(int pIndex=0,int pAvrRange=5){
   
   bool upper_is_long = Get_Is_Upper_Size_Long(pIndex, pAvrRange);
   
   bool upper_is_significant = Get_Upper_Is_Significant_In_Candle(pIndex);
   
   bool upper_is_sig = (upper_is_long && upper_is_significant);
   
   return(upper_is_sig);
   
}


bool HPriceData::Get_Significant_Lower_Type(int pIndex=0,int pAvrRange=5){
   
   bool lower_is_long = Get_Is_Lower_Size_Long(pIndex, pAvrRange);
   
   bool lower_is_significant = Get_Lower_Is_Significant_In_Candle(pIndex);
   
   bool lower_is_sig = (lower_is_long && lower_is_significant);
   
   return(lower_is_sig);
   
}


bool HPriceData::Get_Long_Bullish_Marubozu_Type(int pIndex=0,int pAvrRange=5){
   
   bool is_bull = Get_Is_Bullish(pIndex);
   
   bool body_is_long = Get_Long_Body_Type(pIndex, pAvrRange);
   
   bool is_maru = (is_bull && body_is_long);
   
   return(is_maru);
   
}


bool HPriceData::Get_Significant_Bullish_Marubozu_Type(int pIndex=0,int pAvrRange=5){
   
   bool is_bull = Get_Is_Bullish(pIndex);
   
   bool body_is_significant = Get_Significant_Body_Type(pIndex, pAvrRange);
   
   bool is_maru = (is_bull && body_is_significant);
   
   return(is_maru);
   
}


bool HPriceData::Get_Long_Bearish_Marubozu_Type(int pIndex=0,int pAvrRange=5){
   
   bool is_bear = Get_Is_Bearish(pIndex);
   
   bool body_is_long = Get_Long_Body_Type(pIndex, pAvrRange);
   
   bool is_maru = (is_bear && body_is_long);
   
   return(is_maru);
   
}


bool HPriceData::Get_Significant_Bearish_Marubozu_Type(int pIndex=0,int pAvrRange=5){
   
   bool is_bear = Get_Is_Bearish(pIndex);
   
   bool body_is_significant = Get_Significant_Body_Type(pIndex, pAvrRange);
   
   bool is_maru = (is_bear && body_is_significant);
   
   return(is_maru);
   
}


bool HPriceData::Get_Long_Hammer_Type(int pIndex=0,int pAvrRange=5){
   
   bool is_bull = Get_Is_Bullish(pIndex);
   
   bool lower_is_long = Get_Long_Lower_Type(pIndex, pAvrRange);
   
   bool is_hammer = (is_bull && lower_is_long);
   
   return(is_hammer);
   
}


bool HPriceData::Get_Significant_Hammer_Type(int pIndex=0,int pAvrRange=5){
   
   bool is_bull = Get_Is_Bullish(pIndex);
   
   bool lower_is_significant = Get_Significant_Lower_Type(pIndex, pAvrRange);
   
   bool is_hammer = (is_bull && lower_is_significant);
   
   return(is_hammer);
   
}


bool HPriceData::Get_Long_Inverted_Hammer_Type(int pIndex=0,int pAvrRange=5){
   
   bool is_bull = Get_Is_Bullish(pIndex);
   
   bool upper_is_long = Get_Long_Upper_Type(pIndex, pAvrRange);
   
   bool is_inv_hammer = (is_bull && upper_is_long);
   
   return(is_inv_hammer);
   
}


bool HPriceData::Get_Signicant_Inverted_Hammer_Type(int pIndex=0,int pAvrRange=5){
   
   bool is_bull = Get_Is_Bullish(pIndex);
   
   bool upper_is_significant = Get_Significant_Upper_Type(pIndex, pAvrRange);
   
   bool is_inv_hammer = (is_bull && upper_is_significant);
   
   return(is_inv_hammer);
   
}


bool HPriceData::Get_Long_Hanging_Man_Type(int pIndex=0,int pAvrRange=5){
   
   bool is_bear = Get_Is_Bearish(pIndex);
   
   bool lower_is_long = Get_Long_Lower_Type(pIndex, pAvrRange);

   bool is_hm = (is_bear && lower_is_long);
   
   return(is_hm);
   
}


bool HPriceData::Get_Significant_Hanging_Man_Type(int pIndex=0,int pAvrRange=5){
   
   bool is_bear = Get_Is_Bearish(pIndex);
   
   bool lower_is_significant = Get_Significant_Lower_Type(pIndex, pAvrRange);
   
   bool is_hm = (is_bear && lower_is_significant);
   
   return(is_hm);
   
}


bool HPriceData::Get_Long_Shooting_Star_Type(int pIndex=0,int pAvrRange=5){
   
   bool is_bear = Get_Is_Bearish(pIndex);
   
   bool upper_is_long = Get_Long_Upper_Type(pIndex, pAvrRange);
   
   bool is_ss = (is_bear && upper_is_long);
   
   return(is_ss);
   
}


bool HPriceData::Get_Significant_Shooting_Star_Type(int pIndex=0,int pAvrRange=5){
   
   bool is_bear = Get_Is_Bearish(pIndex);
   
   bool upper_is_significant = Get_Long_Upper_Type(pIndex, pAvrRange);
   
   bool is_ss = (is_bear && upper_is_significant);
   
   return(is_ss);
   
}


bool HPriceData::Get_Is_Bullish_Engulfing(int pIndex=0,int pAvrRange=5){
   
   int curr_index = pIndex;
   
   int prev_index = pIndex + 1;
   
   bool curr_is_bull = Get_Is_Bullish(curr_index);
   
   bool prev_is_bear = Get_Is_Bearish(prev_index);
   
   bool curr_body_is_long = Get_Is_Body_Size_Long(curr_index, pAvrRange);
   
   bool prev_body_is_long = Get_Is_Body_Size_Long(prev_index, pAvrRange);
   
   double curr_body_size = Get_Body_Size(curr_index);
   
   double prev_body_size = Get_Body_Size(prev_index);
   
   bool curr_is_marubozu = Get_Long_Bullish_Marubozu_Type(curr_index, pAvrRange);
   
   bool bull_and_bear = curr_is_bull && prev_is_bear;
   
   bool body_is_long = curr_body_is_long && prev_body_is_long;
   
   bool body_size_is_greater = curr_body_size > prev_body_size;
   
   
   bool is_engulfing = bull_and_bear && body_is_long && body_size_is_greater && curr_is_marubozu;
   
   return(is_engulfing);
   
}


bool HPriceData::Get_Is_Bearish_Engulfing(int pIndex=0,int pAvrRange=5){
   
   int curr_index = pIndex;
   
   int prev_index = pIndex + 1;
   
   bool curr_is_bear = Get_Is_Bearish(curr_index);
   
   bool prev_is_bull = Get_Is_Bullish(prev_index);
   
   bool curr_is_long = Get_Is_Body_Size_Long(curr_index, pAvrRange);
   
   bool prev_is_long = Get_Is_Body_Size_Long(prev_index, pAvrRange);
   
   double curr_body_size = Get_Body_Size(curr_index);
   
   double prev_body_size = Get_Body_Size(prev_index);
   
   bool curr_is_maru = Get_Long_Bearish_Marubozu_Type(curr_index, pAvrRange);
   
   bool bull_and_bear = curr_is_bear && prev_is_bull;
   
   bool body_is_long = curr_is_long && prev_is_long;
   
   bool body_is_greater = curr_body_size > prev_body_size;
   
   
   bool is_engulfing = bull_and_bear && body_is_long && body_is_greater && curr_is_maru;
   
   return(is_engulfing);
   
}


bool HPriceData::Get_Is_Bullish_Harami(int pIndex=0,int pAvrRange=5){
   
   int curr_index = pIndex;
   
   int prev_index = pIndex + 1;
   
   bool curr_is_bull = Get_Is_Bullish(curr_index);
   
   bool prev_is_bear = Get_Is_Bearish(prev_index);
   
   bool prev_body_long = Get_Is_Body_Size_Long(prev_index, pAvrRange);
   
   bool curr_hammer = Get_Long_Hammer_Type(curr_index, pAvrRange);
   
   bool curr_inv_hammer = Get_Long_Inverted_Hammer_Type(curr_index, pAvrRange);
   
   bool bull_and_bear = curr_is_bull && prev_is_bear;
   
   bool hammer_type = curr_hammer || curr_inv_hammer;
   
   
   bool is_harami = bull_and_bear && hammer_type && prev_body_long;
   
   return(is_harami);
   
}


bool HPriceData::Get_Is_Bearish_Harami(int pIndex=0,int pAvrRange=5){
   
   int curr_index = pIndex;
   
   int prev_index = pIndex + 1;
   
   bool curr_is_bear = Get_Is_Bearish(curr_index);
   
   bool prev_is_bull = Get_Is_Bullish(prev_index);
   
   bool prev_body_is_long = Get_Is_Body_Size_Long(prev_index);
   
   bool curr_hang = Get_Long_Hanging_Man_Type(curr_index, pAvrRange);
   
   bool curr_star = Get_Long_Shooting_Star_Type(curr_index, pAvrRange);
   
   bool bull_and_bear = curr_is_bear && prev_is_bull;
   
   bool star_or_hang_type = curr_star || curr_hang;
   
   
   bool is_harami = bull_and_bear && star_or_hang_type && prev_body_is_long;
   
   return(is_harami);
   
}