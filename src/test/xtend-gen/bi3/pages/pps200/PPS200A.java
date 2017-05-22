package bi3.pages.pps200;

import bi3.pages.BasePage;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;

@SuppressWarnings("all")
public class PPS200A extends BasePage {
  public PPS200A(final WebDriver driver) {
    super(driver);
  }
  
  /**
   * Supplier text box
   */
  @FindBy(id = "WASUNO")
  private WebElement txtSupplier;
  
  /**
   * Required Delivery Date
   */
  @FindBy(id = "WADWDT")
  private WebElement dateReqDel;
  
  /**
   * Order type text box
   */
  @FindBy(id = "WAORTY")
  private WebElement txtOrderType;
  
  /**
   * Used to Fill data when creating a PO in PPS200/A
   * @param : Supplier
   * @param : Required Delivery Date
   * @param : Order Type
   */
  public void fillPOData(final String supplier, final String delDate, final String orderType) {
    this.txtSupplier.click();
    this.txtSupplier.sendKeys(supplier);
    this.dateReqDel.click();
    this.dateReqDel.sendKeys(delDate);
    this.txtOrderType.click();
    this.txtOrderType.sendKeys(orderType);
    BasePage.waitForLoadingComplete();
  }
}
