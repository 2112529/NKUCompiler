#include <stdio.h>
int fib(int n) {
    // base case
    if (n <= 0) return 0;
    if (n == 1) return 1;
    // 如果memo中已经计算过这个值，直接返回
    if (memo[n] != -1) return memo[n];
    // 否则，计算并存储在memo中
    memo[n] = fib(n - 1) + fib(n - 2);
    return memo[n];
}
int main() {
    cout << fib(10) << endl;
    return 0;
}