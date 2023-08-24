
//Fast and Slow MA Period

int fast_ma_index = 50;

int slow_ma_index = 200;

//Date Time Index Of Recent Up Or Down Cross

datetime up_cross_index;

datetime down_cross_index;

int OnInit()
  {
//---
   
//---
   return(INIT_SUCCEEDED);
  }
//+------------------------------------------------------------------+
//| Expert deinitialization function                                 |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {
//---
   
  }
//+------------------------------------------------------------------+
//| Expert tick function                                             |
//+------------------------------------------------------------------+
void OnTick()
  {
//---
   
   //Fast and Slow MA Array
   //Used To Store MA Data
   
   double fast_ma_array[];
   
   double slow_ma_array[];
   
   //Set The Array Index Of 0 To The Most Recent MA Value
   
   ArraySetAsSeries(fast_ma_array, true);
   
   ArraySetAsSeries(slow_ma_array, true);
   
   //Initialise The Indicator Definition
   //Used To Access The MA Indicator
   
   int fast_ma_indicators = iMA(_Symbol, _Period, fast_ma_index, 0, MODE_SMA, PRICE_CLOSE);
   
   int slow_ma_indicators = iMA(_Symbol, _Period, slow_ma_index, 0, MODE_SMA, PRICE_CLOSE);
   
   //Copy The MA Data To The MA Array
   
   CopyBuffer(fast_ma_indicators, 0, 0, 10, fast_ma_array);
   
   CopyBuffer(slow_ma_indicators, 0, 0, 10, slow_ma_array);
   
   //Access The Most Recent MA Values
   
   double curr_fast_value = fast_ma_array[1];
   
   double curr_slow_value = slow_ma_array[1];
   
   double prev_fast_value = fast_ma_array[2];
   
   double prev_slow_value = slow_ma_array[2];
   
   //Determine If The Current MA Value Is
   //Greater Than The Previous MA Value
   //Necessary For Crossover
   
   bool curr_fast_above_slow = curr_fast_value > curr_slow_value;
   
   bool prev_fast_above_slow = prev_fast_value > prev_slow_value;
   
   //Determine An Up Or Down Cross
   
   bool up_cross = curr_fast_above_slow && !(prev_fast_above_slow);
   
   bool down_cross = !(curr_fast_above_slow) && prev_fast_above_slow;
   
   //Access Price Data
   //Used To Access Current Price Data
   
   MqlRates price_data_array[];
   
   ArraySetAsSeries(price_data_array, true);
   
   CopyRates(_Symbol, _Period, 1, 2, price_data_array);
   
   //If There Is An Up Or Down Cross
   //Set The Index To The Most Recent Date Time
   
   if(up_cross)
     {
      
      up_cross_index = price_data_array[0].time;
      
     }
   
   if(down_cross)
     {
      
      down_cross_index = price_data_array[0].time;
      
     }
   
   //Output The Occurence Of An Up Or Down Cross
   //As A Vertical Line Object
   
   ObjectCreate(0, "Up Cross Line", OBJ_VLINE, 0, up_cross_index, 0, 0);
   
   ObjectSetInteger(0, "Up Cross Line", OBJPROP_COLOR, clrBlue);
   
   
   ObjectCreate(0, "Down Cross Line", OBJ_VLINE, 0, down_cross_index, 0, 0);
   
   ObjectSetInteger(0, "Down Cross Line", OBJPROP_COLOR, clrRed);
   
  }
//+------------------------------------------------------------------+
