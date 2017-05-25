package bi3.pages.startMenu

import org.openqa.selenium.support.FindBy
import org.openqa.selenium.WebElement
import bi3.pages.BasePage
import org.openqa.selenium.WebDriver
import org.openqa.selenium.By

/* Author : Mathuja Ketheeswaran */

class AddPage extends BasePage{	
   	
	new(WebDriver driver) {
		super(driver)
	}
    
    @FindBy(xpath="//input[@id='gvAddDashoboardTitle']")
    WebElement txtNewPageTitle;
    
    @FindBy(xpath="//button[@id='okButton']")
    WebElement btnOkay;
    
    @FindBy(xpath="//div[@class='inforIcon addNew']//following-sibling::div")
    WebElement labelAddPage;
    
    @FindBy(xpath="//div[@class='gvContainer']")
    WebElement divBlackPage;
    
    @FindBy(xpath="//*[contains(text(),'Add Page...')]")
	WebElement btnAddPage;
    
     
	def void enterNewPageTitle(String newTitleValue){
		waitForLoadingComplete();
		txtNewPageTitle.click();
		txtNewPageTitle.clearRobustly();
		txtNewPageTitle.sendKeys(newTitleValue);
	
	}
	
	def void clickOkay(){
		waitForLoadingComplete();
		btnOkay.click();
		waitForLoadingComplete();
	
	}
	
	def String pagePopUp(){
		waitToBeDisplayed(labelAddPage)
		return labelAddPage.text;
	
	}
	
	def boolean addPage(){
		waitToBeDisplayed(divBlackPage)
		return divBlackPage.isDisplayed();
	
	}
	
	def WebElement findCreatedPage(String pageName){
		Thread.sleep(5000);
	 	var element = "//ul[@id='gvMenuSettings']//a[text()='"+pageName+"']"
	 	driver.findElement(By.xpath(element))
	 	
	 }
	 
	 /**
	 * Adding new pages
	 */
	def addNewPages() {
		waitForLoadingComplete();
		btnAddPage.click
		waitForLoadingComplete();

	}
	 
	
	 
}
