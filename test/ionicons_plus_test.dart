import 'package:flutter_test/flutter_test.dart';

import 'package:ionicons_plus/ionicons_plus.dart';

// Tests for ionicons_plus v0.2.3 (Ionicons v8.0.13)

void main() {
  test('Ionicons icons are defined', () {
    expect(Ionicons.add.codePoint, 0xea09);
    expect(Ionicons.add.fontFamily, 'Ionicons');
    expect(Ionicons.add.fontPackage, 'ionicons_plus');
  });

  test('ioniconsMapping contains icon entries', () {
    expect(ioniconsMapping['add'], '\u{ea09}');
    expect(ioniconsMapping.length, greaterThan(1300));
  });
}
