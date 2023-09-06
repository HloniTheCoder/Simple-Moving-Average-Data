
//Import Indicator Data Classes, Price Data Classes, and Line Object Classes

#include <IncludeIndicatorData/IndicatorDataSystems.mqh>

#include <IncludePriceData/PriceDataSystems.mqh>

#include <IncludeLineObjects/LineSystems.mqh>


//Initialise the EMA indicators, and Price Data Classes

HEMA MyFastMa;

HEMA MySlowMA;

HPriceData MyPriceData;


//Global variables
//Variables to store price values necessary for drawing horizontal lines

double bull_price;

double bull_upper;

double bull_lower;


double bear_price;

double bear_upper;

double bear_lower;


int OnInit()
  {
//---
   
   //Initialise the EMA Indicator Definition
   //The Fast MA will be a 20-period EMA
   //The Slow MA will be a 200-period EMA
   
   MyFastMa.Create_EMA_Definition(_Symbol, _Period, 20);
   
   MySlowMA.Create_EMA_Definition(_Symbol, _Period, 200);
   
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
   
   //Add Data To The Indicator and Price Data Arrays
   //The Add_Array_Data Method is based on the CopyBuffer Function
   
   MyFastMa.Add_Array_Data();
   
   MySlowMA.Add_Array_Data();
   
   MyPriceData.Add_Price_Data();
   
   
   int curr_candle_index = 1; // Current Candle Index
   
   int prev_candle_index = curr_candle_index + 1; // Previous Candle Index
   
   
   //Get the Current and Previous EMA Values
   //The Current and Previous Fast EMA Values
   //The Curent and Previous Slow EMA Values
   
   double curr_fast_value = MyFastMa.Get_Indicator_Value(curr_candle_index);
   
   double prev_fast_value = MyFastMa.Get_Indicator_Value(prev_candle_index);
   
   
   double curr_slow_value = MySlowMA.Get_Indicator_Value(curr_candle_index);
   
   double prev_slow_value = MySlowMA.Get_Indicator_Value(prev_candle_index);
   
   
   //Condition if the Fast EMA is Above the Slow EMA
   //These conditions are necessary to determine a Cross
   
   bool curr_fast_above_slow = curr_fast_value > curr_slow_value;
   
   bool prev_fast_above_slow = prev_fast_value > prev_slow_value;
   
   
   //Determine an Up and Down EMA Cross
   
   bool ma_up_cross = curr_fast_above_slow && !(prev_fast_above_slow);
   
   bool ma_down_cross = !(curr_fast_above_slow) && prev_fast_above_slow;
   
   
   double point_value = 200 * _Point;
   
   double close_price = MyPriceData.Get_Close_Value(curr_candle_index);
   
   //If an Up Or Down Cross Occurs
   //Store the Significant Values to The Bullish and Bearish Global Variables
   
   if(ma_up_cross)
     {
      
      bull_price = close_price;
      
      bull_upper = bull_price + point_value;
      
      bull_lower = bull_lower - point_value;
      
     }
   
   if(ma_down_cross)
     {
      
      bear_price = close_price;
      
      bear_upper = bear_price + point_value;
      
      bear_lower = bear_price - point_value;
      
     }
   
   
   //Bullish and Bearish Horizontal Line Names
   
   string bull_name = "Bull Signal Line";
   
   string bull_upper_name = bull_name + " Upper";
   
   string bull_lower_name = bull_name + " Lower";
   
   string bear_name = "Bear Signal Line";
   
   string bear_upper_name = bear_name + " Upper";
   
   string bear_lower_name = bear_name  + " Lower";
   
   
   //Draw The Horintal Line Objects For an Up and Down Cross
   
   Create_Horizontal_Line(bull_name, bull_price, clrBlue);
   
   Create_Horizontal_Line(bear_name, bear_price, clrRed);
   
   Create_Horizontal_Line(bull_upper_name, bull_upper, clrGreen);
   
   Create_Horizontal_Line(bull_lower_name, bull_lower, clrGreen);
   
   Create_Horizontal_Line(bear_upper_name, bear_upper, clrPurple);
   
   Create_Horizontal_Line(bear_lower_name, bear_lower, clrPurple);
   
  }
//+------------------------------------------------------------------+
