//파이를 계산하는 스레드 클래스
package ex17_6_SharedArea_Solution;

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
			
		//계산 결과를 공유 영역에 저장
		sharedArea.result = total * 4;
		
		//SharedArea 객체의 isReady 필드 값을 true로 설정
		sharedArea.isReady = true;
	}
}
