package bi3.pages.startMenu

import bi3.pages.BasePage
import org.openqa.selenium.WebDriver
import org.openqa.selenium.support.FindBy
import org.openqa.selenium.WebElement
import org.openqa.selenium.By

/* Author : Mathuja Ketheeswaran */

class DeletePage extends BasePage{
	
	new(WebDriver driver) {
		super(driver)
	}

	@FindBy(xpath="//ul[@id='gvMenuSettings']/li[8]/a")
    WebElement listDeletPage;
    
    @FindBy(xpath="//div[@class='inforIcon help']//following-sibling::div")
    WebElement labelDeleteConfirmationPopup;
    
    @FindBy(xpath="//div[@class='dialogButtonBar']//button[@class='inforFormButton default']")
    WebElement btnDeleteConfirmation;
    
    @FindBy(xpath="//div[@class='gvPage']")
    WebElement divHomePage;
    
    
     def void deletePage(){
		waitForLoadingComplete();
		listDeletPage.click();
		waitForLoadingComplete();
	
	}
	
	def String pagePopUp(){
		waitToBeDisplayed(labelDeleteConfirmationPopup)
		return labelDeleteConfirmationPopup.text;
	
	}
	
	def void clickOkayConfirmation(){
		waitForLoadingComplete();
		btnDeleteConfirmation.click();
		waitForLoadingComplete();
	}
	
	def boolean navigateToHomePage(){
		waitToBeDisplayed(divHomePage)
		return divHomePage.isDisplayed();
	
	}
	
	def WebElement findCreatedPage(String pageName){
		Thread.sleep(5000);
	 	var element = "//ul[@id='gvMenuSettings']//a[text()='"+pageName+"']"
	 	driver.findElement(By.xpath(element))

	 }
	
	
}
