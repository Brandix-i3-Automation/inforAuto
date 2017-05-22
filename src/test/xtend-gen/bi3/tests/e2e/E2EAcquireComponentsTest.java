package bi3.tests.e2e;

import bi3.framework.util.DataUtil;
import bi3.pages.HomePage;
import bi3.pages.LoginPage;
import bi3.pages.ToolbarPage;
import bi3.pages.ois300.OIS300;
import bi3.pages.pps200.PPS200A;
import bi3.pages.pps200.PPS200B;
import bi3.pages.pps201.PPS201B;
import bi3.pages.pps600.PPS600E;
import bi3.pages.pps600.PPS600F;
import bi3.pages.pps600.PPS600SelectMedia;
import bi3.tests.BaseTest;
import org.eclipse.xtext.xbase.lib.Exceptions;
import org.eclipse.xtext.xbase.lib.InputOutput;
import org.testng.Assert;
import org.testng.annotations.BeforeMethod;
import org.testng.annotations.Test;

@SuppressWarnings("all")
public class E2EAcquireComponentsTest extends BaseTest {
  private LoginPage loginPage;
  
  private HomePage homePage;
  
  private PPS200A pps200A;
  
  private PPS200B pps200B;
  
  private PPS201B pps201B;
  
  private ToolbarPage toolbarPage;
  
  private OIS300 ois300;
  
  private PPS600E pps600E;
  
  private PPS600F pps600F;
  
  private PPS600SelectMedia pps600SelectMedia;
  
  @BeforeMethod
  public void Initialize() {
    LoginPage _loginPage = new LoginPage(BaseTest.driver);
    this.loginPage = _loginPage;
    HomePage _homePage = new HomePage(BaseTest.driver);
    this.homePage = _homePage;
    PPS200A _pPS200A = new PPS200A(BaseTest.driver);
    this.pps200A = _pPS200A;
    PPS200B _pPS200B = new PPS200B(BaseTest.driver);
    this.pps200B = _pPS200B;
    PPS201B _pPS201B = new PPS201B(BaseTest.driver);
    this.pps201B = _pPS201B;
    ToolbarPage _toolbarPage = new ToolbarPage(BaseTest.driver);
    this.toolbarPage = _toolbarPage;
    OIS300 _oIS300 = new OIS300(BaseTest.driver);
    this.ois300 = _oIS300;
    PPS600E _pPS600E = new PPS600E(BaseTest.driver);
    this.pps600E = _pPS600E;
    PPS600F _pPS600F = new PPS600F(BaseTest.driver);
    this.pps600F = _pPS600F;
    PPS600SelectMedia _pPS600SelectMedia = new PPS600SelectMedia(BaseTest.driver);
    this.pps600SelectMedia = _pPS600SelectMedia;
  }
  
  /**
   * @TestCaseID: 003
   * @CloudSuite: F&B
   * @Description: Test the PO work flow and purchase raw materials & ingredients to be used in manufacturing
   * @author:	Insaaf
   */
  @Test
  public void E2EAcquireComponentsTest() {
    try {
      final String PONo = DataUtil.get10DigitId();
      this.loginPage.GoTo();
      this.homePage.GoToPPS200();
      this.pps200B.CreatePO(PONo);
      InputOutput.<String>println(PONo);
      this.toolbarPage.clickCreateLogo();
      this.pps200A.fillPOData("Y50001", "170524", "D20");
      Thread.sleep(10000);
      this.homePage.clickNextTillReqPanel("PPS201/B1");
      this.pps201B.fillLineEntry("D50519", "20", "KG", "20");
      this.pps201B.CloseActiveTab();
      this.pps201B.fillLineEntry("D50518", "10", "KG", "10");
      this.pps201B.closeAllTabs();
      this.homePage.GoToPPS200();
      boolean _SearchPONo = this.pps200B.SearchPONo(PONo);
      if (_SearchPONo) {
        InputOutput.<String>println("PO IS displayed in the Grid");
        this.pps200B.GoToLinesOfRecordWithPO(PONo);
        this.pps201B.verifyStatus();
        this.pps201B.closeAllTabs();
        this.homePage.GoToPPS600();
        this.pps600E.FillPONumbers(PONo);
        this.pps600E.FillLowestStatus("15");
        this.pps600E.FillHighestStatus("15");
        this.homePage.clickOnNext();
        this.pps600F.FillReportText(PONo);
        this.homePage.clickOnNext();
        this.pps600SelectMedia.ConfirmOutput();
        this.pps600E.closeAllTabs();
        this.homePage.GoToPPS200();
        String lstStatus = this.pps200B.verifyLowerStatus(PONo);
        Assert.assertEquals(lstStatus, "20", "Status is not 20");
      } else {
        InputOutput.<String>println("PO IS NOT displayed in the Grid");
      }
      BaseTest.driver.quit();
    } catch (Throwable _e) {
      throw Exceptions.sneakyThrow(_e);
    }
  }
}
