package bi3.pages.oss420

import bi3.pages.BasePage
import org.openqa.selenium.WebDriver
import org.openqa.selenium.support.FindBy
import org.openqa.selenium.WebElement
import java.util.List

class OSS420E extends BasePage{
	
	new(WebDriver driver) {
		super(driver)
	}
	
	@FindBy(id="WETX40")
	WebElement txtDescription
	
	@FindBy(id="WETX15")
	WebElement txtName
	
	@FindBy(id="WESBEC-shdo")
	WebElement cmbCostAmnt
	
	@FindBy(id="WESBEA-shdo")
	WebElement cmbNetAmnt
	
	@FindBy(id="WESBEQ-shdo")
	WebElement cmbBudQty
	
	@FindBy(id="WECUCD")
	WebElement txtCurrency
	
	@FindBy(id="WECRTP")
	WebElement txtExRateTyp
	
	@FindBy(id="WEPCTP")
	WebElement txtCostTyp
	
	@FindBy(id="WEPSSV-shdo")
	WebElement cmbSubTotal
	
	@FindBy(css="ul[class='dropdown-list'] >li")
	List <WebElement> list;
	
	/**
	 * Fill detail information in Sale Budget Creation
	 */
	def void fillInformation(String description,String name,String amount, String budQty, String currency, String exRate, String costType,String subTot){
		txtDescription.click();
		txtDescription.sendKeys(description);
		txtName.click();
		txtName.sendKeys(name);
		selectFromDropdown(cmbNetAmnt,list,amount);
		selectFromDropdown(cmbCostAmnt,list,amount);
		selectFromDropdown(cmbBudQty,list,budQty);
		txtCurrency.click();
		txtCurrency.sendKeys(currency);
		txtExRateTyp.click();
		txtExRateTyp.sendKeys(exRate);
		txtCostTyp.click();
		txtCostTyp.sendKeys(costType);
		selectFromDropdown(cmbSubTotal,list,subTot);
		clickOnNext();
	}
}