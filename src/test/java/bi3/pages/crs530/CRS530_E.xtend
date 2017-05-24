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
	
	@FindBy(xpath="//button[@class='inforTriggerButton inforBrowseIcon']/descendant::span[text()='Open']")
	WebElement txtUser;
	
	@FindBy(xpath="//button[@class='inforFilterButton contains']/following::input[@id='POS']")
	WebElement txtUserName;
	
	@FindBy(xpath="//div[@class='ui-widget-content slick-row  even   lastClicked selected']")
	WebElement gridName;
	
	@FindBy(xpath="//button[@class='inforTriggerButton inforDatePickerButton']/descendant::span[text()='Open']")
	WebElement linkScheduleFrDt;
	
	@FindBy(xpath="//button[@class='inforDatePickerTodayButton inforFormButton ']")
	WebElement btnToday;
}