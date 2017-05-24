package bi3.pages.crs530

import bi3.pages.BasePage
import org.openqa.selenium.WebDriver
import org.openqa.selenium.support.FindBy
import org.openqa.selenium.WebElement

class CRS530_P extends BasePage{
	
	new(WebDriver driver) {
		super(driver)
	}
	
	@FindBy(id="WWDSEQ")
	WebElement txtPanelSequence;
	
	@FindBy(xpath="//input[@id='WWDSEQ']/following::div[@class='lawsonPanelSequenceHelperTrigger']") 
	WebElement linkArrow;
	
	@FindBy(xpath="//li[@name='E']/descendant::span[text()='E - Basic Information']") 
	WebElement gridPanelSequence;
	
	@FindBy(xpath="//button[@id='addButton']") 
	WebElement btnAdd;
	
	@FindBy(id="Next") 
	WebElement btnNext;
	
}