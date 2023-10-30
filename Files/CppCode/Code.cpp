#include <iostream>
#include <cmath>

bool IsCorrect(double border){
    return (border <= 0.001 && border >= 0.00000001);
}

double func(double x)
{
    double answer = pow(x, 4) - pow(x, 3) - (double)2.5;
    return answer;
}

// a, b - пределы хорды, epsilon — необходимая погрешность
double findRoot(double a, double b, double epsilon) {
    while(fabs(b - a) > epsilon) {
        a = a - (b - a) * func(a) / (func(b) - func(a));
        b = b - (a - b) * func(b) / (func(a) - func(b));
    }
    // a, b — (i - 1)-й и i-й члены
    return b;
}
 
int main()
{
    std::cout.precision(16);
    double a = 1, b = 2;

    double acurr = 0.001; //1 test
    if (IsCorrect(acurr))
    {
        double answer = findRoot(a, b, acurr);
        std::cout << answer << std::endl;
    }
    else{
        std::cout << "Incorrect border!" << std::endl;
    }
    

    acurr = 0.0009; //2 test
    if (IsCorrect(acurr))
    {
        double answer = findRoot(a, b, acurr);
        std::cout << answer << std::endl;
    }
    else{
        std::cout << "Incorrect border!" << std::endl;
    }

    acurr = 0.000005; //3 test
    if (IsCorrect(acurr))
    {
        double answer = findRoot(a, b, acurr);
        std::cout << answer << std::endl;
    }
    else{
        std::cout << "Incorrect border!" << std::endl;
    }

    acurr = 0.00000002; //4 test
    if (IsCorrect(acurr))
    {
        double answer = findRoot(a, b, acurr);
        std::cout << answer << std::endl;
    }
    else{
        std::cout << "Incorrect border!" << std::endl;
    }

    acurr = 0.00000001; //5 test
    if (IsCorrect(acurr))
    {
        double answer = findRoot(a, b, acurr);
        std::cout << answer << std::endl;
    }
    else{
        std::cout << "Incorrect border!" << std::endl;
    }
    
    acurr = 0.000000009; //6 test
    if (IsCorrect(acurr))
    {
        double answer = findRoot(a, b, acurr);
        std::cout << answer << std::endl;
    }
    else{
        std::cout << "Incorrect border!" << std::endl;
    }

    return 0;
}