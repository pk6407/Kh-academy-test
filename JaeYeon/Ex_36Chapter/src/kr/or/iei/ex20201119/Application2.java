package kr.or.iei.ex20201119;

import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;

public class Application2 {

    public static void main(String[] args) throws InterruptedException {
        try (
                final FileInputStream fis =
                        new FileInputStream("C:\\Users\\user1\\Desktop\\dog.png");
                final FileOutputStream fos =
                        new FileOutputStream("C:\\Users\\user1\\Desktop\\dog_copied.png");
        ) {
            // fis - 읽을 파일
            final byte[] buffer = new byte[4096];
            int result;     // 읽은 바이트 수
            while ((result = fis.read(buffer)) != -1) {
                // fos - 쓸 파일
                fos.write(buffer);
                System.out.println("읽은 바이트 수: " + result);
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
