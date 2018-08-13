package cn.urs.untils;

public class Test {
	public static void main(String[] args) {
		
//		String str = "142327199607256636";
//		String subStr = str.substring(6, 10)+"-"+str.substring(10,12)+"-"+str.substring(12,14);
//		System.out.println(subStr);
//		String fileName = "zzzy";
//		System.out.println(isXlsFile(fileName));
		
		
	}
	
	private static boolean isXlsFile(String fileName){
		String[] s = fileName.split("\\.");
		return s[s.length-1].equals("xls");
	}
}
