package bi3.tests;

import bi3.framework.config.ConfigKeys;
import com.google.common.base.Objects;
import java.io.File;
import java.util.HashMap;
import java.util.concurrent.TimeUnit;
import org.apache.commons.io.FileUtils;
import org.eclipse.xtext.xbase.lib.Exceptions;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;
import org.openqa.selenium.ie.InternetExplorerDriver;
import org.openqa.selenium.ie.InternetExplorerDriverService;
import org.openqa.selenium.remote.CapabilityType;
import org.openqa.selenium.remote.DesiredCapabilities;
import org.testng.annotations.AfterMethod;
import org.testng.annotations.BeforeMethod;
import org.testng.annotations.BeforeSuite;

@SuppressWarnings("all")
public class BaseTest {
  public static WebDriver driver;
  
  @BeforeSuite(alwaysRun = true)
  public void beforeSuite() {
    ConfigKeys.setProperties();
  }
  
  @BeforeMethod
  public void BeforeTest() {
    try {
      String _BROWSER = ConfigKeys.BROWSER_TYPE.toUpperCase();
      String downloadFilepath = "D:/My Files/TryDownload";
      boolean _equals = Objects.equal(_BROWSER, "CHROME");
      if (_equals) {
        System.setProperty("webdriver.chrome.driver", ConfigKeys.CHROME_DRIVER_PATH);
        File _file = new File(downloadFilepath);
        FileUtils.cleanDirectory(_file);
        HashMap<String, Object> chromePrefs = new HashMap<String, Object>();
        chromePrefs.put("profile.default_content_settings.popups", Integer.valueOf(0));
        chromePrefs.put("download.default_directory", downloadFilepath);
        ChromeOptions options = new ChromeOptions();
        options.addArguments("start-maximized");
        options.setExperimentalOption("prefs", chromePrefs);
        DesiredCapabilities cap = DesiredCapabilities.chrome();
        cap.setCapability(CapabilityType.ACCEPT_SSL_CERTS, true);
        cap.setCapability(ChromeOptions.CAPABILITY, options);
        ChromeDriver _chromeDriver = new ChromeDriver(cap);
        BaseTest.driver = _chromeDriver;
      }
      boolean _equals_1 = Objects.equal(_BROWSER, "IE");
      if (_equals_1) {
        System.setProperty("webdriver.ie.driver", ConfigKeys.IE_32_DRIVER_PATH);
        InternetExplorerDriverService driverService = InternetExplorerDriverService.createDefaultService();
        DesiredCapabilities capabilities = DesiredCapabilities.internetExplorer();
        capabilities.setCapability(InternetExplorerDriver.INTRODUCE_FLAKINESS_BY_IGNORING_SECURITY_DOMAINS, false);
        capabilities.setCapability(InternetExplorerDriver.NATIVE_EVENTS, false);
        capabilities.setCapability(InternetExplorerDriver.IGNORE_ZOOM_SETTING, true);
        capabilities.setCapability(InternetExplorerDriver.BROWSER_ATTACH_TIMEOUT, "60000");
        capabilities.setCapability(InternetExplorerDriver.IE_ENSURE_CLEAN_SESSION, true);
        capabilities.setCapability(InternetExplorerDriver.INITIAL_BROWSER_URL, "");
        InternetExplorerDriver _internetExplorerDriver = new InternetExplorerDriver(capabilities);
        BaseTest.driver = _internetExplorerDriver;
      }
      boolean _equals_2 = Objects.equal(_BROWSER, "FF");
      if (_equals_2) {
      }
      BaseTest.driver.manage().timeouts().implicitlyWait(30, TimeUnit.SECONDS);
    } catch (Throwable _e) {
      throw Exceptions.sneakyThrow(_e);
    }
  }
  
  @AfterMethod
  public void AfterTest() {
    BaseTest.driver.quit();
  }
}