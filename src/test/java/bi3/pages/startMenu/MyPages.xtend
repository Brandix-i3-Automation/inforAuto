package bi3.pages.startmenu

import bi3.pages.BasePage
import org.openqa.selenium.WebDriver
import org.openqa.selenium.support.FindBy
import org.openqa.selenium.WebElement
import org.testng.Assert
import org.openqa.selenium.By

class MyPages extends BasePage{
	
	new(WebDriver driver) {
		super(driver)
	}
	
	@FindBy(xpath="//div[text()='AC Test Page']/following::div[4]/descendant::button")
	WebElement btnSettings;
	
	@FindBy(css="input#gvPageType+label div div+div")
	WebElement btnShareThisPage;
	
	@FindBy(css="#gvPageSettingsDialog +.dialogButtonBar #okButton")
	WebElement btnOk;
	
	//@FindBy(css="input#gvPageType+label .inforSwitchInner")
	@FindBy(xpath="//div[@class='inforSwitchInner']/following::label[text()='Share this page']")
	WebElement btnShareThisPageColor;
	
	////div[@class='inforSwitchInner']/following::label[text()='Share this page']
	
	
	/**
	 * Go to page settings.
	 */
	def void clickPageSettings(){
		waitForLoadingComplete();
		waitToBeClickable(btnSettings);
		btnSettings.click();
		waitForLoadingComplete();		
	}
	
	/**
	 * Select share this page.
	 */
	def void toggleShareButton(){
		waitToBeDisplayed(btnShareThisPage);
		btnShareThisPage.click();
		Thread.sleep(3000);
	}	
	
	def String getTogglecolor(){
		var togglecolor = btnShareThisPageColor.getCssValue("background-color");
			return togglecolor.toString();
	}
	
	def void savePageSettings(){
		waitToBeClickable(btnOk);
		btnOk.click(); 
	}
	
	
		
}