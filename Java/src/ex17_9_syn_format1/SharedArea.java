package ex17_9_syn_format1;

public class SharedArea {
	Account account1;
	Account account2;
	
	void transfer() {	//계좌 이체를 한다
		synchronized (this) {	//this:동기화할 객체가 자기 자신입니다.
			account1.withdraw(1000000);
			account2.deposit(1000000);
		}//동기화 끝
	}//transfer() end
	
	int getTotal() {	//잔액 합계를 구한다
		synchronized (this) {
			return account1.balance + account2.balance;
		}//동기화 끝
	}//getTotal() end
}

