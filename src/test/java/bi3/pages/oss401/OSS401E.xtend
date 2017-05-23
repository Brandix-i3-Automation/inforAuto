package bi3.pages.oss401

import bi3.pages.BasePage
import org.openqa.selenium.WebDriver
import org.openqa.selenium.support.FindBy
import org.openqa.selenium.WebElement
import java.util.List
import org.openqa.selenium.By

class OSS401E extends BasePage{
	
	new(WebDriver driver) {
		super(driver)
	}
	
	@FindBy(id = "WETX40")
	WebElement txtDescription
	
	@FindBy(id = "WETX15")
	WebElement txtName
	
	@FindBy(id = "WEPETP-shdo")
	WebElement btnPeriodType
	
	@FindBy(css = "#dropdown-list>li")
	List<WebElement> listOptions
	
	def void enterDescription(String desc){
		txtDescription.EnterText(desc)
	}
	
	def void enterName(String name){
		txtName.EnterText(name)
	}
	
	def void enterPeriodType(String type){
		selectFromDropdown(btnPeriodType,listOptions,type)
	}
	
	/*
	 * Enters values for specified keys
	 * @param keyNo can be any number from 1 - 5
	 * @param keyValue is the value to be entered for the required key
	 */
	def void enterValueForKey(String keyNo,String keyValue){
		var elementId = "WEKEY"+keyNo
		var WebElement txtKeyElement = driver.findElement(By.id(elementId))
		txtKeyElement.EnterText(keyValue)
	}
}