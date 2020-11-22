package kr.or.iei.ex20201120.exaplem;

import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;

public class BufferedReaderExample {

    public static void main(String[] args) {
        try (InputStream in = new FileInputStream("C:\\Users\\pc\\Desktop\\°øºÎ\\abc.txt")) {
            final InputStreamReader isr = new InputStreamReader(in);
            final BufferedReader br = new BufferedReader(isr);
            System.out.println("v: " + br.readLine());
            System.out.println("v: " + br.readLine());
            System.out.println("v: " + br.readLine());
            System.out.println("v: " + br.readLine());
            System.out.println("v: " + br.readLine());
            System.out.println("v: " + br.readLine());
            System.out.println("v: " + br.readLine());
            System.out.println("v: " + br.readLine());
            System.out.println("v: " + "".equals(br.readLine()));
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
