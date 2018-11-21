
import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author mmartin
 */
public class Test {
    public static void main(String [ ] args){
        String msg = "2018-11-16-10.52.53-Dani.MSG";
        String msgRoute = "C:" + File.separator + "usersMail" + File.separator + "Dani" + File.separator + "Received" + File.separator + msg;
        
        //System.out.println(msg.substring(0, 19));
        
        //int exception = msg.length() - 4;
        
        //System.out.println(msg.substring(20, exception));
        
        
     BufferedReader reader = null;
        String msgContent = "";
        try {
            File file = new File(msgRoute);
            reader = new BufferedReader(new FileReader(file));

            String line;
            while ((line = reader.readLine()) != null) {
                msgContent += line;
            }

        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            try {
                reader.close();
                System.out.println(msgContent);
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }
}
