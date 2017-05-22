package bi3.pages.pps201;

import bi3.framework.elements.inforelements.InforGrid;
import bi3.pages.BasePage;
import org.eclipse.xtext.xbase.lib.Conversions;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.testng.Assert;

@SuppressWarnings("all")
public class PPS201B extends BasePage {
  public PPS201B(final WebDriver driver) {
    super(driver);
  }
  
  @FindBy(css = "div[id*=\'PPA201BS\'][class*=\'inforDataGrid\']")
  private WebElement gridElement;
  
  @FindBy(id = "WBITNO")
  private WebElement txtItemNo;
  
  @FindBy(id = "WBORQA")
  private WebElement txtOrderQty;
  
  @FindBy(id = "WBPUUN")
  private WebElement txtPOu;
  
  @FindBy(id = "WBPUPR")
  private WebElement txtPurchPrice;
  
  @FindBy(id = "XT_0106")
  private WebElement btnAdd;
  
  @FindBy(id = "dbtnent")
  private WebElement btnNextPopUp;
  
  public boolean CheckIfDetailsGridEmpty() {
    InforGrid grid = new InforGrid(this.gridElement);
    int _rowCount = grid.getRowCount();
    boolean _equals = (_rowCount == 0);
    if (_equals) {
      return true;
    } else {
      return false;
    }
  }
  
  public void verifyStatus() {
    boolean _CheckIfDetailsGridEmpty = this.CheckIfDetailsGridEmpty();
    boolean _equals = (_CheckIfDetailsGridEmpty == false);
    if (_equals) {
      InforGrid grid = new InforGrid(this.gridElement);
      int col = ((Object[])Conversions.unwrapArray(grid.getRowsContainingTextInColumn(3, "15"), Object.class)).length;
      int row = grid.getRowCount();
      Assert.assertEquals(col, row, "PO is not in Status 15");
    }
  }
  
  public void fillLineEntry(final String itemNo, final String orderQty, final String POu, final String purPrice) {
    this.txtItemNo.click();
    this.txtItemNo.sendKeys(itemNo);
    this.txtOrderQty.click();
    this.txtOrderQty.sendKeys(orderQty);
    this.txtPOu.click();
    this.txtPOu.sendKeys(POu);
    this.txtPurchPrice.click();
    this.txtPurchPrice.sendKeys(purPrice);
    this.btnAdd.click();
    this.clickOnNext();
    this.clickOnNext();
    this.clickOnNext();
    this.clickOnNext();
    this.btnNextPopUp.click();
  }
}
