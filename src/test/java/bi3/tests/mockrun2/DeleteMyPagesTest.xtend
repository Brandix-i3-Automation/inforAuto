package bi3.tests.mockrun2

import bi3.tests.BaseTest
import bi3.pages.LoginPage
import bi3.pages.HomePage
import bi3.pages.BasePage
import bi3.pages.StartPage
import org.testng.annotations.BeforeMethod
import org.testng.annotations.Test
import org.testng.Assert


class DeleteMyPagesTest extends BaseTest {
	
	LoginPage loginPage
	HomePage homePage
	BasePage basePage
	StartPage startPage
	
	@BeforeMethod
	def void Initialize() {
		loginPage = new LoginPage(driver);
		homePage = new HomePage(driver);
		basePage = new BasePage(driver);
		startPage = new StartPage(driver);
	}
	
	/**
	 * @TestCaseID: System Test case 12
	 * @CloudSuite: F&B
	 * @Description: This test case includes the steps to delete a page
	 * @author:	LakshikaJ
	 */
	@Test
	def void DeletePagesTest() {
		
		var String newPageName = "My Page";
            
		loginPage.GoTo();
		// validate whether the start page is displayed
		Assert.assertEquals(startPage.getStartPageText,"Start","Start page is not displayed");
		
		basePage.goToHome();
		//validate the start menu list      
      	validateStartMenuList();
		
		// check whether a page exists and create if not
		if(startPage.checkPageExists(newPageName)){
			System.out.println("The page already exists");
		}
		else{
			System.out.println("The page not exist");
			startPage.addNewPage(newPageName);
		}
		
		basePage.goToHome();
		// validate the start list whether the new page is created
		Assert.assertTrue(startPage.checkPageExists(newPageName),"The new page is not created");
		
		startPage.gotoNewPage(newPageName);
		startPage.deletePage();
		Thread.sleep(2000);
		basePage.goToHome();
		// validate the start list whether the new page is deleted
		Assert.assertFalse(startPage.checkPageExists(newPageName),"The new page is not deleted");
	}
	
	/**
	 * Validates the items in the start menu list
	 */
	def validateStartMenuList(){
		val String[] EXPECTED_MENU_LIST = #['Start Page','Add Widget...','Add Page...','Add Page from Library...',
            'Delete Page...','Remove Favorite Page ...','Refresh','My Pages...','Page Settings...','User Settings...',
            'Advanced','Administration']
            
		for (var i = 0; i < EXPECTED_MENU_LIST.length; i++) {
            
            if(homePage.getList(EXPECTED_MENU_LIST.get(i)).text.equals(EXPECTED_MENU_LIST.get(i))){
                  
                  System.out.println("List item : "+homePage.getList(EXPECTED_MENU_LIST.get(i)).text+" found ");
                  Assert.assertEquals(homePage.getList(EXPECTED_MENU_LIST.get(i)).text, EXPECTED_MENU_LIST.get(i));
            }
            else{
                  System.out.println("List item : "+homePage.getList(EXPECTED_MENU_LIST.get(i)).text+" not found ");
            }
        }
	}
}
