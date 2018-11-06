
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.io.Writer;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 *
 * @author mique
 */
public class Test {

    public static void main(String[] args) throws IOException {

//        DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd-HH:mm");
//        Date date = new Date();
//        System.out.println(dateFormat.format(date));
//
//        //String fileName = dateFormat.format(date) + ".msg";
//        //System.out.println(fileName);
//        try (Writer writer = new BufferedWriter(new OutputStreamWriter(
//                new FileOutputStream("C:\\usersMail\\" + dateFormat.format(date) + ".msg"), "utf-8"))) {
//            writer.write("something");
//        }
        File folder = new File("C:\\usersMail\\Dani\\Received");
        File[] listOfFiles = folder.listFiles();

        for (int i = 0; i < listOfFiles.length; i++) {
            if (listOfFiles[i].isFile()) {
                System.out.println("File " + listOfFiles[i].getName());
            } else if (listOfFiles[i].isDirectory()) {
                System.out.println("Directory " + listOfFiles[i].getName());
            }
        }
    }
}
