public with sharing class TestActionPageController {
    public TestActionPageController() {
        System.debug('进入构造函数======》');
    }
    public void check(){
    	System.debug('进入Action======》');
    	PageReference pg = Page.TestActionPage;
    	pg.setRedirect(true);
    	Blob body = pg.getContent();

    }
}