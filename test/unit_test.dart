import 'package:anyway/city_list/presentation/city_list_page.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:models/models.dart';

void main() {
  test('check search: func isSubsequence', () {
    const str1 = 'Мск';
    expect(str1.isSubsequence('Москва'), equals(true));
    const str2 = 'Москва';
    expect(str2.isSubsequence('Мск'), equals(false));
  }
  );

  test('check filter: func check', () {
    final filter = Filter(
        price: 0,
        sea: 1,
        mountains: 0,
        culture: 1,
        architecture: 1,
        shopping: 0,
        entertainment: 0,
        nature: 1);

    final key1 = Filter(
        price: 0,
        sea: 1,
        mountains: 0,
        culture: 1,
        architecture: 0,
        shopping: 0,
        entertainment: 0,
        nature: 1);

    expect(check(key1, filter), equals(true));

    final key2 =  Filter(
        price: 1,
        sea: 0,
        mountains: 0,
        culture: 1,
        architecture: 0,
        shopping: 0,
        entertainment: 0,
        nature: 1);

    expect(check(key2, filter), equals(false));
  }
  );
}