package bi3.tests.mockrun2

import bi3.tests.BaseTest
import bi3.pages.LoginPage
import bi3.pages.HomePage
import org.testng.annotations.BeforeMethod
import org.testng.annotations.Test
import bi3.pages.mns205.MNS205B1
import org.testng.Assert
import bi3.pages.mns205.MNS205F

class TC2MNS205_Add_Mail extends BaseTest {

	LoginPage loginPage
	HomePage homePage
	MNS205B1 mns205b1
	MNS205F mns205f

	@BeforeMethod
	def void Initialize() {
		loginPage = new LoginPage(driver)
		homePage = new HomePage(driver)
		mns205b1 = new MNS205B1(driver)
		mns205f = new MNS205F(driver)
	}

	/**
	 * @TestCaseID: TC2
	 * @CloudSuite: F&B
	 * @Description: MNS205_Add_Mail
	 * @author: rasithae
	 */
	@Test
	def void MNS205_Add_Mail() {
		
		// Test Data
		var user = "RASITHAE"
		var media = "*MAIL"
		var toEmailOption = "1-Display";
		var toEmailTxt = "rasithae@brandix.com";
		var fromEmailOption = "1-Display";
		var fromEmailTxt = "M3@mailserver.com";
		var subjectOption = "1-Display";
		var subjectText = "Cloud Suite Automation Testing";

		loginPage.GoTo();
		homePage.goToProgram("MNS205");
		// Delete the user if exist
		if(mns205b1.checkUserAvailable(user)){
			mns205b1.deleteUser(user);
			Assert.assertFalse(mns205b1.checkUserAvailable(user), "Deleted user is still available in the mns205b1 grid");			
		}
		// Create new email
		mns205b1.setGridHeaderValues("", user, "", media);
		mns205b1.pressShortcutKeys("1")
		Assert.assertEquals(mns205b1.getPageId(), "MNS205/F", "MNS205/F Page not Found");

		mns205f.setToEmail(toEmailOption,toEmailTxt);
		mns205f.setFromEmail(fromEmailOption,fromEmailTxt);
		mns205f.setSubject(subjectOption,subjectText);
		mns205f.clickOnNext();
		Assert.assertTrue(mns205b1.checkUserAvailable(user), "Created user is not available in the mns205b1 grid");
		
		mns205b1.CloseActiveTab();
	}
}