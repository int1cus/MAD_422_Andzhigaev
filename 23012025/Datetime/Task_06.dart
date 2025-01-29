/*
6. Расчет времени выполнения метода
Задача: Реализуйте метод, который измеряет время выполнения другого метода
(например, цикла из 1 миллиона итераций).
*/

void main()
{
  print("Время выполнения: ${measure(() => findPrimes(1000000))} мс");
}

int measure(Function function)
{
  Stopwatch stopwatch = new Stopwatch()..start();

  function();

  stopwatch.stop();
  return stopwatch.elapsedMilliseconds;
}

bool isPrime(int num) {
  if (num < 2) return false;
  for (int i = 2; i * i <= num; i++) {
    if (num % i == 0) return false;
  }
  return true;
}

List<int> findPrimes(int n) {
  List<int> primes = [];
  for (int i = 2; i <= n; i++) {
    if (isPrime(i)) primes.add(i);
  }
  return primes;
}