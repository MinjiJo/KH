package ex18_6_Buffered_Stream;

import java.io.*;

public class BufferedInputStreamExample1 {
	public static void main(String[] args) {
		if(args.length < 1) {
			System.out.println("Arguments탭에 output1.dat 입력해 주세요");
			return;
		}
		
		BufferedInputStream in = null;
		try {
			in = new BufferedInputStream(new FileInputStream(args[0]));//파일을 연다.
			// BufferedInputStream in2 = new BufferedInputStream(
			//			new FileInputStream(args[0]), 1024);
			//두 번째 파라미터로 정수를 넘겨주면 그 크기의 버퍼가 생성된다.
			
			byte arr[] = new byte[20];//바이트 단위로 데이터를 읽기 때문에 byte형 사용
			while(true) {
				int num = in.read(arr);//파일로부터 20바이트 읽는다.
				//int java.io.FileInputStream.read(byte[] b) throws IOException
				
				if(num == -1) //읽어온 데이터가 -1이면 반복을 중단
					break;
				
				System.out.println("16진수 출력");
				// 읽어들인 바이트 데이터를 16진수로 출력한다.
				for (int cnt = 0; cnt < num; cnt++)
					System.out.printf("%02X ", arr[cnt]);
				//%02X : 2자리 16진수(%X)로 출력하되,
				//대문자(X가 대문자임)로 출력하면서 숫자가 한 자리이면 앞자리를
				//0으로 채운다.
				//%02x : 2자리 16진수(%x)로 출력하되,
				//소문자(x가 소문자임)로 출력하면서 숫자가 한 자리이면 앞자리를 0으로 채운다.
				
				System.out.println("\n\n10진수 출력");
				for (int cnt = 0; cnt < num; cnt++)
					System.out.printf("%02d ", arr[cnt]);
				
				System.out.println("\n\n8진수 출력");
				for (int cnt = 0; cnt < num; cnt++)
					System.out.printf("%02o ", arr[cnt]);
			}
		} catch (FileNotFoundException fnfe) {
			System.out.println(args[0] + " 파일이 존재하지 않습니다.");
		} catch (IOException ioe) {
			System.out.println(args[0] + " 파일을 읽을 수 없습니다.");
		} finally {
			try {
				if(in != null) in.close();// 파일을 닫습니다.
			} catch (Exception e) {
			}
		}
	}
}
