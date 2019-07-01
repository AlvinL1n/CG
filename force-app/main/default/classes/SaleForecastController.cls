public with sharing class SaleForecastController{
    public List<test> testList {get;set;}
    public Integer in33{get;set;}
     public Integer in34{get;set;}
      public Integer in35{get;set;}
    public SaleForecastController(){
    in33= 2;
    in34= 2;
    in35= 2;
        testList = new List<test>();
        for(Integer  i=0;i<5;i++){
            test t = new test();
            if(i/2 > 0){
                t.bl = true;
            }
            t.it = i;
            
             testList.add(t);
        }
           test t2 = new test();
           t2.it = 6;
           t2.bl = false;
           test t23 = new test();
           t23.it = 6;
           t23.bl = false;
           testList.add(t23);
           testList.add(t2);
    
    }
    public void submit(){
         System.debug('t = '+testList );
         System.debug('in33= '+in33);
          System.debug('in34= '+in34);
           System.debug('in35= '+in35);
    
    }
    
    public class test{
        public Boolean bl {get;set;}
        public Integer it {get;set;}
        public test(){
            this.bl = false;
        }
    }
    
    
}