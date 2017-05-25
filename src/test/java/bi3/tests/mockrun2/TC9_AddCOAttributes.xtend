package bi3.tests.mockrun2

import bi3.tests.BaseTest
import bi3.pages.LoginPage
import bi3.pages.HomePage
import org.testng.annotations.BeforeMethod
import org.testng.annotations.Test
import org.testng.Assert
import bi3.pages.ois301.OIS301CustomerOrder
import bi3.framework.util.ExcelUtil
import java.util.HashMap
import bi3.framework.config.ConfigKeys


class TC9_AddCOAttributes extends BaseTest {

	LoginPage loginPage
	HomePage homePage
	OIS301CustomerOrder ois301
	
	ExcelUtil ois301data;
	HashMap<String, String> hashMap;
	
	@BeforeMethod
	def void Initialize() {
		loginPage = new LoginPage(driver);
		homePage = new HomePage(driver);
		ois301 = new OIS301CustomerOrder (driver);
		
		val path = ConfigKeys.MOCKRUN2_TEST_DATA_PATH;
		val sheetOIS301 = "OIS301";
		
		ois301data = new ExcelUtil(path, sheetOIS301);
		hashMap = ois301data.getExcelActiveSheetFirstTwoColumnData;
	}
	
	 /**
	 * @TestCaseID: 9
	 * @CloudSuite: FnB
	 * @Description: This test case is to validate that oder no is visible ot not
	 * @author:	mathujak
	 */
	 
	@Test(priority=1,enabled=true)
	def void ValidateOrderNumber() {
		
		// TestData
		var String orderNumber = hashMap.get("OrderNumber").toString();
		
		loginPage.GoTo();
		homePage.GoToOIS301();
		
		ois301.clickDropDownSort();
		
		ois301.enterOrderNumber(orderNumber);
		//verify whether order no is available or not
		Assert.assertEquals(ois301.validateOrderNumber, orderNumber);	
	}

	/**
	 * @TestCaseID: 9
	 * @CloudSuite: FnB
	 * @Description: This test case is to validate whether its on right panel and whether it is getting correct
	 * attribute description
	 * @author:	mathujak
	 */
	 
	@Test(priority=2,enabled=true)
	def void ValidateAttributeDescription() {

		// TestData
		var String orderNumber = hashMap.get("OrderNumber").toString();
		var String panalName = hashMap.get("PanalName").toString();
		var String attributeValue = hashMap.get("AttributeValue").toString();
		var String description = hashMap.get("Description").toString();
		
		loginPage.GoTo();
		homePage.GoToOIS301();
		
		ois301.clickDropDownSort();
		
		ois301.enterOrderNumber(orderNumber);
		//verify whether order no is available or not
		Assert.assertEquals(ois301.validateOrderNumber(), orderNumber);
		
		ois301.selectAttrValues();
		//verify it redirected to correct panel called "ATS101/G"
		Assert.assertEquals(ois301.validatePanal(panalName).text, panalName);	
		
		ois301.sortOrder();
		ois301.enterAttributeNo(attributeValue);
		//verify that get correct attribute description for particular product
		Assert.assertEquals(ois301.findDescription(description).text, "Product "+attributeValue);
			
		
		ois301.closePanal();
		ois301.closePanal();
		
		
	}
}