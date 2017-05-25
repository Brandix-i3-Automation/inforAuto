package bi3.pages.mms001

import org.openqa.selenium.WebDriver
import org.openqa.selenium.WebElement
import org.openqa.selenium.support.FindBy
import org.openqa.selenium.Keys
import bi3.pages.BasePage
import java.util.List
import bi3.framework.elements.inforelements.InforGrid
import org.openqa.selenium.interactions.Actions
import java.awt.Robot
import java.awt.event.KeyEvent

class MMS001 extends BasePage {

	new(WebDriver driver) { // Constructor
		super(driver)
	}

	@FindBy(id="W1OBKV")
	WebElement txtItemNumber;

	@FindBy(css=".slick-cell.l0.r0")
	WebElement gridFirstLine;

	@FindBy(xpath="//a/span[contains(text(),'Copy')]")
	WebElement linkCopy;

	@FindBy(css="div.slick-cell.l0.r0>a")
	List<WebElement> listItemNumbers;	
	
	@FindBy(css="#tabsList > li.ui-tabs-selected.ui-state-active > button")
	WebElement btnClose
	
	@FindBy(xpath="//a[text()='Related']")
	WebElement linkRelated;
	
	@FindBy(xpath="//a/span[contains(text(),'Item/Warehouse')]")
	WebElement linkItemWarehouse;

	@FindBy(xpath="//a/span[contains(text(),'Item/Facility')]")
	WebElement linkItemFacility;
	
	@FindBy(css="div[id*='MMA001BS'][class*='inforDataGrid']")
	WebElement gridMMS001;
	
	@FindBy(css="button.inforIconButton.edit")
	WebElement btnEdit;
	
	@FindBy(id="CPITNO")
	WebElement txtChangeItemNumber;
	
	@FindBy(id="WOPAVR-shdo")
	WebElement btnDrpDwnView;
	
	@FindBy(css="#dropdown-list>li")
	List <WebElement> listView;
	
	@FindBy(id="WWQTTP-shdo")
	WebElement btnDrpDwnSortingOrder;
	
	@FindBy(css="ul[id='dropdown-list']>li")
	List <WebElement> listSortingOrder;
	
	@FindBy(id="ui-id-3")
	WebElement lblHeading;
	
	@FindBy(css="div[class='inforDialog ui-draggable']")
	WebElement pnlExportExcel;
	
	@FindBy(id="QuickExport_option1")
	WebElement btnRadioExportExcel;
	
	@FindBy(id="QuickExport_option3")
	WebElement btnRadioSourceFormat;
	
	@FindBy(css="div[id='ExportDlg']+div>button")
	WebElement btnExport;
	
	@FindBy(id="bmName")
	WebElement txtShortcutName;
	
	@FindBy(xpath="//div[@class='dialogButtonBar']/button[contains(text(),'OK')]")
	WebElement btnOKDialogBox;
	
	def void SearchByItemNumber(String itemNumber) {
		waitForLoadingComplete();
		txtItemNumber.click();
		waitForLoadingComplete();
		txtItemNumber.clearRobustly();
		
		txtItemNumber.waitToBeDisplayed();
		txtItemNumber.sendKeys(itemNumber);
		waitForLoadingComplete();
		txtItemNumber.sendKeys(Keys.ENTER);
		waitForLoadingComplete();
	}

	def void CopyItem(String itemNumber) {
		waitForLoadingComplete();
		rightClick(gridFirstLine);
		
		// Copy Item
		waitToBeDisplayed(linkCopy)
		waitToBeClickable(linkCopy);
		linkCopy.click()
		waitForLoadingComplete();
	}

	def List<String> GetItemNumberList() {
		waitForLoadingComplete();
		return getTextList(listItemNumbers);
	}
	
	def void setItemWarehouse(String itemNumber){
		/*
		waitForLoadingComplete();
		Thread.sleep(1000);
		//rightClick(gridFirstLine);
		try{
			rightClick(gridFirstLine,true,"Item/Warehouse");
			
			}
			catch(Exception e)
			{
				Thread.sleep(1000);
				rightClick(gridFirstLine,true,"Item/Warehouse");
			}
		
//		waitToBeClickable(linkRelated);
//		linkRelated.click();
//		
//		waitToBeClickable(linkItemWarehouse);
//		linkItemWarehouse.click();
		
//		waitForLoadingComplete();
*/
		try {
			gridFirstLine.sendKeys(Keys.chord(Keys.CONTROL, "11"));
		} catch (Exception e) {
			//System.out.println("Element " + element + " cannot select All Rows" + e.getStackTrace());
		}
	}	
	
	
	
	def close() {
		btnClose.click()
		System.out.println("MMS001 tab closed")
	}
	
	/**
	 * Navigate to Item Warehouse link in Item
	 */
	def void ItemWarehouse(String itemNumber){
		waitForLoadingComplete();
		gridFirstLine.sendKeys(Keys.chord(Keys.CONTROL,"11"));
		waitForLoadingComplete();	
	}
	
	def void setItemFacility(String itemNumber)
	{
		waitForLoadingComplete();
		rightClick(gridFirstLine);
		
		waitToBeClickable(linkRelated);
		linkRelated.click();
		
		waitToBeClickable(linkItemFacility);
		linkItemFacility.click();
		
		waitForLoadingComplete();
	}
	
	def List<String> getDataOfItem(String itemNumber){
		waitForLoadingComplete();
		var InforGrid grid = new InforGrid(gridMMS001);
		var dataList = grid.getDataOfRowContainingTextInColumn(1, itemNumber);
		return dataList;		
	}
	
	def void EditItem(String itemNumber) {
		waitForLoadingComplete();
		var InforGrid grid = new InforGrid(gridMMS001);
		var cell = grid.getCell("Item number",itemNumber);
		waitToBeClickable(cell)
		cell.click();
		waitForLoadingComplete();
	
		btnEdit.clickWhenReady();
		waitForLoadingComplete();			
	}
	
	def void clearItemInsertNewNo(String itemNumber){
		
		waitForLoadingComplete();
		txtChangeItemNumber.clear;
		txtChangeItemNumber.sendKeys(itemNumber);
		
	}
	
	/**
	 * Check whether the Entered view is displayed
	 * @param value is the view that we have entered in CRS020B
	 * @Return true is that view is displayed in the view list
	 */
	 def boolean checkTheview(String value)
	 {
	 	
	 	waitForLoadingComplete();
	 	try{
	 		selectFromDropdown(btnDrpDwnView, listView, value);
	 		return true;
	 		
	 		}
	 		catch(NullPointerException e)
	 		{
	 			return false;
	 		}
	 }
	 /**
	  * Set the sorting Order
	  * @param value of the sorting order
	  */
	 def void setSortingOrder(String value)
	 {
	 	waitForLoadingComplete();
	 	selectFromDropdown(btnDrpDwnSortingOrder, listSortingOrder, value)
	 }
	 
	 /**
	  * Select first five rows
	  */
	  def void selsctRows()
	  {
	  	waitForLoadingComplete();
		var InforGrid grid = new InforGrid(gridMMS001);
		var cellList = grid.getCellsFromColumn(3)
		var firstCell = cellList.get(0);
		firstCell.click();
//		actions.click(cellList.get(0)).keyDown(Keys.CONTROL)
//		.click(cellList.get(4)).keyUp(Keys.CONTROL).build().perform();
		   var Robot rb = new Robot()
                  rb.keyPress(KeyEvent.VK_SHIFT);
                  rb.keyPress(KeyEvent.VK_DOWN);
                  rb.keyRelease(KeyEvent.VK_DOWN);
                  rb.keyPress(KeyEvent.VK_DOWN);
                  rb.keyRelease(KeyEvent.VK_DOWN);
                  rb.keyPress(KeyEvent.VK_DOWN);
                  rb.keyRelease(KeyEvent.VK_DOWN);
                  rb.keyPress(KeyEvent.VK_DOWN);
                  rb.keyRelease(KeyEvent.VK_DOWN);
                  rb.keyRelease(KeyEvent.VK_SHIFT);
	
		
	  }
	  
	  /**
	   * Verify the Heading of Excel Export
	   * 
	   * @return Name of the Header
	   */
	   
	   def String excelExportheading()
	   {
	   		waitForLoadingComplete();
	   		waitToBeDisplayed(pnlExportExcel);
	   		waitToBeDisplayed(lblHeading);
	   		return lblHeading.text;
	   }
	   
	   /**
		 * Select the expected currently selected rows radio button
		 */
		def void clickSelectedRowRbtn() {
			waitForLoadingComplete();
			btnRadioExportExcel.click();
		}
	
		/**
		 * Select the keep source format radio Button
		 */
		def void clickKeepSourceRbtn() {
			waitForLoadingComplete();
			btnRadioSourceFormat.click();
		}
	
		/**
		 * Click the export button
		 */
		def clickExportBtn() {
			waitForLoadingComplete();
			btnExport.click();
		}
	
		/**
		 * Sets shortcut name in the Shortcuts dialog box and create shortcut
		 */
		def createShortcut(String shortcutName) {
			txtShortcutName.waitToBeClickable();
			txtShortcutName.click();
			txtShortcutName.clearRobustly();
			txtShortcutName.sendKeys(shortcutName);
	
			// click OK button in the Shortcuts dialog box
			btnOKDialogBox.waitToBeClickable();
			btnOKDialogBox.click();
		}
}
