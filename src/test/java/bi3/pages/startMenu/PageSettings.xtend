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
	
	@FindBy(xpath = "//div[@class='inforSwitchInner']/following::label[text()='Share this page']")
	WebElement btnShareThisPageColor;
	
	@FindBy(css = "div.inforDialog.ui-draggable")
    List<WebElement> panelPageSettings;
    
    @FindBy(css = "div#gvPageSettingsDialog div label[for='gvPageTitle']")
    WebElement lblName;
    
    @FindBy(css="div#gvPageSettingsDialog div label[for='gvPageDescription']")
    WebElement lblDescription;
    
    @FindBy(css = "div#gvPageSettingsDialog div label[for='gvPageOwner']")
    WebElement lblOwner;
    
    @FindBy(css = "div#gvPageSettingsDialog div label[for='gvChangedBy']")
    WebElement lblChangedBy;
    
    @FindBy(css = "//label[text()='Changed']")
    WebElement lblChanged;
	
	@FindBy(css = "div#gvPageSettingsDialog div label[for='gvPageEditLevel']")
    WebElement lblEditors;
    
    @FindBy(css = "//label[text()='Share this page']")
    WebElement lblSharePage;
    
    @FindBy(css = "//label[text()='Lock this page']")
    WebElement lblLockPage;
    
	
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
      
      /**
	 * This method returns the Name label value.
	 * @return Name label value
	 */
	def String getNameLabelValue(){
		var String name = lblName.text;
		return name;
	}
	
	/**
	 * This method returns the Description label value.
	 * @return Description label value
	 */
	def String getDescriptionLabelValue(){
		var String description = lblDescription.text;
		return description;
	}
	
	/**
	 * This method returns the Owner label value.
	 * @return Owner label value
	 */
	def String getOwnerLabelValue(){
		var String owner = lblOwner.text;
		return owner;
	}
	
	/**
	 * This method returns the Changed by user label value.
	 * @return Changed by user label value
	 */
	def String getChangedByUserLabelValue(){
		var String changedby = lblChangedBy.text;
		return changedby;
	}
	
	/**
	 * This method returns the Changed time label value.
	 * @return Changed time label value
	 */
	def String getChangedTimeLabelValue(){
		var String changedtime = lblChanged.text;
		return changedtime;
	}
	
	/**
	 * This method returns the Editor label value.
	 * @return Editor label value
	 */
	def String getEditorLabelValue(){
		var String editor = lblEditors.text;
		return editor;
	}
	
	/**
	 * This method returns the page share label value.
	 * @return Page share label value
	 */
	def String getSharePageLabelValue(){
		var String sharepage = lblSharePage.text;
		return sharepage;
	}
	
	/**
	 * This method returns the page Lock label value.
	 * @return Page lock label value
	 */
	def String getLockPageLabelValue(){
		var String lockpage = lblLockPage.text;
		return lockpage;
	}
}