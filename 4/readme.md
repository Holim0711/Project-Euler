# Largest palindrome product

A palindromic number reads the same both ways. The largest palindrome made from the product of two 2-digit numbers is 9009 = 91 × 99.

Find the largest palindrome made from the product of two 3-digit numbers.

## Method

palindrome ![equation](https://latex.codecogs.com/gif.latex?n)을 큰 수부터 차례로 검사한다.

어떤 수 ![equation](https://latex.codecogs.com/gif.latex?\sqrt&space;n&space;\leq&space;x&space;\leq&space;10^d&space;-&space;1)에 대하여 나누어 지는 지 확인한다.

## Assumption

정답은 길이 2d의 palindrome이다.

- d가 짝수인 경우는 [9...9 0...0 0...0 9...9] = [9...9 0...1] * [9...9 9...9] 케이스가 이를 보장한다.
- d가 홀수인 경우에는 모르겠음... d=1 이면 성립하지 않긴 함...

정답은 floor(d/2)개의 9로 시작하는 두 수의 곱이다.

- d≤20인 경우에 성립하는 것처럼 보임
- d=17인 경우도 9999999887065624224265607889999999 = 99999999742880919 * 99999999127775321
