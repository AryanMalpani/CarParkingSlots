import java.security.SecureRandom;

public class CouponCode{    
  public static String CreateRandomCode(int codeLength){   
     char[] chars = "abcdefghijklmnopqrstuvwxyz1234567890".toCharArray();
        StringBuilder sb = new StringBuilder();
        SecureRandom random = new SecureRandom();
        for (int i = 0; i < codeLength; i++) {
            char c = chars[random.nextInt(chars.length)];
            sb.append(c);
        }
        String output = sb.toString();
        // System.out.println(output);
        return output ;
    }
    //  System.out.println("message sent successfully");    
     //change from, password and to  
 }    
  