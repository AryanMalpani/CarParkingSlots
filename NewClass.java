package Generation;

import java.util.Random;

public class NewClass {
	static char[] OTP(int n) {
		System.out.println("Generating OTP......");
		System.out.println("Your OTP is:");
		
		
		String num = "0123456789";
		Random rndm_method = new Random();
		char[] otp = new char[n];
		
		for(int i =0; i<n; i++) {
			otp[i] = num.charAt(rndm_method.nextInt(num.length()));
			
		}
		return otp;
		
		
		
		
		
	}
	public static void main(String[] args)
    {
        int length = 4;
        System.out.println(OTP(length));
    }

}
