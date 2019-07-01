public class LDS_PaginationController {


    /*
    *  Account pagination query to query record with OFFSET and LIMIT
    * */

    @AuraEnabled
    public static List<Account> getAllRecords(String pageNumber,String currnetPagesCount){
        String accountQuery = 'SELECT Id,Name,Type,Industry,Rating,BillingCity FROM Account ORDER BY Name LIMIT '+currnetPagesCount+' OFFSET ';
        if(String.isBlank(pageNumber) || Integer.valueOf(pageNumber) == 1){
            accountQuery = accountQuery + ' 0';
        }else{
            accountQuery = accountQuery + String.valueOf((Integer.valueOf(pageNumber)-1)*Integer.valueOf(currnetPagesCount));
        }
     	return Database.query(accountQuery);
    }

    /*
    *  When total number of records to display changes
    *  provide footer with new set of page counter info
    *  to display
    * */

    @AuraEnabled
    public static PGN_PageInfo getPageCountInfo(String pageCountInfo){
        
        Integer currentListCount = pageCountInfo != null && pageCountInfo != '' ? Integer.valueOf(pageCountInfo) : 5;
        
        PGN_PageInfo pgn = new PGN_PageInfo();        
        pgn.totalPages = ([SELECT COUNT() FROM Account]/(currentListCount))+1;
        pgn.currentPageNumber = 1;
        List<Integer> cnt = new List<Integer>();
        for(Integer loop_var = 0;loop_var < pgn.totalPages;loop_var++){
            cnt.add(loop_var+1);
            if((loop_var+1) == 4)
                break;
        }
        if(pgn.totalPages > 4)
            cnt.add(pgn.totalPages);
        pgn.pageCounter = cnt;
        
		return pgn;        
    }

    /*
    *  When page count change or next or previous button is clicked
    *  provide footer with new set of page counter info
    *  to display
    * */

    @AuraEnabled
    public static PGN_PageInfo getPageCountChange(String pageNumber,String currnetPagesCount,String totalPages){
        PGN_PageInfo pgn = new PGN_PageInfo();
        pgn.currentPageNumber = Integer.valueOf(pageNumber);
        pgn.totalPages = Integer.valueOf(totalPages);

        List<Integer> cnt = new List<Integer>();

        if((Integer.valueOf(pageNumber)+2) < Integer.valueOf(totalPages) && Integer.valueOf(pageNumber) != 1){
            for(Integer loop_var = (Integer.valueOf(pageNumber)-1);loop_var < (Integer.valueOf(pageNumber)+3);loop_var++){
                cnt.add(loop_var);
            }
            cnt.add(pgn.totalPages);

        }else if(Integer.valueOf(pageNumber) == 1){
            for(Integer loop_var = 1;loop_var < 5;loop_var++){
                cnt.add(loop_var);
            }
            cnt.add(pgn.totalPages);
        }else{
            if(Integer.valueOf(currnetPagesCount) >= pgn.totalPages){
                for(Integer loop_var = 1;loop_var < (pgn.totalPages+1);loop_var++){
                    cnt.add(loop_var);
                }
            }else{
                for(Integer loop_var = (pgn.totalPages-4);loop_var < (pgn.totalPages+1);loop_var++){
                    cnt.add(loop_var);
                }
            }
        }
        pgn.pageCounter = cnt;

        return pgn;
    }
    
    
}