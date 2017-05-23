package bi3.pages.startMenu;

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
public class DeletePage extends BasePage {
  public DeletePage(final WebDriver driver) {
    super(driver);
  }
  
  @FindBy(xpath = "//ul[@id=\'gvMenuSettings\']/li[8]/a")
  private WebElement listDeletPage;
  
  @FindBy(xpath = "//div[@class=\'inforIcon help\']//following-sibling::div")
  private WebElement labelDeleteConfirmationPopup;
  
  @FindBy(xpath = "//div[@class=\'dialogButtonBar\']//button[@class=\'inforFormButton default\']")
  private WebElement btnDeleteConfirmation;
  
  @FindBy(xpath = "//div[@class=\'gvPage\']")
  private WebElement divHomePage;
  
  public void deletePage() {
    BasePage.waitForLoadingComplete();
    this.listDeletPage.click();
    BasePage.waitForLoadingComplete();
  }
  
  public String pagePopUp() {
    WebDriverExtensions.waitToBeDisplayed(this.labelDeleteConfirmationPopup);
    return this.labelDeleteConfirmationPopup.getText();
  }
  
  public void clickOkayConfirmation() {
    BasePage.waitForLoadingComplete();
    this.btnDeleteConfirmation.click();
    BasePage.waitForLoadingComplete();
  }
  
  public boolean navigateToHomePage() {
    WebDriverExtensions.waitToBeDisplayed(this.divHomePage);
    return this.divHomePage.isDisplayed();
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
