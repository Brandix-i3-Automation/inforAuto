package bi3.pages.crs020

import bi3.pages.BasePage
import org.openqa.selenium.WebDriver
import org.openqa.selenium.support.FindBy
import org.openqa.selenium.WebElement

class CRS020P extends BasePage{
	
	new(WebDriver driver) {
		super(driver)
	}
	@FindBy(css="#WWDSEQ+div")
	WebElement btnArrow;
	
	@FindBy(css="div[id*='lawsonPanelSequenceHelperPanel']")
	WebElement pnlSequence;
	
	@FindBy(css="li[class='inforLabel noColon choices selected']")
	WebElement listSequenceE;
	
	@FindBy(id="addButton")
	WebElement btnAdd;
	
	@FindBy(id="WWDSEQ")
	WebElement txtPanelSequence;
	
	/**
	 * Select the panel sequence as E
	 */
	 def void setPanelSequenceE()
	 {
	 	waitForLoadingComplete();
	 	txtPanelSequence.clearRobustly();
	 	btnArrow.click();
	 	waitToBeDisplayed(pnlSequence);
	 	listSequenceE.click();
	 	btnAdd.click();
	 }
	
}