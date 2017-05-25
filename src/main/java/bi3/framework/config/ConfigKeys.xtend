package bi3.framework.config

import java.util.Properties
import java.io.FileInputStream
import bi3.framework.util.DataUtil
import bi3.framework.util.SystemUtil
import java.net.URI
import java.io.File
import bi3.framework.exceptions.FrameworkException

public class ConfigKeys {

    public static String BROWSER_TYPE;
    public static String BIT_VERSION;
    public static int TIME_OUT;
    public static int DEFAULT_TIMEOUT;

    public static String BASE_URL;
    public static String CHROME_DRIVER_PATH;
    public static String IE_64_DRIVER_PATH;
    public static String IE_32_DRIVER_PATH;
    public static String SCREENSHOT_PATH;
    public static String FAIL_RETRY_COUNT;
    public static String MOCKRUN2_TEST_DATA_PATH;
    
    public static String DATA_HELPER_PATH;
    public static String EXCEL_DOWNLOAD_PATH;
    
    private static String URL_SEPARATOR = File.separatorChar.toString();

    def static void setProperties(){

        var Properties properties = new Properties();
        try {
            properties.load(new FileInputStream(".\\src\\main\\resources\\config\\config.properties"));
            BROWSER_TYPE = properties.getProperty("BROWSER_TYPE");
            //TIME_OUT = Integer.parseInt(properties.getProperty("TIME_OUT"));
            //DEFAULT_TIMEOUT = Integer.parseInt(properties.getProperty("DEFAULT_TIMEOUT"));

            BASE_URL = properties.getProperty("BASE_URL");
            CHROME_DRIVER_PATH = properties.getProperty("CHROME_DRIVER_PATH");
            //IE_64_DRIVER_PATH = properties.getProperty("IE_64_DRIVER_PATH");
            //IE_32_DRIVER_PATH  = properties.getProperty("IE_32_DRIVER_PATH");

            SCREENSHOT_PATH = properties.getProperty("SCREENSHOT_PATH");
            
            DATA_HELPER_PATH = properties.getProperty("DATA_HELPER_PATH");
            
            MOCKRUN2_TEST_DATA_PATH = properties.getProperty("MOCKRUN2_TEST_DATA_PATH"); 
            
            SystemUtil.emptyTheFolder(properties.getProperty("EXCEL_DOWNLOAD_PATH"));
            EXCEL_DOWNLOAD_PATH = properties.getProperty("EXCEL_DOWNLOAD_PATH").concat(URL_SEPARATOR).concat(DataUtil.getRandomNumber());
            if(SystemUtil.createFolder(EXCEL_DOWNLOAD_PATH)){
            	println("Directory created success!");
            } else {
            	println("Directory created fail!");
            	throw new FrameworkException("EXCEL_DOWNLOAD_PATH directory fail to create!");
            }

        } catch (Exception ex) {
        	ex.printStackTrace();
            System.exit(0);
        }
    }
}