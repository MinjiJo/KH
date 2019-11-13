//파이를 계산하는 스레드 클래스
package ex17_12_notify_wait;

class CalcThread extends Thread {
	SharedArea sharedArea;
	public void run() {
		double total = 0.0;
		//파이를 계산하는 부분
		for (int cnt = 1; cnt < 1000000000; cnt += 2)
			if (cnt / 2 % 2 == 0)
				total += 1.0 / cnt;
			else
				total -= 1.0 / cnt;
			
		sharedArea.result = total * 4;
		sharedArea.isReady = true;//파이 계산 모두 끝났다라는 의미
		
		synchronized (sharedArea) {
			sharedArea.notify(); //다른 스레드로 신호를 보내는 메소드
		}
	}
}
