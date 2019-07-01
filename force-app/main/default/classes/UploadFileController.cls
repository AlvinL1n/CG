/**
* @Author: Mike Xu
* @Date: 2017-10-25 13:59:16
* @Description:  
* @Test_Class: Test_UploadFileController.cls
* @Related_Class: 
---------------------------------------------------
* @Last_Modified_by: Mike Xu
* @Last_Modified_time: 2017-11-02 20:06:58
* @Modifiy_Purpose: 
*/
public class UploadFileController {
    public Blob csvFileBody{get;set;}
    public String[] sobjectDataLines {get;set;}
    public List <Sobject> sobjectDataList {get;set;}
    public boolean readSuccess {get;set;}
    public List<String> fieldNameList{get;set;}
    public string[] csvFieldNames{set;get;}
    public String sobjectLabel{set;get;}

    public List<Sobject> sobjectDataListByPage{
        get{
            System.debug('getPageList');
            this.sobjectDataListByPage = new List<Sobject>();
            this.sobjectDataListByPage = getResult();
            return sobjectDataListByPage;
        }
        set;
    }

    public Sobject sobjectDataObj;
    public String sobjectDataAsString;
    public String fieldValue;
    public Integer fieldNumber;
    public Map <String, Integer> fieldNumberMap = new Map <String, Integer> ();
    public Id accId;
    public String sobjectType;
    public String dataType;
    public Account acc;

    public UploadFileController () {
        readSuccess      = FALSE;
        sobjectDataLines = new String[] {};
        sobjectDataList  = new List <Sobject> ();
        fieldNameList    = new List<String>();
        accId = ApexPages.currentPage().getParameters().get('id');
        sobjectType = ApexPages.currentPage().getParameters().get('sobjectType');
        if(checkDataIsNUll()){
            return;
        }
        sobjectDataObj = Schema.getGlobalDescribe().get(sobjectType).newSObject();
        sobjectLabel = sobjectDataObj.getSObjectType().getDescribe().getLabel();
    }
    public void readFromFile(){
        if(checkDataIsNUll()){
            return;
        }
        try{
            sobjectDataAsString = csvFileBody.toString();
            System.debug('bolb string ='+sobjectDataAsString);
            readCSVFile();
        }
        catch(exception e){
            readSuccess = FALSE;
            ApexPages.Message errorMessage = new ApexPages.Message(ApexPages.Severity.ERROR,'Error reading CSV file: '+e.getMessage());
            System.debug('errormessage='+e.getMessage());
            ApexPages.addMessage(errorMessage);
        }
    }
    public void readCSVFile() {
        sobjectDataList.clear();
        sobjectDataLines = sobjectDataAsString.split('\n');
        csvFieldNames    = sobjectDataLines[0].split(',');
        for (Integer i = 0; i < csvFieldNames.size(); i++) {
            fieldNumberMap.put(csvFieldNames[i], i);
            fieldNameList.add(csvFieldNames[i].trim());
        }
        for (Integer i = 1; i < sobjectDataLines.size(); i++) {

            sobjectDataObj         = Schema.getGlobalDescribe().get(sobjectType).newSObject();
            
            string[] csvRecordData = sobjectDataLines[i].split(',');
            for (String fieldName: csvFieldNames) {
                fieldNumber = fieldNumberMap.get(fieldName);
                fieldValue = csvRecordData[fieldNumber];
              sobjectDataObj.put(fieldName.trim(), fieldValue.trim());
            }
            sobjectDataList.add(sobjectDataObj);
        }
        if(sobjectDataList.size() > 0){
            pagination();
            readSuccess = TRUE;
        }
    }
    public void saveData() {
        if(checkDataIsNUll()){
            return;
        }
    }

    public Boolean checkDataIsNUll(){
        if(sobjectType == null || sobjectType == ''){
            ApexPages.Message errorMessage = new ApexPages.Message(ApexPages.Severity.ERROR,'The uploaded data type cannot be empty.');
            ApexPages.addMessage(errorMessage);
            return true;
        }
        return false;
    }

    //返回上一个页面
    public PageReference doCancel() {
        return new Pagereference('/'+accId);
    }

    //**********************分页功能***********************
    public Integer PAGE_SIZE{set;get;}
    public Integer PAGE_NUMBER{set;get;}
    public Integer PAGE_MAX_NUMBER{set;get;}
    public Integer RESULT_NUMBER{set;get;}

    /**
     * [setData description]
     * @Function_分页功能初始化
     */
    public void pagination(){
        PAGE_SIZE       = 10; // 每页条数限制
        PAGE_NUMBER     = 1; // 当前页数
        PAGE_MAX_NUMBER = 1; // 最大页数
        RESULT_NUMBER   = 0; // 记录数
        setPageMaxNumber();
    }

    // /**
    //  * [setData description]
    //  * @Function_设置分页内容
    //  * @param sobList [分页内容]
    //  */
    // public void setData(List<Sobject> sobList){
    //     this.sobjectDataList.clear();
    //     this.sobjectDataList.addAll(sobList);
    //     setPageMaxNumber();
    // }

    /**
     * [getResults description]
     * @Function_获取全部内容
     */
    public List<Sobject> getResults(){
        return this.sobjectDataList;
    }

    /**
     * [getResult description]
     * @Function_获取当前页内容
     */
    public List<Sobject> getResult(){
        System.debug('获取list');
        List<Sobject> resultList = new List<Sobject>();
        Integer i = PAGE_SIZE * (PAGE_NUMBER-1);
        for(i=i; i < RESULT_NUMBER && i< PAGE_SIZE*PAGE_NUMBER; i++){
            resultList.add(this.sobjectDataList.get(i));
        }
        System.debug(resultList);
        return resultList;
    }

    /**
     * [getPageSize description]
     * @Function_获取每页条数
     */
    public Integer getPageSize(){
        return this.PAGE_SIZE;
    }

    /**
     * [setPageSize description]
     * @Function_设置每页条数
     * @param pageSize [每页条数]
     */
    public void setPageSize(Integer pageSize){
        this.PAGE_SIZE = pageSize;
    }

    /**
     * [getPageNumber description]
     * @Function_获取当前页码
     */
    public Integer getPageNumber(){
        return this.PAGE_NUMBER;
    }

    /**
     * [setPageNumber description]
     * @Function_设置当前页码
     * @param pageNumber [页码]
     */
    public void setPageNumber(Integer pageNumber){
        this.PAGE_NUMBER = pageNumber;
    }

    /**
     * [getHasNext description]
     * @Function_是否有下一页
     */
    public Boolean getHasNext(){
        if( (PAGE_SIZE*PAGE_NUMBER) < RESULT_NUMBER){
            return TRUE;
        }else{
            return FALSE;
        }
    }

    /**
     * [getHasPrevious description]
     * @Function_是否有上一页
     */
    public Boolean getHasPrevious(){
        if(PAGE_NUMBER == 1){
            return FALSE;
        }else{
            return TRUE;
        }
    }

    /**
     * [first description]
     * @Function_第一页
     */
    public void first(){
        this.PAGE_NUMBER = 1;
    }

    /**
     * [last description]
     * @Function_最后一页
     */
    public void last(){
        this.PAGE_NUMBER = this.PAGE_MAX_NUMBER;
    }

    /**
     * [previous description]
     * @Function_前一页
     */
    public void previous(){
        if(this.PAGE_NUMBER > 1){
            this.PAGE_NUMBER--;
        }
    }

    /**
     * [next description]
     * @Function_后一页
     */
    public void next(){
        if(this.PAGE_NUMBER < this.PAGE_MAX_NUMBER){
            this.PAGE_NUMBER++;
        }
    }

    /**
     * [setPageMaxNumber description]
     * @Function_设置最大页数
     */
    private void setPageMaxNumber(){
        this.RESULT_NUMBER = this.sobjectDataList.size();

        Integer i = RESULT_NUMBER / PAGE_SIZE;
        if(i*PAGE_SIZE == RESULT_NUMBER){
            this.PAGE_MAX_NUMBER = i;
        }else{
            i++;
            this.PAGE_MAX_NUMBER = i;
        }
    }
}