package bi3.framework.util

import java.io.File
import org.apache.commons.io.FileUtils

/**
 * System Util class.
 * 
 * @author OsandaF
 */
class SystemUtil {
	
	/**
	 * Create folder.
	 * 
	 * @param full path with the file name (Ex. C:\\Directory1).
	 */
	def static boolean createFolder(String name) {
		var File file = new File(name)
		if (!file.exists()) {
            if (file.mkdir()) {
                println(name + ": Directory is created!");
                return true;
            } else {
                println(name + ": Failed to create directory!");
                return false;
            }
        } else {
        	println(name + ": Failed to create directory!");
            return false;
        }
	}
	
	/**
	 * Empty the folder.
	 * 
	 * @param path to directory.
	 */
	def static void emptyTheFolder(String pathToDir) {
		FileUtils.cleanDirectory(new File(pathToDir));
	}
}