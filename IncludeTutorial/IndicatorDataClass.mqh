
//Single Buffer Indicator Class
//Single Buffer Indicators Are Indicators That Are Made Up Of A Single Line Graph
//All Single Buffer Indicators Will Inherit From This Class
//Single Buffer Indicators Include:
//MA, RSI, Force Index, Momentum, ATR, MFI, OBV, CCI

class SingleBufferIndicator{
   
   protected:
      int indicator_definition;
      double indicator_array[];
      
   public:
      SingleBufferIndicator();
      void Add_Array_Data();
      double Get_Indicator_Value(int pIndex=0);
   
};


SingleBufferIndicator::SingleBufferIndicator(void){
   
   ArraySetAsSeries(indicator_array, true);
   
}


void SingleBufferIndicator::Add_Array_Data(void){
   
   CopyBuffer(indicator_definition, 0, 0, 100, indicator_array);
   
}


double SingleBufferIndicator::Get_Indicator_Value(int pIndex=0){
   
   double indicator_value = indicator_array[pIndex];
   
   return(NormalizeDouble(indicator_value, 5));
   
}


class HSMA: public SingleBufferIndicator{
   
   public:
      int Create_SMA_Definition(string pSymbol, ENUM_TIMEFRAMES pTimeFrame, int pMAPeriod,
                                int pMAShift=0, ENUM_MA_METHOD pMAMethod=MODE_SMA,
                                ENUM_APPLIED_PRICE pMAPrice=PRICE_CLOSE);
   
};


int HSMA::Create_SMA_Definition(string pSymbol,ENUM_TIMEFRAMES pTimeFrame,int pMAPeriod,int pMAShift=0,ENUM_MA_METHOD pMAMethod=0,ENUM_APPLIED_PRICE pMAPrice=1){
   
   indicator_definition = iMA(pSymbol, pTimeFrame, pMAPeriod, pMAShift, pMAMethod, pMAPrice);
   
   return(indicator_definition);
   
}


class HEMA: public SingleBufferIndicator{
   
   public:
      int Create_EMA_Definition(string pSymbol, ENUM_TIMEFRAMES pTimeFrame, int pMAPeriod,
                                int pMAShift=0, ENUM_MA_METHOD pMAMethod=MODE_EMA,
                                ENUM_APPLIED_PRICE pMAPrice=PRICE_CLOSE);
   
};


int HEMA::Create_EMA_Definition(string pSymbol,ENUM_TIMEFRAMES pTimeFrame,int pMAPeriod,int pMAShift=0,ENUM_MA_METHOD pMAMethod=1,ENUM_APPLIED_PRICE pMAPrice=1){
   
   indicator_definition = iMA(pSymbol, pTimeFrame, pMAPeriod, pMAShift, pMAMethod, pMAPrice);
   
   return(indicator_definition);
   
}


class HRSI: public SingleBufferIndicator{
   
   public:
      int Create_RSI_Definition(string pSymbol, ENUM_TIMEFRAMES pTimeFrame, int pRSIPeriod=14,
                                ENUM_APPLIED_PRICE pAppliedPrice=PRICE_CLOSE);
   
};


int HRSI::Create_RSI_Definition(string pSymbol,ENUM_TIMEFRAMES pTimeFrame,int pRSIPeriod=14,ENUM_APPLIED_PRICE pAppliedPrice=1){
   
   indicator_definition = iRSI(pSymbol, pTimeFrame, pRSIPeriod, pAppliedPrice);
   
   return(indicator_definition);
   
}


class HSAR: public SingleBufferIndicator{
   
   public:
      int Create_SAR_Definition(string pSymbol, ENUM_TIMEFRAMES pTimeFrame, double pStep=0.02,
                                double pMaximum=0.2);
};


int HSAR::Create_SAR_Definition(string pSymbol,ENUM_TIMEFRAMES pTimeFrame,double pStep=0.020000,double pMaximum=0.200000){

   indicator_definition = iSAR(pSymbol, pTimeFrame, pStep, pMaximum);
   
   return(indicator_definition);
   
}


class HATR: public SingleBufferIndicator{
   
   public:
      int Create_ATR_Definition(string pSymbol, ENUM_TIMEFRAMES pTimeFrame, int pATRPeriod=14);
   
};


int HATR::Create_ATR_Definition(string pSymbol,ENUM_TIMEFRAMES pTimeFrame,int pATRPeriod=14){

   indicator_definition = iATR(pSymbol, pTimeFrame, pATRPeriod);
   
   return(indicator_definition);
   
}


class HForce: public SingleBufferIndicator{
   
   public:
      int Create_Force_Definition(string pSymbol, ENUM_TIMEFRAMES pTimeFrame, int pForcePeriod=14,
                                  ENUM_MA_METHOD pMAMethod=MODE_EMA, ENUM_APPLIED_VOLUME pVolume=VOLUME_TICK);
   
};


int HForce::Create_Force_Definition(string pSymbol,ENUM_TIMEFRAMES pTimeFrame,int pForcePeriod=14,ENUM_MA_METHOD pMAMethod=1,ENUM_APPLIED_VOLUME pVolume=0){

   indicator_definition = iForce(pSymbol, pTimeFrame, pForcePeriod, pMAMethod, pVolume);
   
   return(indicator_definition);
   
}


class HMomentum: public SingleBufferIndicator{
   
   public:
      int Create_Momentum_Definition(string pSymbol, ENUM_TIMEFRAMES pTimeFrame, int pPeriod=14,
                                     ENUM_APPLIED_PRICE pAppliedPrice=PRICE_CLOSE);
   
};


int HMomentum::Create_Momentum_Definition(string pSymbol,ENUM_TIMEFRAMES pTimeFrame,int pPeriod=14,ENUM_APPLIED_PRICE pAppliedPrice=1){

   indicator_definition = iMomentum(pSymbol, pTimeFrame, pPeriod, pAppliedPrice);
   
   return(indicator_definition);
   
}


class HCommodity: public SingleBufferIndicator{
   
   public:
      int Create_Commodity_Definition(string pSymbol, ENUM_TIMEFRAMES pTimeFrame, int pPeriod=14,
                                      ENUM_APPLIED_PRICE pAppliedPrice=PRICE_CLOSE);
   
};


int HCommodity::Create_Commodity_Definition(string pSymbol,ENUM_TIMEFRAMES pTimeFrame,int pPeriod=14,ENUM_APPLIED_PRICE pAppliedPrice=1){
   
   indicator_definition = iCCI(pSymbol, pTimeFrame, pPeriod, pAppliedPrice);
   
   return(indicator_definition);
   
}


class HOBV: public SingleBufferIndicator{
   
   public:
      int Create_OBV_Definition(string pSymbol, ENUM_TIMEFRAMES pTimeFrame,
                                ENUM_APPLIED_VOLUME pAppliedVolume=VOLUME_TICK);
   
};


int HOBV::Create_OBV_Definition(string pSymbol,ENUM_TIMEFRAMES pTimeFrame,ENUM_APPLIED_VOLUME pAppliedVolume=0){

   indicator_definition = iOBV(pSymbol, pTimeFrame, pAppliedVolume);
   
   return(indicator_definition);
   
}


class HMFI: public SingleBufferIndicator{
   
   public:
      int Create_MFI_Definition(string pSymbol, ENUM_TIMEFRAMES pTimeFrame, int pPeriod=24,
                                ENUM_APPLIED_VOLUME pAppliedVolume=VOLUME_TICK);
   
};


int HMFI::Create_MFI_Definition(string pSymbol,ENUM_TIMEFRAMES pTimeFrame,int pPeriod=24,ENUM_APPLIED_VOLUME pAppliedVolume=0){

   indicator_definition = iMFI(pSymbol, pTimeFrame, pPeriod, pAppliedVolume);
   
   return(indicator_definition);
   
}


//Double Buffer Indicator Class
//Double Buffer Indicators Are Indicators Made Up Of Two Line Graphs
//All Double Buffer Indicators Will Inherit From This Class
//Double Buffer Indicators Include:
//MACD, Stochastic, Envelope

class DoubleBufferIndicator{
   
   protected:
      int indicator_definition;
      double upper_line_array[];
      double lower_line_array[];
      
   public:
      DoubleBufferIndicator();
      void Add_Array_Data();
      double Return_Upper_Value(int pIndex=0);
      double Return_Lower_Value(int pIndex=0);
   
};


DoubleBufferIndicator::DoubleBufferIndicator(void){
   
   ArraySetAsSeries(upper_line_array, true);
   ArraySetAsSeries(lower_line_array, true);
   
}


void DoubleBufferIndicator::Add_Array_Data(void){
   
   CopyBuffer(indicator_definition, 0, 0, 100, upper_line_array);
   CopyBuffer(indicator_definition, 1, 0, 100, lower_line_array);
   
}


double DoubleBufferIndicator::Return_Upper_Value(int pIndex=0){
   
   double upper_value = upper_line_array[pIndex];
   
   return(NormalizeDouble(upper_value, 5));
   
}


double DoubleBufferIndicator::Return_Lower_Value(int pIndex=0){
   
   double lower_value = lower_line_array[pIndex];
   
   return(NormalizeDouble(lower_value, 5));
   
}


class HEnvelope: public DoubleBufferIndicator{
   
   public:
      int Create_Envelope_Definition(string pSymbol, ENUM_TIMEFRAMES pTimeFrame, int pPeriod=14,
                                     int pMAShift=0, ENUM_MA_METHOD pMAMethod=MODE_SMA,
                                     ENUM_APPLIED_PRICE pAppliedPrice=PRICE_CLOSE,
                                     double pDeviation=0.1);
   
};


int HEnvelope::Create_Envelope_Definition(string pSymbol,ENUM_TIMEFRAMES pTimeFrame,int pPeriod=14,int pMAShift=0,ENUM_MA_METHOD pMAMethod=0,ENUM_APPLIED_PRICE pAppliedPrice=1,double pDeviation=0.100000){

   indicator_definition = iEnvelopes(pSymbol, pTimeFrame, pPeriod, pMAShift, pMAMethod, pAppliedPrice, pDeviation);
   
   return(indicator_definition);
   
}


class HMACD: public DoubleBufferIndicator{
   
   public:
      int Create_MACD_Definition(string pSymbol, ENUM_TIMEFRAMES pTimeFrame, int pFastPeriod=12,
                                 int pSlowPeriod=26, int pSignalPeriod=9,
                                 ENUM_APPLIED_PRICE pAppliedPrice=PRICE_CLOSE);
   
};


int HMACD::Create_MACD_Definition(string pSymbol,ENUM_TIMEFRAMES pTimeFrame,int pFastPeriod=12,int pSlowPeriod=26,int pSignalPeriod=9,ENUM_APPLIED_PRICE pAppliedPrice=1){
   
   indicator_definition = iMACD(pSymbol, pTimeFrame, pFastPeriod, pSlowPeriod, pSignalPeriod, pAppliedPrice);
   
   return(indicator_definition);
   
}


class HStochastic: public DoubleBufferIndicator{
   
   public:
      int Create_Stochastic_Definition(string pSymbol, ENUM_TIMEFRAMES pTimeFrame, int pKPeriod=5,
                                       int pDPeriod=3, int pSlowing=3,
                                       ENUM_MA_METHOD pSmoothing=MODE_SMA,
                                       ENUM_STO_PRICE pPriceField=STO_LOWHIGH);
   
};


int HStochastic::Create_Stochastic_Definition(string pSymbol,ENUM_TIMEFRAMES pTimeFrame,int pKPeriod=5,int pDPeriod=3,int pSlowing=3,ENUM_MA_METHOD pSmoothing=0,ENUM_STO_PRICE pPriceField=0){
   
   indicator_definition = iStochastic(pSymbol, pTimeFrame, pKPeriod, pDPeriod, pSlowing, pSmoothing, pPriceField);
   
   return(indicator_definition);
   
}