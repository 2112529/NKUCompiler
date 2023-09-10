// This program demonstrates a recursive function that calculates Fibonacci numbers.
#include <iostream>
using namespace std;
#define NUM 5;

int fib(int); // Function prototype
int main()
{
    //int x=10;
    cout << "The first 10 Fibonacci numbers are: \n";
    for (int x = 0; x < 10; x++)
        cout << fib(x) << " ";
    cout << endl;
    cout<<NUM;
    cout<< fib(10);
    return 0;
}
int fib (int n)
{
    if (n <= 0) //base case
        return 0;
    else if (n == 1) //base case
        return 1;
    else
        return fib(n - 1) + fib(n - 2);
}