package bi3.pages.mns150

import bi3.pages.BasePage
import org.openqa.selenium.WebDriver
import org.openqa.selenium.support.FindBy
import org.openqa.selenium.WebElement
import java.util.List
import bi3.framework.elements.inforelements.InforGrid
import org.openqa.selenium.Keys
import org.testng.Assert
import java.util.ArrayList

class MNS150B extends BasePage {
	
	new(WebDriver driver) {
		super(driver)
	}
	
	@FindBy(id="W1USID")
	WebElement txtUser;
	
	@FindBy(xpath="//a/span[contains(text(),'Change')]")
	WebElement linkChange;
	
	@FindBy(css="div[id*='MNA150BS'][class*='inforDataGrid']")
 	WebElement inforGrid;
 	
 	@FindBy(css="div.inforMenu ul[id*='menu'][class='inforContextMenu inforMenuOptions']>li>a ")
 	List<WebElement> listOptions;
 	
 	
	
	/**
	 * This method will search for the User
	 * in the User Search Field
	 * and check whether the text is entered to the search field
	 * @param user will be entered to the Search field
	 **/
	 def void searchUser(String user){
	 	var InforGrid inforGrid = new InforGrid(inforGrid);
	 	Assert.assertEquals(inforGrid.setValueToColumnSearchField("User",user).GetTextBoxvalue(),user);
	 	txtUser.sendKeys(Keys.ENTER);
	 }
	 
	 /**
	 * This method will right click
	 * the first row of the grid
	 **/
	 def void rightClickTheFirstRow(){
	 	waitForLoadingComplete()
		var InforGrid inforGrid = new InforGrid(inforGrid);
		var matchingElement = inforGrid.getRow(0);
		println("WEbELement "+matchingElement)
		matchingElement.rightClick();	 	
	 }
	 
	 /**
	 * This method will the Change of
	 * the options list
	 **/
	 def void clickChange(){
	 	linkChange.clickWhenReady();
		waitForLoadingComplete();
	 }
	 
	 /**
	 * This method will return
	 * the option list of the right click
	 * @return listOfOptions 
	 **/
	 def List<String> getOptionsListFromPane(){
		waitForLoadingComplete();
	 	return listOptions.getTextList();
	 }	
	 
	 /**
	 * This method will return the User details
	 * of the first row
	 * @return list of user details including user,name and Sys
	 **/
	 def List<String> getFirstRowUserDetails(){
	 	waitForLoadingComplete();
	 	var InforGrid inforGrid = new InforGrid(inforGrid);
	 	var userDetails=new ArrayList<String>();
	 	userDetails.add(inforGrid.getDataOfRow(0).get(0));
	 	userDetails.add(inforGrid.getDataOfRow(0).get(1));
	 	userDetails.add(inforGrid.getDataOfRow(0).get(7));
		return userDetails;
		
	 }
	 
	 /**
	 * This method will return the 
	 * actual list of options
	 * @return actual list of options
	 **/
	 def List<String> getActualOptionsList(){
	 	var options=new ArrayList<String>();
	 	options.add("Related");
	 	options.add("Select\nCTRL+1");
	 	options.add("Change\nCTRL+2");
	 	options.add("Copy\nCTRL+3");
	 	options.add("Delete\nCTRL+4");
	 	options.add("Display\nCTRL+5");
	 	options.add("Copy to Clipboard");
	 	options.add("Add Text to Quicknote...");
	 	options.add("Restore Columns");
	 	
		return options;
		
	 }	
}