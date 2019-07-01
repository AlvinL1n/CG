public with sharing class DatatableController {
    @AuraEnabled
    public static List<Book_Categories__c> getBooksByAllCategories(){
        
        List<Book_Categories__c> categeroy = [Select  Name,(Select Name, Author_Name__c, Book_Categories__c,Publisher_Id__c from Books__r) from Book_Categories__c];
        return categeroy;
    } 
    
    @AuraEnabled
    public static List<Book_Categories__c> getBooksCategories(){
        List<Book_Categories__c> categeroy = [Select  Name,Id from Book_Categories__c];
        return categeroy;
    }
    @AuraEnabled
    public static List<Books__c> getBooks(Integer limits , Integer offsets){
        System.debug('limits'+limits);
        System.debug('offsets'+offsets);
        Integer intlimits = integer.valueof(limits);
        Integer intoffsets = integer.valueof(offsets);
        
        List<Books__c> books = [Select Name,Is_Available__c,CreatedDate,publish_status__c,
                                URL__c ,Author_Name__c, Book_Categories__c,Publisher_Id__c from Books__c Order by Name Limit :intlimits Offset :intoffsets];
        return books;
    } 
    
    @AuraEnabled
    public static void setBookStatus(String status , List<Books__c> books){
        System.debug('--'+status);
        System.debug('--books --'+books);
        for(Books__c b :books){
            b.publish_status__c = status ;
        }
        
        update books;
    } 
    
    @AuraEnabled
    public static Integer getTotalCount(){
        AggregateResult results = [select  count(Id) total  from Books__c ];
        Integer total =(Integer)results.get('total') ; 
        return total;
    } 
    @AuraEnabled
    public static void deleteBooks(String ids ){
        Delete [Select id from Books__c where  id=:ids];
    } 
}