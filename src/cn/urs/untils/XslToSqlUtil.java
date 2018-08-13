package cn.urs.untils;

import java.io.FileInputStream;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Random;

import jxl.Cell;
import jxl.Sheet;
import jxl.Workbook;

public class XslToSqlUtil {

	private static jxl.Workbook readwb = null;

	public static List<String> getXColumn(String path, Integer sheet, Integer x) {
		List<String> list = new ArrayList<String>();
		// 构建Workbook对象, 只读Workbook对象
		// 直接从本地文件创建Workbook
		try {
			InputStream instream;

			instream = new FileInputStream(path);
			readwb = Workbook.getWorkbook(instream);
			// Sheet的下标是从0开始
			// 获取第一张Sheet表
			Sheet readsheet = readwb.getSheet(sheet);
			// 获取Sheet表中所包含的总列数
			int rsColumns = readsheet.getColumns();
			// 获取Sheet表中所包含的总行数
			int rsRows = readsheet.getRows();
			// 获取指定单元格的对象引用
			for (int i = 1; i < rsRows; i++) {
				// Cell cell = readsheet.getCell(0, i);
				// System.out.print(cell.getContents() + " ");
				Cell cell = readsheet.getCell(x, i);
				// System.out.println(cell.getContents() + " ");
				list.add(cell.getContents());
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	/**
	 * 获取表格数据
	 * 
	 * @param path
	 *            文件路径
	 * @param sheet
	 * @return List<List<String>>
	 */
	public static List<List<String>> getTable(String path, Integer sheet) {
		List<List<String>> table = new ArrayList<List<String>>();
		// 构建Workbook对象, 只读Workbook对象
		// 直接从本地文件创建Workbook
		try {
			InputStream instream;
			instream = new FileInputStream(path);
			readwb = Workbook.getWorkbook(instream);
			// Sheet的下标是从0开始
			// 获取第一张Sheet表
			Sheet readsheet = readwb.getSheet(sheet);
			// 获取Sheet表中所包含的总列数
			int rsColumns = readsheet.getColumns();
			// 获取Sheet表中所包含的总行数
			int rsRows = readsheet.getRows();
			// 获取指定单元格的对象引用
			System.out.println("-----------------------");
			for (int i = 0; i < rsRows; i++) {
				List<String> list = new ArrayList<String>();
				for (int j = 0; j < rsColumns; j++) {
					Cell cell = readsheet.getCell(j, i);
					// System.out.println(cell.getContents());
					list.add(cell.getContents());
				}
				table.add(list);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return table;
	}

	/**
	 * 过滤
	 * 
	 * @param list
	 * @return
	 */
	public static List<String> filter(List<String> list) {
		List<String> res = new ArrayList<String>();
		for (String s : list) {
			char[] c = s.toCharArray();
			StringBuffer sb = new StringBuffer();
			for (Character cc : c) {
				if (cc <= '9' && cc >= '0') {
					// System.out.print(cc);
					sb.append(cc);
				}
			}
			res.add(sb.toString());
			// System.out.println();
		}
		return res;
	}

	public static String getInsertSql(String s, int sheet) {
		int base = getRandomNum(1000, 2000);
		return "INSERT INTO `user_vote` VALUES ('" + s + "', '" + sheet + "', '" + base + "', '1')";
	}

	public static String getRedisZADD(String key, int score, String member) {
		return "zadd" + " " + key + " " + score + " " + member;
	}

	private static int getRandomNum(Integer base, Integer rand) {
		Random random = new Random();
		return random.nextInt(rand) + base;
	}

	public static boolean isXlsFile(String fileName) {
		String[] s = fileName.split("\\.");
		return s[s.length - 1].equals("xls");
	}

}
