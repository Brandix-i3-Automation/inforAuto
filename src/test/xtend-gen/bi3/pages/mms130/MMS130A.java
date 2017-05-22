package bi3.pages.mms130;

import bi3.framework.core.WebDriverExtensions;
import bi3.pages.BasePage;
import java.util.List;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;

@SuppressWarnings("all")
public class MMS130A extends BasePage {
  public MMS130A(final WebDriver driver) {
    super(driver);
  }
  
  @FindBy(id = "Next")
  private WebElement btnNext;
  
  @FindBy(id = "WWITNO")
  private WebElement txtItemNumber;
  
  @FindBy(id = "WACALT-shdo")
  private WebElement btnCalcMethod;
  
  @FindBy(css = "#dropdown-list>li")
  private List<WebElement> listOptions;
  
  public void setItemNumber(final String item) {
    WebDriverExtensions.EnterText(this.txtItemNumber, item);
  }
  
  public void clickNext() {
    WebDriverExtensions.waitToBeClickable(this.btnNext);
    this.btnNext.click();
    BasePage.waitForLoadingComplete();
  }
  
  public void setCalcMethod(final String method) {
    this.selectFromDropdown(this.btnCalcMethod, this.listOptions, method);
    BasePage.waitForLoadingComplete();
  }
}
