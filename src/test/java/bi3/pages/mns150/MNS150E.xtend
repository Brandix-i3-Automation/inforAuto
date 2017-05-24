package bi3.pages.mns150

import bi3.pages.BasePage
import org.openqa.selenium.WebDriver
import org.openqa.selenium.support.FindBy
import org.openqa.selenium.WebElement
import bi3.framework.elements.inforelements.InforGrid
import org.testng.Assert
import java.util.List

class MNS150E extends BasePage {
	
	new(WebDriver driver) {
		super(driver)
	}
	
	@FindBy(id="WWTX40")
	WebElement txtName;
	
	@FindBy(css="#WWLANCContainer button")
	WebElement btnSystemLanguageArrow;
	
	@FindBy(css="div[id*='BROWSE_LIST'][class*='inforDataGrid']")
 	WebElement inforGridM3Browse;
	
	@FindBy(id="BTN_L52T24")
	WebElement btnSelectM3Browse;
	
	@FindBy(id="WWLANC")
	WebElement txtSystemLanguage;
	
	@FindBy(css="div.inforDialogTitleBar> div.caption")
 	List<WebElement> lblM3Browsetitle;
 	
 	@FindBy(css="div.inforDialog.ui-draggable")
 	WebElement panelM3Browse;
 	
	
	
	
	/**
	 * This method will give the name of the text box
	 * @return name of the user 
	 **/
	def String getNameOfTextBox(){		
		waitForLoadingComplete();
		return txtName.GetTextBoxvalue();
				
	}
	
	/**
	 * This method will click the arrow of the 
	 * System Language
	 **/
	def void clickTheArrowSysLanguage(){
		btnSystemLanguageArrow.click();
		waitForLoadingComplete();
	}
	
	/**
	 * This method will search and select the 
	 * System Language and check dislpaying of M3 Browse window
	 * @param lang will be the language to be entered to the search field
	 **/
	def void searchAndSelectSystemLanguage(String lang){
		waitForLoadingComplete();
		clickTheArrowSysLanguage();
		waitForLoadingComplete();
		
		//verify displaying of M3 Browse window
		Assert.assertEquals(getM3BrowseTitle(),"M3 Browse");
		var InforGrid inforGrid = new InforGrid(inforGridM3Browse);
		inforGrid.setValueToColumnSearchField("Sys",lang);
		inforGrid.getRowContainingTextInColumn(1,lang).click();
		
		//verify language
		Assert.assertEquals(inforGrid.getDataOfRow(0).get(0),lang);
		btnSelectM3Browse.waitToBeClickable();
		btnSelectM3Browse.click();
		waitForLoadingComplete();
		
	}
	
	/**
	 * This method will return the selected 
	 * System Language in the textbox
	 * @return selected lang will be returned
	 **/
	 def String getLanguageOfTextBox(){		
		waitForLoadingComplete();
		return txtSystemLanguage.GetTextBoxvalue();
				
	}
	
	/**
	 * This method will return the M3 Browse title
	 * @return M3 Browse dialog title
	 **/
	 def String getM3BrowseTitle(){	
	 	
		waitForLoadingComplete();
		lblM3Browsetitle.last().waitToBeDisplayed();
		return lblM3Browsetitle.last().text;
				
	}
	
	/**
	 * This method will return the M3 Browse title
	 * @return M3 Browse dialog title
	 **/
	 def boolean isM3BrowseClosed(){	
	 	try {
			if(panelM3Browse.displayed){
				return true;
			}
			
	 		
	 	} catch (Exception exception) {
	 		return false;
	 		
	 	}
		
				
	}
}