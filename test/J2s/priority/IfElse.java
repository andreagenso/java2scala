package code.java;

class ClaseA {

    int currentSpeed = 100;
    boolean isMoving = true;

    void applyBrakes() {
        if (isMoving){
            currentSpeed--;
        }
    }

    void applyBrakes2() {
        if (isMoving) {
            currentSpeed--;
        } else {
            System.err.println("The bicycle has already stopped!");
        }
    }

    public void edad() {
        int age=20;
        if(age>18 +2){
            System.out.print("Age is greater than 18");
        }

        if(age%18 == 0){
            System.out.print("Age is greater than 18");
        }
    }
}

class IfElseDemo {
    public void main(String[] args) {

        int testscore = 76;
        char grade;

        if (testscore >= 90) {
            grade = 'A';
        } else if (testscore >= 80) {
            grade = 'B';
        } else if (testscore >= 70) {
            grade = 'C';
        } else if (testscore >= 60) {
            grade = 'D';
        } else {
            grade = 'F';
        }
        System.out.println("Grade = " + grade);
    }
}

class WhileDemo {
    public void main(String[] args) {
        int count = 1;
        while (count < 11) {
            System.out.println("Count is: " + count);
            count++;
        }
    }
}

class DoWhileDemo {
    public static void main(String[] args){
        int count = 1;
        do {
            System.out.println("Count is: " + count);
            count++;
        } while (count < 11);
    }
}
