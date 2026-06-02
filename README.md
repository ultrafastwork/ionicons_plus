# Ionicons Flutter

![](https://img.shields.io/pub/v/ionicons_plus)
![](https://img.shields.io/github/license/ez-connect/flutter-ionicons)
![](https://img.shields.io/github/issues/ez-connect/flutter-ionicons)

This package includes 1357 icons of [Ionicons](https://ionicons.com/) [v8.0.13](https://github.com/ionic-team/ionicons/releases/tag/v8.0.13). The naming convention is the same as the CSS names, all dashes replaced with underscores.

This package is maintained at [ultrafastwork](https://github.com/ultrafastwork/).

## Usage

There're outline, filled, sharp [icons](https://ionicons.com/).

```dart
import 'package:ionicons_plus/ionicons_plus.dart';

...

Icon(Ionicons.add)
Icon(Ionicons.add_outline)
Icon(Ionicons.add_sharp)
```

## Migration from `ionicons` (original package)

If you're switching from the original [`ionicons`](https://pub.dev/packages/ionicons) package:

### 1. Update `pubspec.yaml`

```yaml
dependencies:
  ionicons_plus: ^0.2.3  # was: ionicons: ^0.2.2
```

### 2. Update imports

```dart
import 'package:ionicons_plus/ionicons_plus.dart';  // was: ionicons
```

### 3. Update icon references

Most icons stay the same:

```dart
Icon(Ionicons.add)           // No change
Icon(Ionicons.add_outline)   // No change
Icon(Ionicons.add_sharp)     // No change
```

**If you used `IoniconsData` (now removed):**
```dart
// Old (removed):
Icon(IoniconsData(0xea09))

// New:
Icon(Ionicons.add)           // Recommended
Icon(IconData(0xf109))        // Or use new codepoint
```

### Breaking Changes from Original

| Change | From (original) | To (this package) |
|--------|----------------|-------------------|
| Package name | `ionicons` | `ionicons_plus` |
| Flutter SDK | `>=2.17.6` | `>=3.0.0` |
| Ionicons version | v6.0.2 | v8.0.13 |
| Icon count | 1,332 | 1,357 |
| Codepoints | `0xeaXX` | `0xeaXX–0xefXX` |
| `IoniconsData` class | Available | **Removed** - use `IconData` |

## Dynamic Icon Lookup

For dynamic icon resolution by name, use the `ioniconsMapping`:

```dart
import 'package:ionicons_plus/ionicons_plus.dart';

// Get icon by name
String iconName = 'add';
String? codepoint = ioniconsMapping[iconName]; // Returns '\u{ea09}'

// Search icons
final results = ioniconsMapping.entries
    .where((e) => e.key.contains('search_term'))
    .toList();
```

## Example

See the `example/` folder for a demo app that lets you browse and search all icons.

To run the example:
```bash
cd example
flutter pub get
flutter run
```

## Credits

This package is a fork of the original [`ionicons`](https://pub.dev/packages/ionicons) package by [Ez-Connect](https://pub.dev/publishers/ez-connect.net/packages).

All icon assets and the original implementation are credited to:
- **Publisher**: [ez-connect.net](https://pub.dev/publishers/ez-connect.net/packages)
- **Original Package**: [`ionicons`](https://pub.dev/packages/ionicons)
- **GitHub**: [ez-connect/flutter-ionicons](https://github.com/ez-connect/flutter-ionicons)
- **Community**: Thanks to all contributors to the original package

The icons are from [Ionicons](https://ionicons.com/) by Ionic Team.
