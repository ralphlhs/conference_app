import 'dart:math';

class Contry {
  String nationality;

  Contry(this.nationality);
}

class Trader {
  String name;
  String city;
  Contry country;

  Trader(this.name, this.city, this.country);
}

class Transaction {
  Trader trader;
  int year;
  int value;

  Transaction(this.trader, this.year, this.value);
}

final transactions = [
  Transaction(Trader("Brian", "Cambridge", Contry("England")), 2011, 300),
  Transaction(Trader("Raoul", "Cambridge", Contry("United State")), 2012, 1000),
  Transaction(Trader("Raoul", "Cambridge", Contry("England")), 2011, 400),
  Transaction(Trader("Mario", "Milan", Contry("Italy")), 2012, 710),
  Transaction(Trader("Mario", "Milan", Contry("Italy")), 2012, 700),
  Transaction(Trader("Alan", "Cambridge", Contry("United State")), 2012, 950),
];

void main() {
// 1. 2011년에 일어난 모든 트랜잭션을 찾아 값을 오름차순으로 정리하여 나열하시오
  print("1 ==================================================");
  (transactions
        ..sort((Transaction a, Transaction b) => -a.value.compareTo(b.value)))
      .where((Transaction e) => e.year == 2011)
      .forEach((Transaction element) {
    print(element.value);
  });
// 2. 거래자가 근무하는 모든 도시를 중복 없이 나열하시오
  print("2 ==================================================");
  transactions.map((e) => e.trader.city).toSet().forEach((element) {
    print(element);
  });
// 3. 케임브리지에서 근무하는 모든 거래자를 찾아서 이름순으로 정렬하여 나열하시오
  print("3 ==================================================");
  transactions.map((e) => e.trader.name).forEach(print);
// 4. 모든 거래자의 이름을 알파벳순으로 정렬하여 나열하시오
  print("4 ==================================================");
  (transactions.map((e) => e.trader.name).toList()..sort()).forEach(print);
// 5. 밀라노에 거래자가 있는가?
  print("5 ==================================================");
  print(transactions.any((element) => element.trader.city == "Milan"));
// 6. 케임브리지에 거주하는 거래자의 모든 트랙잭션값을 출력하시오
  print("6 ==================================================");
  transactions
      .where((e) => e.trader.city == "Cambridge")
      .forEach((e) => print(e.trader.name + "의 트랜젝션은 ${e.value}입니다."));
// 7. 전체 트랜잭션 중 최대값을 얼마인가?
  print("7 ==================================================");
  print("트랜젝션 최대값은 " +
      "${transactions.map((e) => e.value).reduce((value, element) => max(value, element))}");
// 8. 전체 트랜잭션 중 최소값은 얼마인가?
  print("8 ==================================================");
  print("트랜젝션 최소값은 " +
      "${transactions.map((e) => e.value).reduce((value, element) => min(value, element))}");
// 9. 영국 케임브리지에 거주하는 거래자의 모든 트랙잭션값을 출력하시오
  print("9 ==================================================");
  transactions
      .where((e) => e.trader.city == "Cambridge")
      .where((e) => e.trader.country.nationality == "England")
      .forEach((e) => print(e.trader.name +
          "의 국적은 ${e.trader.country.nationality}, " +
          "그리고 트랜젝션은 ${e.value}입니다."));
}
