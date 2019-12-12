package test;

import org.apache.shiro.crypto.hash.Md5Hash;
import org.apache.shiro.util.ByteSource;

public class test1 {
    public static boolean isBlank(String str) {
        int strLen;
        if (str != null && (strLen = str.length()) != 0) {
            for(int i = 0; i < strLen; ++i) {
                if (!Character.isWhitespace(str.charAt(i))) {
                    return false;
                }
            }

            return true;
        } else {
            return true;
        }
    }


    public static void main(String[] args) {
        Md5Hash m=new Md5Hash("123456", ByteSource.Util.bytes("test001"),5);
        System.out.println(m.toString());

    }
}
