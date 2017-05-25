package bi3.tests.mockrun2

import bi3.pages.LoginPage
import bi3.pages.HomePage
import bi3.pages.BasePage
import bi3.pages.StartPage
import org.testng.annotations.BeforeMethod
import org.testng.annotations.Test
import org.testng.Assert
import java.util.List

class DeleteMyPagesTest extends bi3.tests.BaseTest {
	
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
	 * @author:	lakshikaj
	 */
	@Test
	def void DeletePagesTest() {
		
		var List<String> startItemsList;
		var String newPageName = "My Page";
		
		loginPage.GoTo();
		// validate whether the start page is displayed
		Assert.assertEquals(startPage.getStartPageText,"Start","Start page is not displayed");
		
		basePage.goToHome();
		//validate the start menu list
		startItemsList = startPage.getStartMenuItemNames();		
		Assert.assertEquals(startItemsList.get(0),"Start Page");
		Assert.assertEquals(startItemsList.get(1),"Add Widget...");
		Assert.assertEquals(startItemsList.get(2),"Add Page...");
		Assert.assertEquals(startItemsList.get(3),"Add Page from Library...");
		Assert.assertEquals(startItemsList.get(4),"Delete Page...");
		Assert.assertEquals(startItemsList.get(5),"Remove Favorite Page ...");
		Assert.assertEquals(startItemsList.get(6),"Refresh");
		Assert.assertEquals(startItemsList.get(7),"My Pages...");
		Assert.assertEquals(startItemsList.get(8),"Page Settings...");
		Assert.assertEquals(startItemsList.get(9),"User Settings...");
		Assert.assertEquals(homePage.getAdvancedName, "Advanced");
		Assert.assertEquals(homePage.getAdministrationName, "Administration");
		
		// check whether a page exists and create if not
		if(startPage.checkPageExists(newPageName)){
			print("The page already exists");
		}
		else{
			print("The page not exist");
			startPage.addNewPage(newPageName);
		}
		
		basePage.goToHome();
		// validate the start list whether the new page is created
		Assert.assertTrue(startPage.checkPageExists(newPageName),"The new page is not created");
		
		startPage.gotoNewPage(newPageName);
		startPage.deletePage();
		basePage.goToHome();
		// validate the start list whether the new page is deleted
		Assert.assertFalse(startPage.checkPageExists(newPageName),"The new page is not deleted");
	}
}
