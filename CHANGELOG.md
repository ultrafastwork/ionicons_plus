## 0.2.3

### Forked

- Forked from [`ionicons`](https://pub.dev/packages/ionicons) v0.2.2 by [Ez-Connect](https://pub.dev/publishers/ez-connect.net/packages)
- **Package name changed** from `ionicons` to `ionicons_plus` (this package)
- All credits for icon assets go to the original authors

### Changed

- **Updated Flutter SDK** to `>=3.0.0 <4.0.0` (was `>=2.17.6 <3.0.0`)
- **Updated Ionicons** to v8.0.13 (was v6.0.2) - 1,357 icons total (+25 new icons)
- **Removed** deprecated `IoniconsData` class; now using standard `IconData`
- **Added** `ioniconsMapping` for dynamic icon lookup by name
- **Regenerated** all icon codepoints (now 0xeaXX–0xefXX format)
- Updated example app with working search functionality

### New Icons in v8

- `arrow_down_left_box` / `_outline` / `_sharp`
- `arrow_down_right_box` / `_outline` / `_sharp`
- `arrow_up_left_box` / `_outline` / `_sharp`
- `arrow_up_right_box` / `_outline` / `_sharp`
- Plus 15+ more icons

### Migration from `ionicons` (original)

To migrate from the original [`ionicons`](https://pub.dev/packages/ionicons) package:

1. **Update `pubspec.yaml`:**
   ```yaml
   dependencies:
     ionicons_plus: ^0.2.3  # was: ionicons: ^0.2.2
   ```

2. **Update imports:**
   ```dart
   import 'package:ionicons_plus/ionicons_plus.dart';  // was: ionicons
   ```

3. **Update icon references:**
   ```dart
   Icon(Ionicons.add)           // stays the same
   Icon(Ionicons.add_outline)   // stays the same
   Icon(Ionicons.add_sharp)     // stays the same
   
   // If you used IoniconsData (now removed):
   // Icon(IoniconsData(0xea09)) → Icon(Ionicons.add)
   ```

### Credits

- **Original Package**: [`ionicons`](https://pub.dev/packages/ionicons) v0.2.2 by Ez-Connect
- **Icons**: [Ionicons](https://ionicons.com/) v8.0.13 by Ionic Team
