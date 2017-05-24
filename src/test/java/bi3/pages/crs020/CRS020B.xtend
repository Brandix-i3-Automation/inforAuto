package bi3.pages.crs020

import bi3.pages.BasePage
import org.openqa.selenium.WebDriver
import org.openqa.selenium.support.FindBy
import org.openqa.selenium.WebElement
import org.openqa.selenium.Keys
import java.util.List
import bi3.framework.elements.inforelements.InforGrid

class CRS020B extends BasePage{
	
	new(WebDriver driver) {
		super(driver)
	}
	
	@FindBy(css="div[id=W1PGNMContainer]>button")
	WebElement btnArow;
	
	@FindBy(id="W1PGNM")
	WebElement txtProgram;
	
	@FindBy(id="WWBQTP-shdo")
	WebElement btnDrpDwnSortingOrder;
	
	@FindBy(css="#dropdown-list>li")
	List <WebElement> listSortingOrder
	
	@FindBy(id="W1PAVR")
	WebElement txtView;
	
	@FindBy(css="div[id*='CRA020BS'][class*='inforDataGrid']")
	WebElement inforGridCRS020;
	
	@FindBy(xpath="//span[text()='Delete']")
	WebElement linkDelete
	
	/**
	 *  Insert Program
	 * @param programmId ID of the program you want to insert
	 */
	 def void insertProgram(String programId)
	 {
	 	waitForLoadingComplete();
	 	txtProgram.clearRobustly();
	 	txtProgram.sendKeys(programId);
	 }
	 
	 
	 /**
	  *  Set Sorting order to 0
	  *  @param value of the Sorting Order
	  */
	  def void setSortingOrder(String value)
	  {
	  	waitForLoadingComplete();
	  	selectFromDropdown(btnDrpDwnSortingOrder,listSortingOrder,value);
	  }
	
	/**
	 *  Insert value to the view
	 * @param name of the view
	 */
	 def void insertView(String view)
	 {
	 	waitForLoadingComplete()
	 	txtView.clearRobustly();
	 	txtView.sendKeys(view);
	 	txtView.sendKeys(Keys.ENTER);
	 }
	 
	 /**
	  *  Delete if any detail is exist
	  *  @param view value of the view
	  */
	  def void deleteData(String view)
	  {
	  	waitForLoadingComplete();
	  	var inforGridCRS020 = new InforGrid(inforGridCRS020);
	 
		if(inforGridCRS020.rowCount!=0)
		{
			var firstCell = inforGridCRS020.getCell(0,view);
			println("WebElemen of the first cell : "+firstCell)
	  		firstCell.rightClick();
	  		waitToBeDisplayed(linkDelete);
	  		linkDelete.click();
	  		btnNext.click();
	  		
	  		
		}
		  	
	  }
	  
	  /**
	   * This is to check whether the record that we have entered in CRS016B is exist
	   *  @param name of the column 
	   *  Returns the value in the description Column
	   * 
	   */
	  def String checkRecord(String columnName)
	  {
	  	waitForLoadingComplete();
	  	var inforGridCRS020 = new InforGrid(inforGridCRS020);
	  	var cellDescription = inforGridCRS020.getDataOfColumn(columnName);
	  	println("values in the Column : "+cellDescription);
	  	var matchingValue = cellDescription.get(0);
	  	println("Description that have entered : "+matchingValue);
	  	
	  	return matchingValue;
	  	
	  }
	
}