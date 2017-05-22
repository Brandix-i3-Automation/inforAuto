package bi3.pages.mms130;

import bi3.framework.core.WebDriverExtensions;
import bi3.pages.BasePage;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;

@SuppressWarnings("all")
public class MMS130E extends BasePage {
  public MMS130E(final WebDriver driver) {
    super(driver);
  }
  
  @FindBy(id = "WLALOC")
  private WebElement chkbAllocatable;
  
  @FindBy(id = "Next")
  private WebElement btnNext;
  
  public void checkAllocatable() {
    WebDriverExtensions.waitToBeDisplayed(this.chkbAllocatable);
    String checked = this.chkbAllocatable.getAttribute("aria-checked");
    boolean _equals = checked.equals("false");
    if (_equals) {
      WebDriverExtensions.waitToBeClickable(this.chkbAllocatable);
      this.chkbAllocatable.click();
    }
  }
  
  public void clickNext() {
    WebDriverExtensions.waitToBeClickable(this.btnNext);
    this.btnNext.click();
    BasePage.waitForLoadingComplete();
  }
}
