package bi3.pages.submenuStart;

import bi3.framework.core.DefaultWebDriver;
import bi3.framework.core.WebDriverExtensions;
import bi3.pages.BasePage;
import org.eclipse.xtext.xbase.lib.Exceptions;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;

/**
 * Author : Mathuja Ketheeswaran
 */
@SuppressWarnings("all")
public class AddPage extends BasePage {
  public AddPage(final WebDriver driver) {
    super(driver);
  }
  
  @FindBy(xpath = "//input[@id=\'gvAddDashoboardTitle\']")
  private WebElement txtNewPageTitle;
  
  @FindBy(xpath = "//button[@id=\'okButton\']")
  private WebElement btnOkay;
  
  @FindBy(xpath = "//div[@class=\'inforIcon addNew\']//following-sibling::div")
  private WebElement labelAddPage;
  
  @FindBy(xpath = "//div[@class=\'gvContainer\']")
  private WebElement divBlackPage;
  
  public void enterNewPageTitle(final String newTitleValue) {
    this.txtNewPageTitle.click();
    BasePage.clearRobustly(this.txtNewPageTitle);
    this.txtNewPageTitle.sendKeys(newTitleValue);
  }
  
  public void clickOkay() {
    BasePage.waitForLoadingComplete();
    this.btnOkay.click();
    BasePage.waitForLoadingComplete();
  }
  
  public String pagePopUp() {
    WebDriverExtensions.waitToBeDisplayed(this.labelAddPage);
    return this.labelAddPage.getText();
  }
  
  public boolean addPage() {
    WebDriverExtensions.waitToBeDisplayed(this.divBlackPage);
    return this.divBlackPage.isDisplayed();
  }
  
  public WebElement findCreatedPage(final String pageName) {
    try {
      WebElement _xblockexpression = null;
      {
        Thread.sleep(5000);
        String element = (("//ul[@id=\'gvMenuSettings\']//a[text()=\'" + pageName) + "\']");
        _xblockexpression = DefaultWebDriver.driver.findElement(By.xpath(element));
      }
      return _xblockexpression;
    } catch (Throwable _e) {
      throw Exceptions.sneakyThrow(_e);
    }
  }
}
