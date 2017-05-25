package bi3.pages.startMenu

import bi3.pages.BasePage
import org.openqa.selenium.WebDriver
import org.openqa.selenium.support.FindBy
import org.openqa.selenium.WebElement
import java.util.List
import sun.swing.icon.SortArrowIcon

class PageSettings extends BasePage {
	
	new(WebDriver driver) {
		super(driver)
	}
	
	@FindBy(css="input#gvPageType+label div div+div")
	WebElement btnShareThisPage;
	
	@FindBy(css="#gvPageSettingsDialog +.dialogButtonBar #okButton")
	WebElement btnOk;
	
	@FindBy(xpath="//div[@class='inforSwitchInner']/following::label[text()='Share this page']")
	WebElement btnShareThisPageColor;
	
	@FindBy(css="div.inforDialog.ui-draggable")
    List<WebElement> panelPageSettings;
	
	
	/**
	 * Select share this page.
	 */
	def void toggleShareButton(){
		waitToBeDisplayed(btnShareThisPage);
		btnShareThisPage.click();
		Thread.sleep(3000);
	}	
	
	/**
	 * This method returns the background color of the toggle.
	 */
	def String getTogglecolor(){
		var togglecolor = btnShareThisPageColor.getCssValue("background-color");
			return togglecolor.toString();
	}
	
	/**
	 * This method saves page settings.
	 */
	def void savePageSettings(){
		waitToBeClickable(btnOk);
		btnOk.click();
		waitForLoadingComplete(); 
	}
	
	/**
      * This method returns availability of Share button.
      **/
      def boolean isSettingsPageClosed(){ 
      	waitForLoadingComplete();   
           try {
                  if(btnShareThisPage.displayed){
                        return true;
                  }
            } catch (Exception exception) {
                 return false; 
            }               
      }
      
}