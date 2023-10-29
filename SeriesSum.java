import java.util.Scanner;

public class SequenceSeriesSum {

    // Function to calculate the sum of an arithmetic sequence
    public static double sumArithmeticSequence(double firstTerm, double commonDifference, int n) {
        return n * (2 * firstTerm + (n - 1) * commonDifference) / 2;
    }

    // Function to calculate the sum of a geometric sequence
    public static double sumGeometricSequence(double firstTerm, double commonRatio, int n) {
        return firstTerm * (1 - Math.pow(commonRatio, n)) / (1 - commonRatio);
    }

    // Function to calculate the sum of a finite geometric series
    public static double sumGeometricSeries(double firstTerm, double commonRatio, int n) {
        if (commonRatio == 1) {
            return firstTerm * n;
        } else {
            return firstTerm * (1 - Math.pow(commonRatio, n)) / (1 - commonRatio);
        }
    }

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        System.out.println("Choose an option:");
        System.out.println("1. Arithmetic Sequence");
        System.out.println("2. Geometric Sequence");
        System.out.println("3. Finite Geometric Series");
        int choice = scanner.nextInt();

        if (choice == 1) {
            System.out.print("Enter the first term, common difference, and number of terms: ");
            double firstTerm = scanner.nextDouble();
            double commonDifference = scanner.nextDouble();
            int n = scanner.nextInt();
            double sum = sumArithmeticSequence(firstTerm, commonDifference, n);
            System.out.println("Sum of the arithmetic sequence: " + sum);
        } else if (choice == 2) {
            System.out.print("Enter the first term, common ratio, and number of terms: ");
            double firstTerm = scanner.nextDouble();
            double commonRatio = scanner.nextDouble();
            int n = scanner.nextInt();
            double sum = sumGeometricSequence(firstTerm, commonRatio, n);
            System.out.println("Sum of the geometric sequence: " + sum);
        } else if (choice == 3) {
            System.out.print("Enter the first term, common ratio, and number of terms: ");
            double firstTerm = scanner.nextDouble();
            double commonRatio = scanner.nextDouble();
            int n = scanner.nextInt();
            double sum = sumGeometricSeries(firstTerm, commonRatio, n);
            System.out.println("Sum of the finite geometric series: " + sum);
        } else {
            System.out.println("Invalid choice.");
        }

        scanner.close();
    }
}
