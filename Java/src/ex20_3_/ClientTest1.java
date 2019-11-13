//클라이언트 프로그램
package ex20_3_;
import java.net.*;
public class ClientTest1 {
	public static void main(String[] args) {
		System.out.println("여기는 클라이언트입니다");
		Socket socket = null;
		try {
			socket = new Socket("192.168.40.50", 9005);
			//두 개의 스레드를 생성합니다.
			Thread thread1 = new SenderThread(socket);
			Thread thread2 = new ReceiverThread(socket);
			
			//두 개의 스레드를 시작합니다.
			thread1.start();
			thread2.start();
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}
	}
}
