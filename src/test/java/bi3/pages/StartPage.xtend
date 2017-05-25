package bi3.pages

import org.openqa.selenium.WebDriver
import org.openqa.selenium.WebElement
import org.openqa.selenium.support.FindBy
import java.util.List
import org.openqa.selenium.By

class StartPage extends BasePage {
	
	// Elements
	@FindBy(id="startDiv")
	WebElement btnStart;
	
	@FindBy(css="ul[id='gvMenuSettings'] li a")
    List<WebElement> listStartMenuItems;
    
    @FindBy(xpath="//*[contains(text(),'Add Page...')]")
	WebElement listItemAddPage;
	
	@FindBy(xpath="//*[contains(text(),'Delete Page...')]")
	WebElement listItemDeletePage;
	
	@FindBy(css="input[id='gvAddDashoboardTitle']")
    WebElement txtAddPageTitle;
	
	@FindBy(id="okButton")
	WebElement btnOKDialogBox;
	
	@FindBy(xpath="//div[@class='inforMenu']/ul[@id='gvMenuSettings']")
	WebElement menuStart;
	
	@FindBy(xpath="//div[@class='dialogButtonBar']/button[contains(text(),'OK')]")
	WebElement btnDeleteConfirm;
	
	// Constructor
	new(WebDriver driver) { 
		super(driver)
	}
	
	/**
	 * Checks whether a page with the given name already exists
	 * @return true if found and false if not
	 */
	def boolean checkPageExists(String pageName){
		var boolean found = false;
		
		for (var int i = 0; i < listStartMenuItems.length; i++) {
			var String listItemName = listStartMenuItems.get(i).getText();
			if(listItemName.equals(pageName)){
				found = true;
			}
		}
		
		return found;
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
		listItemDeletePage.waitToBeClickable();
		listItemDeletePage.click();
		btnDeleteConfirm.waitToBeClickable();
		btnDeleteConfirm.click();
	}
}