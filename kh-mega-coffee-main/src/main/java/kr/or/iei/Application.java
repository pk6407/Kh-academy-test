package kr.or.iei;

import kr.or.iei.controllers.Kiosk;

public class Application {

    public static void main(String[] args) {
        final Kiosk kiosk = new Kiosk();
        kiosk.run();
    }

}
