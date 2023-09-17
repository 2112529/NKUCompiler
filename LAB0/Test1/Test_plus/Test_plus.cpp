#include <iostream>
#include <vector>
using namespace std;
// 使用vector作为备忘录，初始化为-1代表未计算过
vector<int> memo(100, -1);  // 这里的大小100是假设的最大值，根据需要可以调整
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
    cout << "The first 10 Fibonacci numbers are: \n";
    for (int x = 0; x < 10; x++)
        cout << fib(x) << " ";
    cout << endl;
    cout << fib(10) << endl;
    return 0;
}