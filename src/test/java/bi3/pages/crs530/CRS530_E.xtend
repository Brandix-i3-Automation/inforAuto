package bi3.pages.crs530

import bi3.pages.BasePage
import org.openqa.selenium.WebDriver
import org.openqa.selenium.support.FindBy
import org.openqa.selenium.WebElement

class CRS530_E extends BasePage{
	
	new(WebDriver driver) {
		super(driver)
	}
	
	@FindBy(id="WEEMNM")
	WebElement txtFullName;
	
	@FindBy(id="WEWOSC")
	WebElement txtWorkSch;
	
	@FindBy(id="WEWODT")
	WebElement txtSchFrDt;
	
	
	
	@FindBy(xpath="//button[@class='inforTriggerButton inforBrowseIcon']/descendant::span[text()='Open']")
	WebElement txtUser;
	
	@FindBy(id="WEUSID")
	WebElement txtUserName;
	
	@FindBy(xpath="//div[@class='ui-widget-content slick-row  even   lastClicked selected']")
	WebElement gridName;
	
	@FindBy(xpath="//div[@id='WEWODTContainer']/descendant::span[text()='Open']")
	WebElement linkScheduleFrDt;
	
	@FindBy(xpath="//button[@class='inforDatePickerTodayButton inforFormButton ']")
	WebElement btnToday;
	
	/**
	 * Enter Full Name
	 */
	def void enterFullName(String fullName){
		
		waitForLoadingComplete();
		waitToBeClickable(txtFullName);
		txtFullName.click();
		txtFullName.clearRobustly();
		txtFullName.sendKeys(fullName);
		waitForLoadingComplete();
		
		
	}
	
	/**
	 * Enter User 
	 */
	def void enterUser(String user){
		
		waitForLoadingComplete();
		waitToBeClickable(txtUserName);
		txtUserName.click();
		txtUserName.clearRobustly();
		txtUserName.sendKeys(user);
		waitForLoadingComplete();
		
		
	}
	
	/**
	 * Enter Work Schedule 
	 */
	def void enterWorkSch(int no){
		
		waitForLoadingComplete();
		waitToBeClickable(txtWorkSch);
		txtWorkSch.click();
		txtWorkSch.clearRobustly();
		txtWorkSch.sendKeys(no.toString);
		waitForLoadingComplete();
		
		
	}
	
	/**
	 * Enter Schedule Fr Dt
	 */
	def void selectScheduleFrDt(){
		
		waitForLoadingComplete();
		linkScheduleFrDt.clearRobustly();
		linkScheduleFrDt.click;
		waitForLoadingComplete();
		btnToday.click();
		waitForLoadingComplete();
		
		
	}
	
	def void ClickNext() {
        waitForLoadingComplete()
		btnNext.click()
		waitForLoadingComplete()
	}
}




















