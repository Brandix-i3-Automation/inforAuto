package bi3.pages.oss420

import bi3.pages.BasePage
import org.openqa.selenium.WebDriver
import org.openqa.selenium.support.FindBy
import org.openqa.selenium.WebElement
import org.openqa.selenium.Keys
import org.openqa.selenium.By

class OSS421E extends BasePage{
	
	new(WebDriver driver) {
		super(driver)
	}
	
	@FindBy(id="WHCOL1")
	WebElement txtInvoicedQty
	
	@FindBy(id="WHCOL1")
	WebElement cellEdit
	
	def void setDemandValues(String field,String demand){
		txtInvoicedQty.click();
		txtInvoicedQty.sendKeys(Keys.F4);
		waitForLoadingComplete();
		driver.findElement(By.xpath("//div[contains(text(),'"+field+"')]")).click();
		pressEnterKey(driver.findElement(By.xpath("//div[contains(text(),'"+field+"')]")));
		for(var i = 0;i<12;i++){
			cellEdit.click();
			driver.findElement(By.xpath("//div[contains(@class,'edit-cell') and not (text())]/input")).sendKeys(demand);
		}
	}
	  
}