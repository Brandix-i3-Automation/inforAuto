package bi3.tests.mockrun2

import bi3.tests.BaseTest
import bi3.pages.HomePage
import bi3.pages.LoginPage
import bi3.pages.ToolbarPage
import org.testng.annotations.BeforeMethod
import org.testng.annotations.Test
import org.testng.Assert
import bi3.pages.mns105.MNS105B

class SystemTC_15 extends BaseTest {
	LoginPage loginPage
	HomePage homePage
	ToolbarPage toolBarPage
	MNS105B mns105B

	@BeforeMethod
	def void Initialize() {
		loginPage = new LoginPage(driver)
		homePage = new HomePage(driver)
		toolBarPage = new ToolbarPage(driver);
		mns105B = new MNS105B(driver);

	}

	/**
	 * @TestCaseID: 15
	 * @CloudSuite: General
	 * @Description: This test case includes accessing current system languages
	 * @author:	poojas
	 */
	@Test
	def void accessCurrrentSystemLanguagesTest() {
		/* Test Data */
		var String program = "MNS105";
		var String language1 = "English";
		
		/* Test*/
		loginPage.GoTo();

		// 3. Press "Ctrl + R" button in the keyboard - Verify: Search and Start pop up window is displayed
		homePage.pressShortcutKeys("R");
		Assert.assertEquals(homePage.verifySearchAndStartPopup(), "Search and Start");

		// 4. Enter MNS105 in the Textbox - Verify: Code is entered in the textbox
		// 5. Click the Ok button - Verify:  MNS105 (System Language.Open) Program is opened and is displayed as a tab in the system. Current System Languages are displayed.
		homePage.goToProgramUsingShrt(program);
		Assert.assertEquals(mns105B.gridContainsSystemLanguages(), true);
		Assert.assertTrue(mns105B.getSystemLanguages().contains(language1), "English language is not displayed");
	}

}
