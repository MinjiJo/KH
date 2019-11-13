package ex19_3_Serialization_interface;
import java.io.*;
public class ObjectOutputExample2 {
	public static void main(String args[]) {
		ObjectOutputStream out = null;
		try {
			out = new ObjectOutputStream(new FileOutputStream("output2.dat"));
			out.writeObject(new GoodsStock("70101", 100));
			out.writeObject(new GoodsStock("70102", 50));
			out.writeObject(new GoodsStock("70103", 200));
		} catch (IOException ioe) {
			ioe.printStackTrace();
			System.out.println("파일로 출력할 수 없습니다.");
		} finally {
			try {
				out.close();
			} catch (Exception e) {
				System.out.println("파일 닫는 중 오류입니다.");
			}
		} // finally end
	}// main end
}// class end
