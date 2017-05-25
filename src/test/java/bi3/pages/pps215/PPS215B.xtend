package bi3.pages.pps215

import bi3.pages.BasePage
import org.openqa.selenium.WebDriver
import org.openqa.selenium.support.FindBy
import org.openqa.selenium.WebElement

class PPS215B extends BasePage {
	
	new(WebDriver driver) {
		super(driver)
	}

	@FindBy(xpath="//button[@id='ActionsBtn']") 
 	WebElement btnAction;
 	
 	@FindBy(xpath="//span[@id='menuBar']/descendant::button[4]/following-sibling::div[1]//ul//span[text()='F3']/ancestor::a") 
 	WebElement linkClose;
 	
 	def void closePanal(){
 		btnAction.click();
 		waitForLoadingComplete();
 		linkClose.click();
 		waitForLoadingComplete();
 	}
 	
 	
}