package bi3.framework.util

import java.io.File
import org.apache.commons.io.FilenameUtils
import org.apache.commons.io.FileUtils
import java.util.List

/**
 * System Util class.
 * 
 * @author OsandaF
 */
class FileUtil {
	
	private static String[] extensions = #{'xls','xlsx'};
	
	/**
	 * Return the pointed file as a File object.
	 * 
	 * @param path to file.
	 */
	def static File getFile(String pathToFolder) {
		
		var File dir = new File(pathToFolder);
		var files = FileUtils.listFiles(dir, extensions, true);
		
		var File file = files.get(0);
		if(!isFileExists(file)) {
			return null;
		} else {
			return file;
		}
	}
	
	/**
	 * Return a boolean checking the file is exists.
	 * 
	 * @param file object.
	 */
	def static boolean isFileExists(File file) {
		return file.exists();
	}
	
	/**
	 * Get file extension.
	 * 
	 * @param path to file.
	 */
	def static String getExtension(String pathToFile) {
		return FilenameUtils.getExtension(pathToFile);
	}
	
	/**
	 * Get file size using file path.
	 * 
	 * @param path to file.
	 */
	def static long getFileSize(String pathToFile) {
		return FileUtils.sizeOf(new File(pathToFile));
	}
	
	/**
	 * Get file name removing extension.
	 * 
	 * @param only the file name (Ex: test.txt).
	 */
	def static String getNameWithoutExtension(String FileName) {
		return FilenameUtils.removeExtension(FileName);
	}
	
	def static String extractFileNameFromPath(File file) {
		return file.name;
	}
}