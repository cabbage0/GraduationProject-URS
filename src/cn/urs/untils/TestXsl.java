package cn.urs.untils;

import java.util.List;

public class TestXsl {
	static String path = "C:\\Users\\cabbage\\Desktop\\新生数据.xls";

	public static void main(String[] args) {
		List<List<String>> table = XslToSqlUtil.getTable(path, 0);
		System.out.println(table);
		for (List<String> list : table) {
			for (String string : list) {
				System.out.println(string);
			}
		}
	}

}
