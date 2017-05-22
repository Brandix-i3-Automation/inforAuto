package bi3.pages.pps200

import bi3.pages.BasePage
import org.openqa.selenium.WebDriver
import org.openqa.selenium.support.FindBy
import org.openqa.selenium.WebElement

class PPS200A extends BasePage{
	
	new(WebDriver driver) {
		super(driver)
	}
	
	/**Supplier text box */
	@FindBy	(id = "WASUNO")
	WebElement txtSupplier
	
	/**Required Delivery Date */
	@FindBy	(id = "WADWDT")
	WebElement dateReqDel
	
	/**Order type text box */
	@FindBy	(id = "WAORTY")
	WebElement txtOrderType
	
	/**
	 * Used to Fill data when creating a PO in PPS200/A
	 * @param : Supplier 
	 * @param : Required Delivery Date
	 * @param : Order Type
	 */
	def void fillPOData(String supplier, String delDate, String orderType) {
		txtSupplier.click();
		txtSupplier.sendKeys(supplier);
		dateReqDel.click();
		dateReqDel.sendKeys(delDate);
		txtOrderType.click();
		txtOrderType.sendKeys(orderType);
		waitForLoadingComplete();
	}
}