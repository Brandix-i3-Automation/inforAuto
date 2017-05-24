package bi3.tests.mockrun2

import bi3.tests.BaseTest
import org.testng.annotations.BeforeMethod
import org.testng.annotations.Test
import bi3.pages.LoginPage
import bi3.pages.HomePage
import bi3.pages.crs111.CRS111B1
import org.testng.Assert
import bi3.pages.crs111.CRS111E
import bi3.pages.crs111.CRS111D
import bi3.framework.util.ExcelUtil
import java.util.HashMap
import bi3.framework.config.ConfigKeys

class CRS111_CreateEmailKeyToUser extends BaseTest {
	
	LoginPage loginPage
	HomePage homePage
	CRS111B1 crs111b1
	CRS111E crs111e
	CRS111D crs111d
	ExcelUtil testData;
	HashMap<String, String> hashMap;
	
	@BeforeMethod
	def void Initialize() {
		loginPage = new LoginPage(driver)
		homePage = new HomePage(driver)
		crs111b1 = new CRS111B1(driver)
		crs111e = new CRS111E(driver)
		crs111d = new CRS111D(driver)
		val path = ConfigKeys.MOCKRUN2_TEST_DATA_PATH;
		val sheetName = "CRS111_CreateEmailKeyToUser";
		testData = new ExcelUtil(path, sheetName);
		hashMap = testData.getExcelActiveSheetFirstTwoColumnData;
	}
	
	/**
	 * @TestCaseID: TC4
	 * @CloudSuite: F&B
	 * @Description: CRS111 - Create Email Key to User
	 * @author: dasunik
	 */
	@Test
	def void CRS111_CreateEmailKeyToUser(){
		var type =  hashMap.get("type").toString();
		var emailKey =  hashMap.get("emailKey").toString();
		var email =  hashMap.get("email").toString();
		
		loginPage.GoTo()
		homePage.goToProgram("CRS111")
		Assert.assertTrue(crs111b1.getPageId().contains("CRS111/B1"))
		var exists = crs111b1.searchForEmailKey(type,emailKey)
		if(exists){
			crs111b1.clickDelete()
			crs111d.clickOnNext()
			crs111b1.refreshPage()
			exists = crs111b1.searchForEmailKey(type,emailKey)
			Assert.assertFalse(exists,"Error occurred when deleting email key")
		}
		
		crs111b1.clickCreate(type,emailKey)
		crs111e.enterEmailAddress(email)
		crs111e.clickOnNext()
		exists = crs111b1.searchForEmailKey(type,emailKey)
		
		Assert.assertTrue(exists)
		
		crs111b1.closeAllTabs()
	}
	
	
}