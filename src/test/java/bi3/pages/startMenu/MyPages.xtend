package bi3.pages.startMenu

import bi3.pages.BasePage
import org.openqa.selenium.WebDriver
import org.openqa.selenium.support.FindBy
import org.openqa.selenium.WebElement
import org.openqa.selenium.By

class MyPages extends BasePage {

	new(WebDriver driver) {
		super(driver)
	}
	
	@FindBy(css="div.inforDialog.ui-draggable")
    WebElement panelMyPage;
    
    @FindBy(id="okButton")
    WebElement btnOk;
    
     @FindBy(xpath=" //*[contains(text(),'My Pages...')]")
    WebElement btnMyPage;
    
   
	
	def WebElement lblChangedDate(String pageTitle){
		var String lblChangedDateXpath = "//div[text()='"+pageTitle+"']/../div[contains(@class, 'gvMyPagesChangedCell')]";
		return driver.findElement(By.xpath(lblChangedDateXpath));
	}

	def WebElement iconShare(String pageTitle) {
		var String iconShareXpath = "//div[text()='"+pageTitle+"']/following::div[1]/descendant::div[1]";
		return driver.findElement(By.xpath(iconShareXpath));
	}
	
	def WebElement btnSettings(String pageTitle) {
		var String btnSettingsXpath = "//div[text()='"+pageTitle+"']/..//button[contains(@class, 'inforIconButton settings')]";
		return driver.findElement(By.xpath(btnSettingsXpath));
	}
	
	def WebElement btnDelete(String pageTitle){
		var String btnDeleteXpath = "//div[text()='"+pageTitle+"']/..//button[contains(@class, 'inforIconButton delete')]";
		return driver.findElement(By.xpath(btnDeleteXpath));
	}
	
	
	def clickMyPage(){
		
		waitForLoadingComplete();
		btnMyPage.click
		waitForLoadingComplete();
	}
	
	def WebElement lblTitle(String pageTitle){
		var String lblTitleXpath = "//div[text()='"+pageTitle+"']";
		return driver.findElement(By.xpath(lblTitleXpath));
	}
	
	def WebElement lblOwner(String pageTitle){
		var String lblOwnerXpath = "//div[text()='"+pageTitle+"']/../div[contains(@class, 'gvMyPagesOwnerCell')]";
		return driver.findElement(By.xpath(lblOwnerXpath));
	}
	
	def WebElement btnRemoveFavorite(String pageTitle) {
		var String btnRemoveFavoriteXpath = "//div[text()='"+pageTitle+"']/..//button[contains(@class, 'gvRemoveFavoriteIcon')]";
		return driver.findElement(By.xpath(btnRemoveFavoriteXpath));
	}
	
	
	/**
	 * Go to page settings.
	 */
	def void clickPageSettings(String pageTitle) {
		waitForLoadingComplete();
		var WebElement btnSett = btnSettings(pageTitle);
		waitToBeClickable(btnSett);
		btnSett.click();
		waitForLoadingComplete();
	}
	
	/**
	 * This method returns the of Share icon.
	 * @return Share icon
	 * 
	 */
	def boolean isShareIconAvailable(String pageTitle) {
		var WebElement iconShare = iconShare(pageTitle);
		waitForLoadingComplete();
		try {
			if (iconShare.displayed) {
				return true;
			}
		} catch (Exception exception) {
			return false;
		}
	}
	
	/**
	 * This method returns the changed date.
	 * @return Changed date
	 */
	def String getChangedDate(String pageTitle){
		waitForLoadingComplete();
		var WebElement lblDate = lblChangedDate(pageTitle);
		var String date = lblDate.text;
		return date;
	}
	
	/**
      * This method returns the page title.
      * @return "My Page" page title.
      **/
      def boolean isMyPageClosed(){    
           try {
                  if(panelMyPage.displayed){
                        return true;
                  }  
            } catch (Exception exception) {
                 return false; 
            }           
      }
      
      /**
	 * Go to delete confirmation.
	 */
	def void clickDeleteIcon(String pageTitle) {
		waitForLoadingComplete();
		var WebElement btnDel = btnDelete(pageTitle);
		waitToBeClickable(btnDel);
		btnDel.click();
		waitForLoadingComplete();
	}
	
	/**
	 * Closing My Pages panel.
	 */
	 def void closeMyPages(){
	 	waitToBeClickable(btnOk);
	 	btnOk.click();
	 	waitForLoadingComplete();
	 }
	 
	 /**
	 * This method returns the page title.
	 * @return Share icon
	 * 
	 */
	def boolean isPageTitleAvailable(String pageTitle) {
		var WebElement lblTitle = lblTitle(pageTitle);
		waitForLoadingComplete();
		try {
			if (lblTitle.displayed) {
				return true;
			}
		} catch (Exception exception) {
			return false;
		}
	}
	
	/**
	 * This method returns the Owner.
	 * @return Owner
	 */
	def String getOwner(String pageTitle){
		var WebElement lblOwner = lblOwner(pageTitle);
		var String owner = lblOwner.text;
		return owner;
	}
	
	/**
	 * This method returns the Settings icon.
	 * @return Settings icon
	 * 
	 */
	def boolean isSettingsIconAvailable(String pageTitle) {
		var WebElement btnSettings = btnSettings(pageTitle);
		waitForLoadingComplete();
		try {
			if (btnSettings.displayed) {
				return true;
			}
		} catch (Exception exception) {
			return false;
		}
	}
	
	/**
	 * This method returns the remove favorite button.
	 * @return Remove favorite button
	 * 
	 */
	def boolean isRemoveFavBtnAvailable(String pageTitle) {
		var WebElement btnRemoveFavorite = btnRemoveFavorite(pageTitle);
		waitForLoadingComplete();
		try {
			if (btnRemoveFavorite.displayed) {
				return true;
			}
		} catch (Exception exception) {
			return false;
		}
	}
	
	/**
	 * This method returns the delete icon.
	 * @return Delete icon
	 * 
	 */
	def boolean isDeleteIconAvailable(String pageTitle) {
		var WebElement btnDelete= btnDelete(pageTitle);
		waitForLoadingComplete();
		try {
			if (btnDelete.displayed) {
				return true;
			}
		} catch (Exception exception) {
			return false;
		}
	}
	
	

}
