package code.java;

class ClaseA {

    int currentSpeed = 100;
    boolean isMoving = true;

    void applyBrakes() {
        if (isMoving)
            currentSpeed--;
    }

}
