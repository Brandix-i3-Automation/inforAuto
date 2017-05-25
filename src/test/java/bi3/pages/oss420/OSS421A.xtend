package bi3.pages.oss420

import bi3.pages.BasePage
import org.openqa.selenium.WebDriver
import org.openqa.selenium.support.FindBy
import org.openqa.selenium.WebElement
import org.openqa.selenium.By

class OSS421A extends BasePage{
	
	new(WebDriver driver) {
		super(driver)
	}
	
	@FindBy(xpath="//div[contains(@class,'edit-cell') and not (text())]")
	WebElement cellEdit
	
	/**
	 * Enter values OSS421/A
	 */
	def fillSaleValues(String warehouse, String itemNo){
		cellEdit.click();
		driver.findElement(By.xpath("//input[@id='R1C4']")).sendKeys(warehouse);
		cellEdit.click();
		driver.findElement(By.xpath("//input[@id='R2C4']")).sendKeys(itemNo);
		clickOnNext();
		waitForLoadingComplete();
	}
}