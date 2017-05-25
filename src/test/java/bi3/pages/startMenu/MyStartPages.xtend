package bi3.pages.startMenu

import org.openqa.selenium.WebDriver
import bi3.pages.BasePage
import org.openqa.selenium.WebElement
import org.openqa.selenium.interactions.Actions
import org.openqa.selenium.interactions.Action
import org.openqa.selenium.By
import org.openqa.selenium.support.FindBy

class MyStartPages extends BasePage {
	
		new(WebDriver driver) {
		super(driver)
	} 
	
	@FindBy(xpath="//button[@id='okButton']")
    WebElement btnOkay;
	
	/**
	 * Move Pages up.
	 */
	def movingUpNewCreatedPage(String createdPageName, int pagePositionId) {
		waitForLoadingComplete();
		var WebElement fromElement = driver.findElement(By.xpath(" //*[@id='gvStartPageDialog']//div[text()='" + createdPageName + "']"));
		var WebElement toElement = driver.findElement(By.xpath("//*[@id='gvStartPageDialog']//ul/div[" + pagePositionId + " ]"));
		var Actions builder = new Actions(driver);
		waitForLoadingComplete();
		var Action dragAndDrop = builder.clickAndHold(fromElement).moveToElement(toElement).release(toElement).build();
		dragAndDrop.perform()
		waitForLoadingComplete();
		
	}
	
	/**
	 * Move Pages down.
	 */
	def movingDownNewCreatedPage(String createdPageName, int pagePositionId) {
		waitForLoadingComplete();
		var WebElement fromElement = driver.findElement(By.xpath(" //*[@id='gvStartPageDialog']//div[text()='" + createdPageName + "']"));
		var WebElement toElement = driver.findElement(By.xpath("//*[@id='gvStartPageDialog']//ul/div[" + pagePositionId + " ]"));
		var Actions builder = new Actions(driver);
		waitForLoadingComplete();
		var Action dragAndDrop = builder.clickAndHold(toElement).moveToElement(fromElement).release(fromElement).build();
		dragAndDrop.perform()
		waitForLoadingComplete();
	}
	
	/**
	 * Get New Page Name from My Page Pop Up to verify the page name
	 */
	def getNewPageLblValue(String newPagename) {
		waitForLoadingComplete();
		var WebElement lblCreatedPageName = driver.findElement(
			By.xpath("//li[@class='gvMyPagesRow gvVerticalCenterContainer']/descendant::div[text()='" + newPagename +"']"));

		return lblCreatedPageName.text;

	}
	
	def void clickOkay(){
		waitForLoadingComplete();
		btnOkay.click();
		waitForLoadingComplete();
	
	}
	
}