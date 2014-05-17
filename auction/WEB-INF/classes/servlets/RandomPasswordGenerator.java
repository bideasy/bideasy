import java.util.Random;
 
public class RandomPasswordGenerator 
{
    private static final String ALPHA_CAPS  = "ABCDEFGHJKMNPQRSTUVWXYZ";
    private static final String ALPHA   = "abcdefghjkmnpqrstuvwxyz";
    private static final String NUM= "123456789";
    private static final String SPL_CHARS   = "^&*_=+-/!@#$%";
   static char[] pswd;
    public static char[] generatePswd() 
    {
         int minLen=11;
	 int maxLen=20;
	 
        Random rnd = new Random();
        int len = rnd.nextInt(maxLen - minLen + 1) + minLen;
       pswd = new char[len];
        int index = 0;
        for (int i = 0; i <1; i++) {
            index = getNextIndex(rnd, len, pswd);
            pswd[index] = ALPHA_CAPS.charAt(rnd.nextInt(ALPHA_CAPS.length()));
        }
        for (int i = 0; i < 2;i++) {
            index = getNextIndex(rnd, len, pswd);
            pswd[index] = NUM.charAt(rnd.nextInt(NUM.length()));
        }
        for (int i = 0; i < 3; i++) {
            index = getNextIndex(rnd, len, pswd);
            pswd[index] = SPL_CHARS.charAt(rnd.nextInt(SPL_CHARS.length()));
        }
        for(int i = 0; i < len; i++) {
            if(pswd[i] == 0) {
                pswd[i] = ALPHA.charAt(rnd.nextInt(ALPHA.length()));
            }
        }
        return pswd;
    }
 
    private static int getNextIndex(Random rnd, int len, char[] pswd) {
        int index = rnd.nextInt(len);
        while(pswd[index = rnd.nextInt(len)] != 0);
        return index;
    }
}