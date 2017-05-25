package bi3.pages.pps201

import bi3.pages.BasePage
import org.openqa.selenium.WebDriver
import org.openqa.selenium.support.FindBy
import org.openqa.selenium.WebElement

class PPS201E extends BasePage {
	
	new(WebDriver driver) {
		super(driver)
	}
	
	@FindBy(xpath="//input[@id='WWPNLI']")
 	WebElement txtPoLine
 	
 	@FindBy(xpath="//button[@id='ActionsBtn']") 
 	WebElement btnAction;
 	
 	@FindBy(xpath="//span[@id='menuBar']/descendant::button[4]/following-sibling::div[1]//ul//span[text()='F3']/ancestor::a") 
 	WebElement linkClose;
 	
 	def String getPOline(){
		waitForLoadingComplete();
		return txtPoLine.text
	}
	
	def void closePanal(){
 		btnAction.click();
 		waitForLoadingComplete();
 		linkClose.click();
 		waitForLoadingComplete();
 	}
}