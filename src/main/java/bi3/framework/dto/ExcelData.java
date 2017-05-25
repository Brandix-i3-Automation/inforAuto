package bi3.framework.dto;

import java.util.ArrayList;
import java.util.List;

/**
 * Excel data class DTO.
 * 
 * @author OsandaF
 */
public class ExcelData {
	
	/**	data cell list. */
	private List<List<String>> data = new ArrayList<List<String>>();

	/**
	 * Get cell data.
	 * 
	 * @return List<List<String>> of data cells
	 */
	public List<List<String>> getData() {
		return data;
	}

	/**
	 * Set data cells.
	 * 
	 * @param bodyCells List<List<String>> of data cells.
	 */
	public void setData(List<List<String>> data) {
		this.data = data;
	}
}
