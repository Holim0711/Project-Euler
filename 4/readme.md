# Largest palindrome product

A palindromic number reads the same both ways. The largest palindrome made from the product of two 2-digit numbers is 9009 = 91 × 99.

Find the largest palindrome made from the product of two 3-digit numbers.

## Method

x를 5의 배수가 아닌 11의 홀수배인 수로 두고, 적절한 y를 찾는다.

1. `x * y ≡ 1 (mod 10)`을 만족하는 y의 최대값 `yₕ`을 찾는다.
2. `x * y ≡ 1 (mod m = 10^(⌊d/2⌋-1))`을 만족하는 y의 최대값 `yₘ`을 찾는다.
3. `yₘ`에서 `m`씩 빼가며 palindrome이 되는 `x * y`를 찾는다.

## Assumption

정답은 `floor(d/2)`개의 9로 시작하는 두 수의 곱이다.

- d≤20인 경우에 성립함을 확인
- 정답은 길이 2d의 palindrome이다.
- 정답은 11의 배수이다.
- 정답은 `floor(d/2) - 1`개의 9로 시작하고 끝나는 palindrome이다.
- 곱해지는 두 수는 홀수인 동시에 5의 배수가 아니다.

