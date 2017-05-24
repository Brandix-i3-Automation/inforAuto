package bi3.pages

import org.openqa.selenium.WebDriver
import org.openqa.selenium.WebElement
import org.openqa.selenium.support.FindBy
import java.util.List
import org.openqa.selenium.By

class StartPage extends BasePage {
	
	// Elements
	@FindBy(xpath="//ul[@id='gvMenuSettings']/li[2]/a")
	WebElement listItemNewPage;
	
	@FindBy(id="startDiv")
	WebElement btnStart;
	
	@FindBy(xpath="//ul[@id='gvMenuSettings']/li[8]/a[@href='#deletepage']")
	WebElement btnDeletePage;
	
	@FindBy(css="ul[id='gvMenuSettings'] li a")
    List<WebElement> listStartMenuItems;
    
    @FindBy(xpath="//*[contains(text(),'Add Page...')]")
	WebElement listItemAddPage;
	
	@FindBy(css="input[id='gvAddDashoboardTitle']")
    WebElement txtAddPageTitle;
	
	@FindBy(id="okButton")
	WebElement btnOKDialogBox;
	
	@FindBy(xpath="//div[@class='inforMenu']/ul[@id='gvMenuSettings']")
	WebElement menuStart;
	
	
	// Constructor
	new(WebDriver driver) { 
		super(driver)
	}
	
	/**
	 * Checks if a page other than the start page exists
	 */
	def boolean checkNewPageExists(){
		var ret = false;
		
		try{
		if(listItemNewPage.isEnabled())
			ret = true;
		}
		catch(Exception e){
			print("not exist");
		}
		
		return ret;
	}
	
	/**
	 * Returns the start page name
	 * @return start page name
	 */
	def String getStartPageText(){
		waitForLoadingComplete();
		return btnStart.getText();
	}
	
	/**
	 * Returns the item list in the start menu
	 * @return menu items list
	 */
	def List<String> getStartMenuItemNames(){
		var List<String> startMenuItemsText = listStartMenuItems.getTextList();
		return startMenuItemsText;
	}
	
	/**
	 * Adds a new page
	 */
	def addNewPage(String pageName){
		listItemAddPage.waitToBeClickable();
		listItemAddPage.click();
		
		// set page name
		txtAddPageTitle.waitToBeClickable();
		txtAddPageTitle.click();
		txtAddPageTitle.clearRobustly();
		txtAddPageTitle.sendKeys(pageName);
		btnOKDialogBox.waitToBeClickable();
		btnOKDialogBox.click();
	}
	 
	/**
	 * Navigates to a specific page
	 */ 
	def gotoNewPage(String pageName){
		var linkToPage = menuStart.findElement(By.xpath("//*[contains(text(),'"+pageName+"')]"));
		linkToPage.waitToBeClickable();
		linkToPage.click();
		waitForLoadingComplete();
	}
	
	/**
	 * Deletes the selected page
	 */
	def deletePage(){
		btnStart.waitToBeClickable();
		btnStart.click();
		btnDeletePage.waitToBeClickable();
		btnDeletePage.click();
	}
	
	
	
}