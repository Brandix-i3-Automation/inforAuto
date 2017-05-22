package bi3.pages.mms060;

import bi3.framework.core.WebDriverExtensions;
import bi3.pages.BasePage;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;

@SuppressWarnings("all")
public class MMS060E extends BasePage {
  public MMS060E(final WebDriver driver) {
    super(driver);
  }
  
  @FindBy(id = "WWPAQT")
  private WebElement txtPendingPutAwayValue;
  
  @FindBy(id = "Next")
  private WebElement btnNext;
  
  public String getPendingPutAwayValue() {
    return BasePage.GetTextBoxvalue(this.txtPendingPutAwayValue);
  }
  
  public void clickNext() {
    WebDriverExtensions.waitToBeClickable(this.btnNext);
    this.btnNext.click();
    BasePage.waitForLoadingComplete();
  }
}
