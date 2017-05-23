package bi3.pages.mns150

import bi3.pages.BasePage
import org.openqa.selenium.WebDriver
import org.openqa.selenium.support.FindBy
import org.openqa.selenium.WebElement
import java.util.List
import bi3.framework.elements.inforelements.InforGrid
import org.openqa.selenium.Keys

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
 	
 	@FindBy(css="div.inforMenu ul[id*='menu'][class='inforContextMenu inforMenuOptions']>li ")
 	List<WebElement> listOptions;
 	
 	
	
	/**
	 * This method will search for the User
	 * in the User Search Field
	 * @param user will be entered to the Search field
	 **/
	 def void searchUser(String user){
	 	//txtUser.EnterText(user);
	 	var InforGrid inforGrid = new InforGrid(inforGrid);
	 	inforGrid.setValueToColumnSearchField("User",user);
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
	 def List<String> getOptionsList(){
//	 	var options=new ArrayList<String>();
//	 	options.add(listOptions.getTextList().get(0));
		waitForLoadingComplete();
	 	return listOptions.getTextList();
	 }	
	 
	 /**
	 * This method will return the User
	 * of the first row
	 * @return username 
	 **/
	 def String getFirstRowUsername(){
	 	waitForLoadingComplete();
	 	var InforGrid inforGrid = new InforGrid(inforGrid);
		 return inforGrid.getDataOfRow(0).get(0);
		
	 }
	
}