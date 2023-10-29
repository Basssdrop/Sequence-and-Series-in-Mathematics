#include <iostream>
#include <cmath>

// Function to calculate the sum of an arithmetic sequence
double sumArithmeticSequence(double firstTerm, double commonDifference, int n) {
    return n * (2 * firstTerm + (n - 1) * commonDifference) / 2;
}

// Function to calculate the sum of a geometric sequence
double sumGeometricSequence(double firstTerm, double commonRatio, int n) {
    return firstTerm * (1 - std::pow(commonRatio, n)) / (1 - commonRatio);
}

// Function to calculate the sum of a finite geometric series
double sumGeometricSeries(double firstTerm, double commonRatio, int n) {
    if (commonRatio == 1) {
        return firstTerm * n;
    } else {
        return firstTerm * (1 - std::pow(commonRatio, n)) / (1 - commonRatio);
    }
}

int main() {
    int choice;
    std::cout << "Choose an option:" << std::endl;
    std::cout << "1. Arithmetic Sequence" << std::endl;
    std::cout << "2. Geometric Sequence" << std::endl;
    std::cout << "3. Finite Geometric Series" << std::endl;
    std::cin >> choice;

    if (choice == 1) {
        double firstTerm, commonDifference;
        int n;
        std::cout << "Enter the first term, common difference, and number of terms: ";
        std::cin >> firstTerm >> commonDifference >> n;
        double sum = sumArithmeticSequence(firstTerm, commonDifference, n);
        std::cout << "Sum of the arithmetic sequence: " << sum << std::endl;
    } else if (choice == 2) {
        double firstTerm, commonRatio;
        int n;
        std::cout << "Enter the first term, common ratio, and number of terms: ";
        std::cin >> firstTerm >> commonRatio >> n;
        double sum = sumGeometricSequence(firstTerm, commonRatio, n);
        std::cout << "Sum of the geometric sequence: " << sum << std::endl;
    } else if (choice == 3) {
        double firstTerm, commonRatio;
        int n;
        std::cout << "Enter the first term, common ratio, and number of terms: ";
        std::cin >> firstTerm >> commonRatio >> n;
        double sum = sumGeometricSeries(firstTerm, commonRatio, n);
        std::cout << "Sum of the finite geometric series: " << sum << std::endl;
    } else {
        std::cout << "Invalid choice." << std::endl;
    }

    return 0;
}
