package bi3.tests.mockrun2;

import bi3.pages.HomePage;
import bi3.pages.LoginPage;
import bi3.pages.ois301.OIS301CustomerOrder;
import bi3.tests.BaseTest;
import org.testng.Assert;
import org.testng.annotations.BeforeMethod;
import org.testng.annotations.Test;

/**
 * Author : Mathuja Ketheeswaran
 */
@SuppressWarnings("all")
public class TC_D_09 extends BaseTest {
  private LoginPage loginPage;
  
  private HomePage homePage;
  
  private OIS301CustomerOrder ois301;
  
  @BeforeMethod
  public void Initialize() {
    LoginPage _loginPage = new LoginPage(BaseTest.driver);
    this.loginPage = _loginPage;
    HomePage _homePage = new HomePage(BaseTest.driver);
    this.homePage = _homePage;
    OIS301CustomerOrder _oIS301CustomerOrder = new OIS301CustomerOrder(BaseTest.driver);
    this.ois301 = _oIS301CustomerOrder;
  }
  
  /**
   * Validate the order number visible in the first record
   * 
   * To do that : LoginPage--> GotoOIS301-->Sort theOrder-->Enter order Number
   * Priority-->Can assign which test case need to be run first
   * enabled(true)--> test case is activated,eligible to run
   * enabled(false)--> test case in commented mode,it won't run
   */
  @Test(priority = 1, enabled = true)
  public void ValidateOrderNumber() {
    String orderNumber = "0010000621";
    this.loginPage.GoTo();
    this.homePage.GoToOIS301();
    this.ois301.clickDropDownSort();
    this.ois301.enterOrderNumber(orderNumber);
    Assert.assertEquals(this.ois301.validateOrderNumber(), "orderNumber");
  }
  
  /**
   * Validate panel ATS101
   * 
   * To do that : LoginPage--> GotoOIS301-->Sort theOrder-->Enter order Number
   * --->Right click-->set attr values
   * Page will navigate to ATS101
   */
  @Test(priority = 2, enabled = true)
  public void ValidatePanalName() {
    String orderNumber = "0010000621";
    String panalName = "ATS101";
    this.loginPage.GoTo();
    this.homePage.GoToOIS301();
    this.ois301.clickDropDownSort();
    this.ois301.enterOrderNumber(orderNumber);
    Assert.assertEquals(this.ois301.validateOrderNumber(), orderNumber);
    this.ois301.selectAttrValues();
    Assert.assertEquals(this.ois301.validatePanal(panalName), "ATS101");
  }
  
  /**
   * Validate attribute Description
   * 
   * To do that : LoginPage--> GotoOIS301-->Sort theOrder-->Enter order Number
   * --->Right click-->click attr values
   * Page will navigate to ATS101
   * enter attribute value---> Check description
   */
  @Test(priority = 3, enabled = false)
  public void ValidateAttributeDescription() {
    String orderNumber = "0010000621";
    String panalName = "ATS101";
    String secondPanalName = "OIS301";
    String attributeValue = "ATS101";
    String description = (("Product " + attributeValue) + "");
    this.loginPage.GoTo();
    this.homePage.GoToOIS301();
    this.ois301.clickDropDownSort();
    this.ois301.enterOrderNumber(orderNumber);
    Assert.assertEquals(this.ois301.validateOrderNumber(), orderNumber);
    this.ois301.selectAttrValues();
    Assert.assertEquals(this.ois301.validatePanal(panalName), panalName);
    this.ois301.sortOrder();
    this.ois301.enterAttributeNo(attributeValue);
    Assert.assertEquals(this.ois301.findDescription(description), (("Product " + attributeValue) + ""));
    this.ois301.closePanal(panalName);
    this.ois301.closePanal(secondPanalName);
  }
}
