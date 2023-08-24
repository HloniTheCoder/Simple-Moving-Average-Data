
//Include The Indicator Classes And Price Data Classes

#include <IncludeTutorial/IndicatorDataClass.mqh>

#include <IncludeTutorial/PriceDataClass.mqh>

//Initialise The Fast and Slow MA Instances From The HSMA Indicator Class
//Initialise The Price Data Instance From The The HPriceData Class

HSMA FastMAData;

HSMA SlowMAData;

HPriceData MyPriceData;

//Fast And Slow MA Period

int slow_ma_index = 200;

int fast_ma_index = 50;

int price_avr_range = 5;

//Bullish And Bearish Signal Price
//The Price At Which A Significant Move Happened

double bullish_signal_price;

double bearish_signal_price;

int OnInit()
  {
//---

   //Define The Fast And Slow MA Indicator
   //Add The Symbol, Period Value Aswell As The MA Period

   FastMAData.Create_SMA_Definition(_Symbol, _Period, fast_ma_index);
   
   SlowMAData.Create_SMA_Definition(_Symbol, _Period, slow_ma_index);
   
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
   //Add The Array Data
   //This is An Extension Of The CopyBuffer Function
   
   FastMAData.Add_Array_Data();
   
   SlowMAData.Add_Array_Data();
   
   MyPriceData.Add_Price_Data();
   
   //Current Price Data Index
   //The Candle We Are Concerned With
   
   int price_index = 1;
   
   //Get The Current MA Value
   //Accessed Using The Price Index
   
   double fast_ma_value = FastMAData.Get_Indicator_Value(price_index);
   
   double slow_ma_value = SlowMAData.Get_Indicator_Value(price_index);
   
   //If The Fast MA Is Above/Below The Slow MA
   //If Above We Consider It A Representation Of An Uptrend
   //If Below We Consider It A Representation Of A Downtrend
   
   bool fast_above_slow = fast_ma_value > slow_ma_value;
   
   bool fast_below_slow = fast_ma_value < slow_ma_value;
   
   //Identify Candlestick Patterns
   //Identify Engulfing and Harami Patterns
   
   bool bullish_engulfing = MyPriceData.Get_Is_Bullish_Engulfing(price_index, price_avr_range);
   
   bool bearish_engulfng = MyPriceData.Get_Is_Bearish_Engulfing(price_index, price_avr_range);
   
   bool bullish_harami = MyPriceData.Get_Is_Bullish_Harami(price_index, price_avr_range);
   
   bool bearish_harami = MyPriceData.Get_Is_Bearish_Harami(price_index, price_avr_range);
   
   //Identify Bullish And Bearish Signals Using Candlestick Patterns
   
   bool bull_candle = bullish_engulfing || bullish_harami;
   
   bool bear_candle = bearish_engulfng || bearish_harami;
   
   //During An UpTrend Identify Bullish Signals
   //Index The Price Value Of The Bullish Signal
   
   if((bull_candle && fast_above_slow))
     {
      
      bullish_signal_price = MyPriceData.Get_Close_Value(price_index);
      
     }
   
   //During A DownTrend Identify Bearish Signals
   //Index The Price Value Of The Bearish Signal
     
   if((bear_candle && fast_below_slow))
     {
      
      bearish_signal_price = MyPriceData.Get_Close_Value(price_index);
      
     }
   
   //Output A Horizontal Line To Index The Bullish/Bearish Signal
     
   ObjectCreate(0, "Bullish Signal", OBJ_HLINE, 0, 0, bullish_signal_price);
   
   ObjectSetInteger(0, "Bullish Signal", OBJPROP_COLOR, clrBlue);
   
   
   ObjectCreate(0, "Bearish Signal", OBJ_HLINE, 0, 0, bearish_signal_price);
   
   ObjectSetInteger(0, "Bearish Signal", OBJPROP_COLOR, clrRed);
   
  }
//+------------------------------------------------------------------+
