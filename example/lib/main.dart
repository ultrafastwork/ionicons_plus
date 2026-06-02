import 'package:flutter/material.dart';

import 'package:ionicons_plus/ionicons_plus.dart';
import 'package:url_launcher/url_launcher_string.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Ionicons',
      theme: ThemeData(primarySwatch: Colors.blue),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

/// Example page
class MyHomePage extends StatelessWidget {
  final _outlineItems = ValueNotifier<List<MapEntry<String, String>>>([]);
  final _filledItems = ValueNotifier<List<MapEntry<String, String>>>([]);
  final _sharpItems = ValueNotifier<List<MapEntry<String, String>>>([]);

  MyHomePage({super.key}) {
    _onTextChanged(''); // trigger the search
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter Ionicons'),
          bottom: const TabBar(tabs: [
            Tab(text: 'Outline'),
            Tab(text: 'Filled'),
            Tab(text: 'Sharp'),
          ]),
          actions: [
            IconButton(
              onPressed: _onPressedGitHub,
              icon: const Icon(Ionicons.logo_github),
            ),
            TextButton(
              onPressed: _onPressedPub,
              child: const Text(
                'v0.2.3',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
        body: Column(
          children: [
            _ComparisonBanner(),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
              child: TextField(
                autofocus: true,
                decoration: const InputDecoration(
                  hintText: 'Search icons',
                  prefixIcon: Padding(
                    padding: EdgeInsets.only(left: 32, right: 16),
                    child: Icon(Ionicons.search_outline),
                  ),
                ),
                onChanged: _onTextChanged,
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  ValueListenableBuilder<dynamic>(
                    valueListenable: _outlineItems,
                    builder: (context, value, child) =>
                        _ItemList(items: value, variant: _Variant.outline),
                  ),
                  ValueListenableBuilder<dynamic>(
                    valueListenable: _filledItems,
                    builder: (context, value, child) =>
                        _ItemList(items: value, variant: _Variant.filled),
                  ),
                  ValueListenableBuilder<dynamic>(
                    valueListenable: _sharpItems,
                    builder: (context, value, child) =>
                        _ItemList(items: value, variant: _Variant.sharp),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Handle on search icons
  void _onTextChanged(String value) {
    final items = value.isEmpty
        ? ioniconsMapping.entries.toList()
        : ioniconsMapping.entries
            .where((e) => e.key.contains(value.toLowerCase()))
            .toList();

    _outlineItems.value =
        items.where((e) => e.key.endsWith('-outline')).toList();
    _filledItems.value = items
        .where((e) => !(e.key.endsWith('-outline') || e.key.endsWith('-sharp')))
        .toList();
    _sharpItems.value = items.where((e) => e.key.endsWith('-sharp')).toList();
  }

  /// Handle on pressed GitHub button
  void _onPressedGitHub() {
    launchUrlString('https://github.com/ultrafastwork/ionicons_plus');
  }

  /// Handle on pressed Pub button
  void _onPressedPub() {
    launchUrlString('https://pub.dev/packages/ionicons_plus');
  }
}

/// Side-by-side comparison of the same icon in all three variants
class _ComparisonBanner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.surfaceContainerHighest,
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _VariantColumn('Outline', Ionicons.alarm_outline),
          _VariantColumn('Filled', Ionicons.alarm),
          _VariantColumn('Sharp', Ionicons.alarm_sharp),
        ],
      ),
    );
  }
}

class _VariantColumn extends StatelessWidget {
  final String label;
  final IconData icon;

  const _VariantColumn(this.label, this.icon);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 48),
        const SizedBox(height: 4),
        Text(label,
            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
      ],
    );
  }
}

enum _Variant { outline, filled, sharp }

/// Render the list of icons
class _ItemList extends StatelessWidget {
  final List<MapEntry<String, String>> items;
  final _Variant variant;

  final _controller = ScrollController();

  _ItemList({required this.items, required this.variant});

  String _label(String key) {
    if (variant == _Variant.outline) return key.replaceAll('-outline', '');
    if (variant == _Variant.sharp) return key.replaceAll('-sharp', '');
    return key;
  }

  @override
  Widget build(BuildContext context) {
    return GridView.extent(
      controller: _controller,
      maxCrossAxisExtent: 86,
      childAspectRatio: 0.7,
      children: List.generate(items.length, (index) {
        final item = items[index];
        return Column(
          children: [
            Icon(
                // ignore: non_const_argument_for_const_parameter
                IconData(item.value.runes.first,
                    fontFamily: 'Ionicons', fontPackage: 'ionicons_plus'),
                size: 48),
            const SizedBox(height: 4),
            Text(
              _label(item.key),
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 10),
            ),
          ],
        );
      }),
    );
  }
}
