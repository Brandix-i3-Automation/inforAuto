package bi3.tests.mockrun2

import bi3.tests.BaseTest
import bi3.pages.LoginPage
import bi3.pages.HomePage
import org.testng.annotations.BeforeMethod
import org.testng.annotations.Test
import org.testng.Assert
import bi3.pages.startMenu.MyPages
import bi3.pages.startMenu.StartMenuPage
import bi3.pages.startMenu.AddPage
import bi3.pages.startMenu.PageSettings
import bi3.framework.util.DateUtil
import bi3.pages.startMenu.DeletePage

class SharePagesToOtherUsers extends BaseTest {
	
	LoginPage loginPage
	HomePage homePage
	MyPages myPages
	StartMenuPage startMenuPage
	AddPage addPage
	PageSettings pageSettings
	DeletePage deletePage
	
	@BeforeMethod
	def void Initialize() {
		loginPage = new LoginPage(driver);
		homePage = new HomePage(driver);
		myPages = new MyPages(driver);
		startMenuPage = new StartMenuPage(driver);
		addPage = new AddPage(driver);
		pageSettings = new PageSettings(driver);
		deletePage = new DeletePage(driver);
	}
	
	/**
      * @TestCaseID: 14
      * @CloudSuite: F&B
      * @Description: M3 UI Adapter: Share My Pages to other users
      * @author: AnushkaC
      */
	@Test
	def void sharePagesToOthers(){
		var String pageTitle = "AC Test Page"
		
		loginPage.GoTo();
		//Assertion No.2
		Assert.assertEquals(homePage.verifyStartPageExist, "Start");
		
		/* Adding a new page.*/
		homePage.clickStart();
		startMenuPage.goToAddPage();
		addPage.enterNewPageTitle(pageTitle);
		addPage.clickOkay();
		
		// 3. Click Start arrow button - Verify:Start list is displayed with the following functionalities:
		homePage.clickStart();
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
				
		// 4. Click My Pages… - Verify: My Start Pages pop-up window will be displayed. Current Pages are displayed with the following details: 		
		startMenuPage.goToMyPages();
		Assert.assertTrue(myPages.isMyPageOpened(),"My Start Pages Popup is not opened")
		Assert.assertTrue(myPages.isPageTitleAvailable(pageTitle),"Page title is not available");
		Assert.assertEquals(myPages.getOwner(pageTitle), "Me", "Owner is incorrect");
		Assert.assertEquals(myPages.getChangedDate(pageTitle), DateUtil.getCurrentDate("yyyy-MM-dd"), "Changed date is not equal to current system date");
		Assert.assertTrue(myPages.isSettingsIconAvailable(pageTitle),"Settings icon is not displayed");
		Assert.assertTrue(myPages.isRemoveFavBtnAvailable(pageTitle),"Remove Fav button is not displayed");
		Assert.assertTrue(myPages.isDeleteIconAvailable(pageTitle),"Delete icon is not displayed");
		Assert.assertTrue(myPages.isMyPageOpened(),"My Start Pages Popup is not opened");
		
		// 5. Choose <Page>, click Settings icon - Verify: Page Settings pop-up window is displayed with the following details:
		myPages.clickPageSettings(pageTitle); 
		Assert.assertTrue(pageSettings.isPageSettingsPopupOpened(),"");
		Assert.assertEquals(pageSettings.getNameLabelValue(),"Name");
		Assert.assertEquals(pageSettings.getDescriptionLabelValue(), "Description");
		Assert.assertEquals(pageSettings.getOwnerLabelValue(), "Owner");
		Assert.assertEquals(pageSettings.getChangedByUserLabelValue(), "Changed by");
		Assert.assertEquals(pageSettings.getChangedTimeLabelValue(), "Changed");
		Assert.assertEquals(pageSettings.getEditorLabelValue(), "Editors");
		Assert.assertEquals(pageSettings.getSharePageLabelValue(), "Share this page");
		Assert.assertEquals(pageSettings.getLockPageLabelValue(), "Lock this page");
		
		// 6. Click Share this page toggle switch in gray color - Verify: Share this page toggle switch. Toggle switch turns from color gray to blue
		pageSettings.toggleShareButton();
		//Assert.assertEquals(myPages.getTogglecolor(), "#007FEA");
		pageSettings.savePageSettings();
		
		// 7. Click OK - Verify: Page Settings pop-up window closes. Type changes from null to Globe icon., Changed date is updated to present date.
		Assert.assertFalse(pageSettings.isPageSettingsPopupOpened());
		Assert.assertTrue(myPages.isTypeIconAvailable(pageTitle));
		Assert.assertEquals(myPages.getChangedDate(pageTitle), DateUtil.getCurrentDate("yyyy-MM-dd"), "Changed date is not equal to current system date");
		
		
		/* Deleting a created page. */
		 myPages.clickDeleteIcon(pageTitle);
		 deletePage.confirmDeletion();
		 
		/* Closing My Pages panel. */
		 myPages.closeMyPages();
		 //Assertion No.8
		Assert.assertFalse(myPages.isMyPageOpened()," My Start Pages popup window is not closed");
	}
	
}