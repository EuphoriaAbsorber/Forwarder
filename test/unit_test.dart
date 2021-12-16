
import 'package:anyway/city_list/presentation/city_list_page.dart';
import 'package:flutter_test/flutter_test.dart';
void main() {
  test('substring', () {
    String str = 'Мск';
    expect(str.isSubsequence('Москва'), equals(true));
  }
  );
  test('substring', () {
    String str = 'Москва';
    expect(str.isSubsequence('Мск'), equals(false));
  }
  );
}