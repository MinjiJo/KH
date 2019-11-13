package ex11_5_Calendar;

import java.util.Calendar;
import java.util.GregorianCalendar;

public class Today {
	private Calendar c1 = Calendar.getInstance();
	
	public Today() {}
	
	public Today(GregorianCalendar c1) {
		this.c1=c1;
	}

	public String toString(){
		String yo[] = {"일요일", "월요일", "화요일", "수요일", "목요일", "금요일", "토요일"};
		String ampm[] = {"오전", "오후"};
		
		int y = c1.get(Calendar.YEAR);
		int m = c1.get(Calendar.MONTH)+1;//월이 0부터 11까지 구해져서 1을 더해야 한다.
		int d = c1.get(Calendar.DATE);
		int h1 = c1.get(Calendar.HOUR);//12시간
		int mm = c1.get(Calendar.MINUTE);//오전 : 0, 오후 : 1
		int ap = c1.get(Calendar.AM_PM);
		int s = c1.get(Calendar.SECOND);
		int yoil = c1.get(Calendar.DAY_OF_WEEK);//일요일:1, 월요일:2, 화요일:3, 수요일:4, 목요일:5, 금요일:6, 토요일:7
	
		return y + "년 " + m + "월 " + d + "일 " + ampm[ap]+h1 + ":" + mm + ":" + s + " " + yo[yoil-1] + "입니다.";
	}
}
