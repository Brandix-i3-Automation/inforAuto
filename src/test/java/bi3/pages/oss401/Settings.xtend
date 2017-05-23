package bi3.pages.oss401

import org.openqa.selenium.WebDriver
import org.openqa.selenium.support.FindBy
import bi3.pages.BasePage
import org.openqa.selenium.WebElement

class Settings extends BasePage{
	
	new(WebDriver driver) {
		super(driver)
	}
	
	@FindBy(id="Next")
	WebElement btnNext;
	
	@FindBy(id="WWDSEQ")
	WebElement txtPanelSequence;
	
	def void clickNext(){
		btnNext.waitToBeClickable();
		btnNext.click()
		waitForLoadingComplete()
	}
	
	def void enterPanelSequence(String panelSequence){
		waitForLoadingComplete();
		waitToBeClickable(txtPanelSequence);
		txtPanelSequence.click();
		txtPanelSequence.clearRobustly();
		txtPanelSequence.sendKeys(panelSequence);
	}
	
}