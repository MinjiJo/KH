//알파벳과 숫자를 동시에 출력하는 멀티스레드 프로그램
package ex17_2_Thread_sleep;

public class MultithreadExample1 {
	public static void main(String args[]) {
		Thread thread = new DigitThread();// 쓰레드를 생성
		thread.start();
		 for (char ch = 'A'; ch <= 'Z'; ch++) {
			 System.out.print(ch);
			 try {
				 Thread.sleep(1000);
				 //sleep 메소드 : 일정 시간이 경과되기를 기다리는 메소드.
				 //public static void sleep(long millis) throws
			 } catch(InterruptedException e) {
				 System.out.println(e.getMessage());
			 }//catch end
		 }//for end
	}
}
