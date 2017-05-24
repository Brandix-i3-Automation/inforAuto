package bi3.tests.fnb


import bi3.tests.BaseTest
import bi3.pages.LoginPage
import bi3.pages.HomePage
import org.testng.annotations.BeforeMethod
import bi3.pages.startMenu.MyPages
import org.testng.annotations.Test
import bi3.pages.startMenu.StartMenuPage
import bi3.pages.startMenu.AddPage
import org.testng.Assert

class SharePagesToOtherUsers extends BaseTest {
	
	LoginPage loginPage
	HomePage homePage
	MyPages myPages
	StartMenuPage startMenuPage
	AddPage addPage
	
	@BeforeMethod
	def void Initialize() {
		loginPage = new LoginPage(driver);
		homePage = new HomePage(driver);
		myPages = new MyPages(driver);
		startMenuPage = new StartMenuPage(driver);
		addPage = new AddPage(driver);
	}
	
	/**
      * @TestCaseID:   14
      * @CloudSuite:   F&B
      * @Description: M3 UI Adapter: Share My Pages to other users
      * @author: AnushkaC
      */
	@Test
	def void sharePagesToOthers(){
		loginPage.GoTo();
		
		//Assertion No.2
	//	Assert.assertEquals(homePage.getStartValue, "Start");
		
		/**
		 * Add a new page.
		 */
	//	homePage.clickStart();
		startMenuPage.goToAddPage();
	//	addPage.addingPage("AC Test Page");
		
		
		/**
		 * Share pages.
		 */
	//	homePage.clickStart();
		//Assertion No.3
		startMenuPage.goToMyPages();
		//Assertion No.4
		myPages.clickPageSettings();
		//Assertion No.5
		myPages.toggleShareButton();
		//Assertion No.6
		Assert.assertEquals(myPages.getTogglecolor(), "#007FEA");
		myPages.savePageSettings();
		//Assertion No.7
		
		//Assertion No.8
		
		
	
	}
	
}

//import bi3.tests.BaseTest
//import bi3.pages.LoginPage
//import bi3.pages.HomePage
//import org.testng.annotations.BeforeMethod
//import bi3.pages.startmenu.MyPages
//import org.testng.annotations.Test
//import bi3.pages.startmenu.StartMenuPage
//import bi3.pages.startmenu.AddPage
//import org.testng.Assert
//
//class SharePagesToOtherUsers extends BaseTest {
//	
//	LoginPage loginPage
//	HomePage homePage
//	MyPages myPages
//	StartMenuPage startMenuPage
//	AddPage addPage
//	
//	@BeforeMethod
//	def void Initialize() {
//		loginPage = new LoginPage(driver);
//		homePage = new HomePage(driver);
//		myPages = new MyPages(driver);
//		startMenuPage = new StartMenuPage(driver);
//		addPage = new AddPage(driver);
//	}
//	
//	/**
//      * @TestCaseID:   14
//      * @CloudSuite:   F&B
//      * @Description: M3 UI Adapter: Share My Pages to other users
//      * @author: AnushkaC
//      */
//	@Test
//	def void sharePagesToOthers(){
//		loginPage.GoTo();
//		
//		//Assertion No.2
//		Assert.assertEquals(homePage.getStartValue, "Start");
//		
//		/**
//		 * Add a new page.
//		 */
//		homePage.clickStart();
//		startMenuPage.goToAddPage();
//		addPage.addingPage("AC Test Page");
//		
//		
//		/**
//		 * Share pages.
//		 */
//		homePage.clickStart();
//		//Assertion No.3
//		startMenuPage.goToMyPages();
//		//Assertion No.4
//		myPages.clickPageSettings();
//		//Assertion No.5
//		myPages.toggleShareButton();
//		//Assertion No.6
//		Assert.assertEquals(myPages.getTogglecolor(), "#007FEA");
//		myPages.savePageSettings();
//		//Assertion No.7
//		
//		//Assertion No.8
//		
//		
//	
//	}
//	
//}

