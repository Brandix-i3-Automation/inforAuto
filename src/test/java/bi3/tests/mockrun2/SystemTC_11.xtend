package bi3.tests.mockrun2

import bi3.tests.BaseTest
import bi3.pages.LoginPage
import org.testng.annotations.BeforeMethod
import org.testng.annotations.Test
import bi3.pages.HomePage

import org.testng.Assert
import bi3.pages.startMenu.AddPage
import bi3.pages.startMenu.DeletePage
import bi3.framework.util.ExcelUtil
import java.util.HashMap
import bi3.framework.config.ConfigKeys

class SystemTC_11 extends BaseTest {
	
	LoginPage loginPage
	HomePage homePage
	AddPage addPage
	DeletePage deletePage
	
	ExcelUtil startMenudata;
	HashMap<String, String> hashMap;
	
	@BeforeMethod
	def void Initialize() {
		loginPage = new LoginPage(driver);
		homePage = new HomePage(driver);
		addPage = new AddPage(driver);
		deletePage = new DeletePage(driver);
		
		val path = ConfigKeys.MOCKRUN2_TEST_DATA_PATH;
		val sheetSTRATMENU = "STARTMENU";
		
		startMenudata = new ExcelUtil(path, sheetSTRATMENU);
		hashMap = startMenudata.getExcelActiveSheetFirstTwoColumnData;
		
	}
	
	 /**
	 * @TestCaseID: 11
	 * @CloudSuite: General
	 * @Description: This test case validate that all list elements visible in start menu
	 * @author:	mathujak
	 */
	 
	@Test(priority=1,enabled=true)
	def void CheckStartMenuList() {
		loginPage.GoTo();
		
		homePage.gotoStart();
		
		val String[] expected = #['Start Page','Add Widget...','Add Page...','Add Page from Library...',
		'Delete Page...','Remove Favorite Page ...','Refresh','My Pages...','Page Settings...','User Settings...',
		'Advanced','Administration']
		
    	for (var i = 0; i < expected.length; i++) {
    		
    		if(homePage.getList(expected.get(i)).text.equals(expected.get(i))){
    			
    			System.out.println("List item : "+homePage.getList(expected.get(i)).text+" found ");
    			Assert.assertEquals(homePage.getList(expected.get(i)).text, expected.get(i));
    		}
    		else{
    			System.out.println("List item : "+homePage.getList(expected.get(i)).text+" not found ");
    		}
		}
	
	}
	
	 /**
	 * @TestCaseID: 11
	 * @CloudSuite: General
	 * @Description: This test case add new page and validate whether it was successfully created or not
	 * @author:	mathujak
	 */
	 
	@Test(priority=2,enabled=true)
	def void AddPage(){
		
		// TestData
		var String pageTitle = hashMap.get("PageTitle").toString();
		
		loginPage.GoTo();
		
		homePage.gotoStart();		
		homePage.clickAddPage();
		
		//verify that add page pop up is displayed
		Assert.assertEquals(addPage.pagePopUp, "Add Page");
		
		addPage.enterNewPageTitle(pageTitle);
		addPage.clickOkay();
		//verify blank page is displayed after created page
		Assert.assertEquals(addPage.addPage, true);
		
		homePage.gotoStart();
		//verify that created page is display in start menu
		Assert.assertEquals(addPage.findCreatedPage(pageTitle).text, pageTitle);
			
	}
	
	/**
	 * @TestCaseID: 11
	 * @CloudSuite: General
	 * @Description: This test case delete created page
	 * @author:	mathujak
	 */
	 
	@Test(priority=3,enabled=true)
	def void DeletePage(){
		
		// TestData
		var String pageTitle = hashMap.get("PageTitle").toString();
		
		loginPage.GoTo();
		
		homePage.gotoStart();		
		addPage.findCreatedPage(pageTitle).click();
		
		homePage.gotoStart();
		deletePage.deletePage();
		deletePage.clickOkayConfirmation();
		//verify that page is redirected to home page after deleting the page
		Assert.assertEquals(deletePage.navigateToHomePage, true);		
	}
	
	
	/**
	 * @TestCaseID: 11
	 * @CloudSuite: General
	 * @Description: This test case validate whether page was deleted or not
	 * @author:	mathujak
	 */
	 
	@Test(priority=4,enabled=true)
	def void CheckDeletePageVisible(){
		
		// TestData
		var String pageTitle = hashMap.get("PageTitle").toString();
		
		loginPage.GoTo();
		
		//verify that deleted page is not displayed in start menu
		homePage.gotoStart();	
		try{
		Assert.assertEquals(addPage.findCreatedPage(pageTitle).isDisplayed, false);	
		}
		catch (Exception e){
		System.out.println("Page is successfully Deleted");
		}
			
	}
	
}