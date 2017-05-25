package bi3.pages.ois301

import bi3.pages.BasePage
import org.openqa.selenium.WebDriver
import org.openqa.selenium.support.FindBy
import org.openqa.selenium.WebElement
import org.openqa.selenium.Keys
import org.openqa.selenium.By

/* Author : Mathuja Ketheeswaran */

class OIS301CustomerOrder extends BasePage {
	
	new(WebDriver driver) {
		super(driver)
	}
	
	@FindBy(xpath="//input[@id='WWQTTP-shdo']")
    WebElement dropDownSort;
    
    @FindBy(xpath="//li[@id='list-option3']")
    WebElement listOrderOption;
    
    @FindBy(xpath="//input[@id='W1OBKV']")
    WebElement txtOrderNo
    
    @FindBy(xpath="//div[@class='grid-canvas grid-canvas-top grid-canvas-left']/div[1]/div[1]")
    WebElement gridFirstRow
    
    @FindBy(xpath="//a[text()='Related']")
    WebElement linkRelated
    
    @FindBy(xpath="//ul[@class='inforMenuOptions submenu']//li[3]//a")
    WebElement linkAttrValues
    
    @FindBy(xpath="//li[@id='list-option1']")
    WebElement listOrderOptions
    
    @FindBy(xpath="//div[text()='Test Attribute 01']/ancestor::div[1]//div[4]/div")
    WebElement txtAttribute
    
    @FindBy(xpath="//button[@id='ActionsBtn']") 
 	WebElement btnAction;
 	
 	@FindBy(xpath="//span[@id='menuBar']/descendant::button[4]/following-sibling::div[1]//ul//span[text()='F3']/ancestor::a") 
 	WebElement linkClose;
 	
 	@FindBy(xpath="//button[@class='inforIconButton edit']") 
 	WebElement btnEdit;
 	
 	@FindBy(xpath="//input[@id='WWATAV']")
    WebElement txtAttributeinChange
    
    @FindBy(xpath="//button[@id='Next']")
    WebElement btnNext

    
    def void clickDropDownSort(){
    	waitForLoadingComplete();
    	dropDownSort.click();
    	waitForLoadingComplete();
    	listOrderOption.click();
    	waitForLoadingComplete();
    }
   	
   	def void enterOrderNumber(String orderNo){
   		waitForLoadingComplete();
		txtOrderNo.click();
		txtOrderNo.clearRobustly()
		txtOrderNo.sendKeys(orderNo);
		txtOrderNo.sendKeys(Keys.ENTER);
		waitForLoadingComplete();
   	}
   	
   	def String validateOrderNumber(){
   		waitForLoadingComplete();
		return gridFirstRow.text;
   	}
    
    def void selectAttrValues(){
   		waitForLoadingComplete();
		rightClick(gridFirstRow)
		linkRelated.click();
		linkAttrValues.click();
		waitForLoadingComplete();
   	}
    
    def void sortOrder(){
   		waitForLoadingComplete();
    	dropDownSort.click();
    	waitForLoadingComplete();
    	listOrderOptions.click();
    	waitForLoadingComplete();
   	}
   	
   	def void enterAttributeNo(String attributeValue){
   		waitForLoadingComplete();
		txtAttribute.click();
		btnEdit.click();
		txtAttributeinChange.click();
		txtAttributeinChange.clearRobustly();
		txtAttributeinChange.sendKeys(attributeValue);
		btnNext.click();
		waitForLoadingComplete();
   	}
   	
   	def WebElement findDescription(String description){
	 	var element = "//div[text()='Test Attribute 01']/ancestor::div[1]//div[5][text()='"+description+"']"
	 	driver.findElement(By.xpath(element))
	 }
	 
	def WebElement validatePanal(String panalName){
	 	var element = "//span[text()='"+panalName+" ']"
	 	driver.findElement(By.xpath(element))
	 }
	
 	def void closePanal(){
 		btnAction.click();
 		waitForLoadingComplete();
 		linkClose.click();
 		waitForLoadingComplete();
 	}
}