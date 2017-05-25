package bi3.tests.mockrun2

import bi3.tests.BaseTest
import bi3.pages.LoginPage
import org.testng.annotations.BeforeMethod
import org.testng.annotations.Test
import bi3.pages.HomePage

import org.testng.Assert
import bi3.pages.startMenu.AddPage
import bi3.pages.startMenu.DeletePage

/* Author : Mathuja Ketheeswaran */

class TC_11 extends BaseTest {
	
	LoginPage loginPage
	HomePage homePage
	AddPage addPage
	DeletePage deletePage
	
	@BeforeMethod
	def void Initialize() {
		loginPage = new LoginPage(driver);
		homePage = new HomePage(driver);
		addPage = new AddPage(driver);
		deletePage = new DeletePage(driver);
		
	}
	
	/* Validate all the items listed in start Page
	 * 
	 * To do that : LoginPage--> Click StartPage
	 * Check each list names
	 */
	 
	@Test(priority=1,enabled=true)
	def void CheckStartMenuList() {
		loginPage.GoTo();
		
		homePage.gotoStart();
		
		Assert.assertEquals(homePage.startPageName, "Start Page");
		Assert.assertEquals(homePage.getAddWidgetName, "Add Widget...");
		Assert.assertEquals(homePage.getAddPageName, "Add Page...");
		Assert.assertEquals(homePage.getAddPageFromLibraryName, "Add Page from Library...");
		Assert.assertEquals(homePage.getDeletePageName, "Delete Page...");
		Assert.assertEquals(homePage.getRemoveFavouritePageName, "Remove Favorite Page ...");
		Assert.assertEquals(homePage.getRefreshName, "Refresh");
		Assert.assertEquals(homePage.getMyPagesName, "My Pages...");
		Assert.assertEquals(homePage.getPageSettingsName, "Page Settings...");
		Assert.assertEquals(homePage.getUserSettingsName, "User Settings...");
		Assert.assertEquals(homePage.getAdvancedName, "Advanced");
		Assert.assertEquals(homePage.getAdministrationName, "Administration");
		
	}
	
	/* Validate AddPage Pop is visible and Validate whether created page is visible
	 * 
	 * To do that : LoginPage--> Click StartPage-->Click addPage
	 * Check the popup
	 * --->enterPageName
	 * Validate whether addedPage is visible after added the new page
	 * Validate whether addedPage is visible is submenuList
	 */
	 
	@Test(priority=2,enabled=true)
	def void AddPage(){
		var String pageTitle = "myPage"
		loginPage.GoTo();
		
		homePage.gotoStart();		
		homePage.clickAddPage();
		
		Assert.assertEquals(addPage.pagePopUp, "Add Page");
		
		addPage.enterNewPageTitle(pageTitle);
		addPage.clickOkay();
		Assert.assertEquals(addPage.addPage, true);
		
		homePage.gotoStart();
		Assert.assertEquals(addPage.findCreatedPage(pageTitle).text, "myPage");
		
		
		
	}
	
	/* Delete created Page
	 * 
	 * To do that : LoginPage--> Click StartPage-->Click on added page
	 * -->Click Delete-->Click ok on confirmation delete
	 */
	 
	@Test(priority=3,enabled=true)
	def void DeletePage(){
		var String pageTitle = "myPage"
		loginPage.GoTo();
		
		homePage.gotoStart();		
		addPage.findCreatedPage(pageTitle).click();
		
		homePage.gotoStart();
		deletePage.deletePage();
		deletePage.clickOkayConfirmation();
		Assert.assertEquals(deletePage.navigateToHomePage, true);
		
			
	}
	
	/* Validate whether deleted page is visible in menu
	 * 
	 * To do that : LoginPage--> Click StartPage-->Check the list
	 */
	 
	@Test(priority=4,enabled=true)
	def void CheckDeletePageVisible(){
		var String pageTitle = "myPage"
		loginPage.GoTo();
		
		homePage.gotoStart();	
		try{
		Assert.assertEquals(addPage.findCreatedPage(pageTitle).isDisplayed, false);	
		}
		catch (Exception e){
		System.out.println("Page is successfully Deleted");
		}
		
		
			
	}
	
}