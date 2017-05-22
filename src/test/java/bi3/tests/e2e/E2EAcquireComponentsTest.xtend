package bi3.tests.e2e

import bi3.pages.LoginPage
import bi3.pages.HomePage
import org.testng.annotations.BeforeMethod
import org.testng.annotations.Test
import bi3.pages.pps200.PPS200A
import bi3.pages.pps200.PPS200B
import bi3.pages.pps201.PPS201B
import bi3.tests.BaseTest
import bi3.framework.util.DataUtil
import bi3.pages.ToolbarPage
import bi3.pages.ois300.OIS300
import bi3.pages.pps600.PPS600E
import bi3.pages.pps600.PPS600F
import bi3.pages.pps600.PPS600SelectMedia
import org.testng.Assert

class E2EAcquireComponentsTest extends BaseTest {

	LoginPage loginPage
	HomePage homePage
	PPS200A pps200A
	PPS200B pps200B
	PPS201B pps201B
	ToolbarPage toolbarPage
	OIS300 ois300
	PPS600E pps600E
	PPS600F pps600F
	PPS600SelectMedia pps600SelectMedia

	@BeforeMethod
	def void Initialize() {
		loginPage = new LoginPage(driver)
		homePage = new HomePage(driver)
		pps200A = new PPS200A(driver)
		pps200B = new PPS200B(driver)
		pps201B = new PPS201B(driver)
		toolbarPage = new ToolbarPage(driver)
		ois300 = new OIS300(driver)
		pps600E = new PPS600E(driver)
		pps600F = new PPS600F(driver)
		pps600SelectMedia = new PPS600SelectMedia(driver)
	}

	/**
	 * @TestCaseID: 003
	 * @CloudSuite: F&B
	 * @Description: Test the PO work flow and purchase raw materials & ingredients to be used in manufacturing
	 * @author:	Insaaf
	 */
	@Test
	def void E2EAcquireComponentsTest() {
		val PONo = DataUtil.get10DigitId();
		loginPage.GoTo();
		homePage.GoToPPS200();
		pps200B.CreatePO(PONo);
		println(PONo);
		toolbarPage.clickCreateLogo();
		pps200A.fillPOData("Y50001", "170524", "D20");
		Thread.sleep(10000);
		homePage.clickNextTillReqPanel("PPS201/B1")
//		homePage.clickOnNext();
//		homePage.clickOnNext();
//		homePage.clickOnNext();
//		homePage.clickOnNext();
		pps201B.fillLineEntry("D50519", "20", "KG", "20");
		pps201B.CloseActiveTab();
		pps201B.fillLineEntry("D50518", "10", "KG", "10");
		pps201B.closeAllTabs();
		homePage.GoToPPS200();
		if (pps200B.SearchPONo(PONo)) {
			println("PO IS displayed in the Grid")
			pps200B.GoToLinesOfRecordWithPO(PONo);
			pps201B.verifyStatus();
			pps201B.closeAllTabs();
			homePage.GoToPPS600();
			pps600E.FillPONumbers(PONo);
			pps600E.FillLowestStatus("15");
			pps600E.FillHighestStatus("15");
			homePage.clickOnNext();
			pps600F.FillReportText(PONo);
			homePage.clickOnNext();
			pps600SelectMedia.ConfirmOutput();
			pps600E.closeAllTabs();
			homePage.GoToPPS200();
			var lstStatus = pps200B.verifyLowerStatus(PONo);
			Assert.assertEquals(lstStatus, "20", "Status is not 20");
		} else {
			println("PO IS NOT displayed in the Grid")
		}
		driver.quit();
	}
}
