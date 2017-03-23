package code.java;

class WhileDemo {
    public void main(String[] args) {

        int count = 1;
        while (count < 11) {
            System.out.println("Count is: " + count);
            count++;
        }

        boolean shouldContinue = true;
        while(shouldContinue == true) {

            System.out.println("running");

            double random = Math.random() * 10D;

            if(random > 5) {
                shouldContinue = true;
            } else {
                shouldContinue = false;
            }

        }
    }
}