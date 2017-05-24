package bi3.pages.crs016

import bi3.pages.BasePage
import org.openqa.selenium.WebDriver
import org.openqa.selenium.support.FindBy
import org.openqa.selenium.WebElement
import bi3.framework.elements.inforelements.InforGrid
import org.openqa.selenium.Keys

class CRS016B extends BasePage {
	
	new(WebDriver driver) {
		super(driver)
	}
	@FindBy(id="WWTX40")
	WebElement txtDescription;
	
	@FindBy(id="WWTX15")
	WebElement txtName;
	
	@FindBy(css="div[id*='CRA016BS'][class*='inforDataGrid']")
	WebElement inforGridCRS016B;
	
	@FindBy(css="input[id='R1C2']")
	WebElement txtSeq10Field;
	
	@FindBy(css="input[id='R2C2']")
	WebElement txtSeq20Field;
	
	@FindBy(css="input[id='R3C2']")
	WebElement txtSeq30Field;
	
	@FindBy(css="input[id='R4C2']")
	WebElement txtSeq40Field;
	
	@FindBy(css="input[id='R5C2']")
	WebElement txtSeq50Field;
	
	@FindBy(css="input[id='R6C2']")
	WebElement txtSeq60Field;
	/**
	 * Fill the description field
	 * @param description the description you want to include
	 */
	 def void fillDescription(String description)
	 {
	 	waitForLoadingComplete();
	 	txtDescription.clearRobustly();
	 	txtDescription.sendKeys(description);
	 	
	 }
	 
	 /**
	  * Fill the name field 
	  * @param name the name you want to enter
	  */
	  def void fillName(String name)
	  {
	  	waitForLoadingComplete();
	  	txtName.clearRobustly();
	  	txtName.sendKeys(name);
	  }
	  /**
	   * Fill the respective field according to seq no
	   * @param seq10Field value of the field for seq 10
	   * @param seq20Field value of the field for seq 20
	   * @param seq30Field value of the field for seq 30
	   * @param seq40Field value of the field for seq 40
	   * @param seq50Field value of the field for seq 50
	   * @param seq60Field value of the field for seq 60
	   * 
	   */
	   def void fillSeq10Feild(String seq10Field, String seq20Field, String seq30Field, String seq40Field, String seq50Field, String seq60Field)
	   {
	   		waitForLoadingComplete();
	   		var InforGrid inforGridCRS016B = new InforGrid(inforGridCRS016B);
	   		var cellList = inforGridCRS016B.getCellsFromColumn(1);
	   		println("Cell List is : " +cellList);
	   		cellList.get(0).clickWhenReady();
	   		cellList.get(0).click();
	   		println("WebElemen of the cell " +cellList.get(0))
	   		txtSeq10Field.sendKeys(seq10Field)
	   		
	   		cellList.get(1).clickWhenReady();
	   		txtSeq20Field.sendKeys(seq20Field);
	   		
	   		cellList.get(2).clickWhenReady();
	   		txtSeq30Field.sendKeys(seq30Field);
	   		
	   		cellList.get(3).clickWhenReady();
	   		txtSeq40Field.sendKeys(seq40Field);
	   		
	   		cellList.get(4).clickWhenReady();
	   		txtSeq50Field.sendKeys(seq50Field);
	   		
	   		cellList.get(5).clickWhenReady();
	   		txtSeq60Field.sendKeys(seq60Field);
	   		
	   		txtSeq60Field.sendKeys(Keys.ENTER);
	   }
	
}