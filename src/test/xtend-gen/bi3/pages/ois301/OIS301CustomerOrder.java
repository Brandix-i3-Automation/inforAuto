package bi3.pages.ois301;

import bi3.framework.core.DefaultWebDriver;
import bi3.pages.BasePage;
import org.openqa.selenium.By;
import org.openqa.selenium.Keys;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;

/**
 * Author : Mathuja Ketheeswaran
 */
@SuppressWarnings("all")
public class OIS301CustomerOrder extends BasePage {
  public OIS301CustomerOrder(final WebDriver driver) {
    super(driver);
  }
  
  @FindBy(xpath = "//input[@id=\'WWQTTP-shdo\']")
  private WebElement dropDownSort;
  
  @FindBy(xpath = "//li[@id=\'list-option3\']")
  private WebElement listOrderOption;
  
  @FindBy(xpath = "//input[@id=\'W1OBKV\']")
  private WebElement txtOrderNo;
  
  @FindBy(xpath = "//div[@class=\'grid-canvas grid-canvas-top grid-canvas-left\']/div[1]/div[1]")
  private WebElement gridFirstRow;
  
  @FindBy(xpath = "//a[text()=\'Related\']")
  private WebElement linkRelated;
  
  @FindBy(xpath = "//ul[@class=\'inforMenuOptions submenu\']//li[3]//a")
  private WebElement linkAttrValues;
  
  @FindBy(xpath = "//li[@id=\'list-option1\']")
  private WebElement listOrderOptions;
  
  @FindBy(xpath = "//div[text()=\'Test Attribute 01\']/ancestor::div[1]//div[4]/div")
  private WebElement txtAttribute;
  
  public void clickDropDownSort() {
    BasePage.waitForLoadingComplete();
    this.dropDownSort.click();
    BasePage.waitForLoadingComplete();
    this.listOrderOption.click();
    BasePage.waitForLoadingComplete();
  }
  
  public void enterOrderNumber(final String orderNo) {
    BasePage.waitForLoadingComplete();
    this.txtOrderNo.click();
    BasePage.clearRobustly(this.txtOrderNo);
    this.txtOrderNo.sendKeys(orderNo);
    this.txtOrderNo.sendKeys(Keys.ENTER);
    BasePage.waitForLoadingComplete();
  }
  
  public String validateOrderNumber() {
    BasePage.waitForLoadingComplete();
    return this.gridFirstRow.getText();
  }
  
  public void selectAttrValues() {
    BasePage.waitForLoadingComplete();
    this.rightClick(this.gridFirstRow);
    this.linkRelated.click();
    this.linkAttrValues.click();
    BasePage.waitForLoadingComplete();
  }
  
  public void sortOrder() {
    BasePage.waitForLoadingComplete();
    this.dropDownSort.click();
    BasePage.waitForLoadingComplete();
    this.listOrderOptions.click();
    BasePage.waitForLoadingComplete();
  }
  
  public void enterAttributeNo(final String attributeValue) {
    BasePage.waitForLoadingComplete();
    this.txtAttribute.click();
    BasePage.clearRobustly(this.txtAttribute);
    this.txtAttribute.sendKeys(attributeValue);
    this.txtAttribute.sendKeys(Keys.ENTER);
    BasePage.waitForLoadingComplete();
  }
  
  public WebElement findDescription(final String description) {
    WebElement _xblockexpression = null;
    {
      String element = (("//div[text()=\'Test Attribute 01\']/ancestor::div[1]//div[5][text()=\'" + description) + "\']");
      _xblockexpression = DefaultWebDriver.driver.findElement(By.xpath(element));
    }
    return _xblockexpression;
  }
  
  public WebElement validatePanal(final String panalName) {
    WebElement _xblockexpression = null;
    {
      String element = (("//span[text()=\'" + panalName) + "\']");
      _xblockexpression = DefaultWebDriver.driver.findElement(By.xpath(element));
    }
    return _xblockexpression;
  }
  
  public WebElement closePanal(final String panalName) {
    WebElement _xblockexpression = null;
    {
      String element = (("//span[text()=\'" + panalName) + "\']/ancestor::div[1]/ancestor::div[1]/ancestor::a[1]/following-sibling::button");
      _xblockexpression = DefaultWebDriver.driver.findElement(By.xpath(element));
    }
    return _xblockexpression;
  }
}
