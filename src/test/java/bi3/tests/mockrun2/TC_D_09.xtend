package bi3.tests.mockrun2

import bi3.tests.BaseTest
import bi3.pages.LoginPage
import bi3.pages.HomePage
import org.testng.annotations.BeforeMethod
import org.testng.annotations.Test
import org.testng.Assert
import bi3.pages.ois301.OIS301CustomerOrder

/* Author : Mathuja Ketheeswaran */

class TC_D_09 extends BaseTest {

	LoginPage loginPage
	HomePage homePage
	OIS301CustomerOrder ois301
	
	@BeforeMethod
	def void Initialize() {
		loginPage = new LoginPage(driver);
		homePage = new HomePage(driver);
		ois301 = new OIS301CustomerOrder (driver);
	}
	
	/* Validate the order number visible in the first record
	 * 
	 * To do that : LoginPage--> GotoOIS301-->Sort theOrder-->Enter order Number
	 * Priority-->Can assign which test case need to be run first
	 * enabled(true)--> test case is activated,eligible to run
	 * enabled(false)--> test case in commented mode,it won't run
	 */
	@Test(priority=1,enabled=true)
	def void ValidateOrderNumber() {
		var String orderNumber = "0010000621"
		loginPage.GoTo();
		homePage.GoToOIS301();
		
		ois301.clickDropDownSort();
		
		ois301.enterOrderNumber(orderNumber);
		Assert.assertEquals(ois301.validateOrderNumber, "orderNumber");	
	}
	
	/* Validate panel ATS101
	 * 
	 * To do that : LoginPage--> GotoOIS301-->Sort theOrder-->Enter order Number
	 * --->Right click-->set attr values
	 * Page will navigate to ATS101
	 */
	 
	@Test(priority=2,enabled=true)
	def void ValidatePanalName() {
		var String orderNumber = "0010000621"
		var String panalName = "ATS101"
		
		loginPage.GoTo();
		homePage.GoToOIS301();
		
		ois301.clickDropDownSort();
		
		ois301.enterOrderNumber(orderNumber);
		Assert.assertEquals(ois301.validateOrderNumber, orderNumber);
		
		ois301.selectAttrValues();
		Assert.assertEquals(ois301.validatePanal(panalName), "ATS101");	
		
		
	}
	
	/* Validate attribute Description
	 * 
	 * To do that : LoginPage--> GotoOIS301-->Sort theOrder-->Enter order Number
	 * --->Right click-->click attr values
	 * Page will navigate to ATS101
	 * enter attribute value---> Check description
	 */
	 
	@Test(priority=3,enabled=false)
	def void ValidateAttributeDescription() {
		var String orderNumber = "0010000621"
		var String panalName = "ATS101"
		var String secondPanalName = "OIS301"
		var String attributeValue = "ATS101"
		var String description = "Product "+attributeValue+""
		
		
		loginPage.GoTo();
		homePage.GoToOIS301();
		
		ois301.clickDropDownSort();
		
		ois301.enterOrderNumber(orderNumber);
		Assert.assertEquals(ois301.validateOrderNumber(), orderNumber);
		
		ois301.selectAttrValues();
		Assert.assertEquals(ois301.validatePanal(panalName), panalName);	
		
		ois301.sortOrder();
		ois301.enterAttributeNo(attributeValue);
		Assert.assertEquals(ois301.findDescription(description), "Product "+attributeValue+"");	
		
		ois301.closePanal(panalName);
		ois301.closePanal(secondPanalName);
		
	}
}