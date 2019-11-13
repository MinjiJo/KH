package ex9_4_downcasting_error;
class Account {	//컴파일러가 extends Object를 추가합니다.
	String accountNo; // 계좌번호
	String ownerName; // 예금주 이름
	int balance; 	  // 잔액
	
	Account(String accountNo, String ownerName, int balance){ //생성자
		this.accountNo = accountNo;
		this.ownerName = ownerName;
		this.balance = balance;
	}

	void deposit(int amount) {
		balance += amount;
	}
	
	int withdraw(int amount) throws Exception{ // 인출한다
		if (balance < amount)
			throw new Exception("잔액이 부족합니다."); 
		balance -= amount;
		return amount;
	}
}
