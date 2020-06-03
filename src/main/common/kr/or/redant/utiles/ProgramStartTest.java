package kr.or.redant.utiles;

import java.io.IOException;
import java.util.Scanner;
 
public class ProgramStartTest {
    public static void main(String[] args) throws IOException {
    	
    }
    
    public void start2() throws IOException{
    	System.out.println("start2 메서드 진입===============================");
    	ProcessBuilder qProcess = new ProcessBuilder("C:\\KiwoomHero4\\Bin\\NKStarter.exe","C:\\KiwoomHero4\\bin\\영웅문4.lnk");
		qProcess.start();
    }
    
	public void start() throws Exception {
		Scanner in = new Scanner(System.in);
        int num;
        String s;
        boolean bo = true;
        
        ProcessBuilder testProcess = new ProcessBuilder("calc.exe");
		testProcess.start();
        
		while(bo) {
    		System.out.println("===== 환 영 합 니 다 =====");
    		System.out.println("1.기 능");
    		System.out.println("2.off");
    		System.out.print(">>>> ");
    		num = in.nextInt();
    		
    		switch(num) {
    		case 1:
    			System.out.println("사용가능] : 계산기 메모장");
    			System.out.print("사용할 기능 입력 : ");
    			s = in.next();
    			if(s.equals("계산기")) {
    				ProcessBuilder oProcess = new ProcessBuilder("calc.exe");
    				oProcess.start();
    			} else if(s.equals("메모장")) {
    				ProcessBuilder oProcess = new ProcessBuilder("notepad.exe","D:\\테스트 메모장.txt");
    				oProcess.start();
    			} else if(s.equals("카카오톡")) {
    				ProcessBuilder oProcess = new ProcessBuilder("C:\\Program Files (x86)\\Kakao\\KakaoTalk\\KakaoTalk.exe","C:\\ProgramData\\Microsoft\\Windows\\Start Menu\\Programs\\카카오톡.lnk");
    				oProcess.start();
    			} else {
    				System.out.println("없는 기능 입니다.");
    			}
    			break;
    		case 2:
    			System.out.println("종료합니다.");
    			bo = false;
    			break;
    		}
    	}
		
	}
        
}