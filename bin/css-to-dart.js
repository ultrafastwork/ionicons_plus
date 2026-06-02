// Generate Dart source from CSS produced by svgtofont
// Usage: node bin/css-to-dart.js <input.css> <output.dart>

const fs = require('fs');

const kRegexCSS = /\.Ionicons-(.*?)::before\s*\{\s*content:\s*"\\(.*?)";\s*\}/g;

const args = process.argv.slice(2);
if (args.length < 2) {
  console.log('Usage: node css-to-dart.js <input.css> <output.dart>');
  process.exit(1);
}

const cssFile = args[0];
const dartFile = args[1];

const data = fs.readFileSync(cssFile, { encoding: 'utf8' });
const stream = fs.createWriteStream(dartFile);

stream.write("import 'package:flutter/widgets.dart';\n\n");
stream.write('/// Use with the Icon class to show specific icons.\n');
stream.write('/// Generated from Ionicons v8.0.13\n');
stream.write('class Ionicons {\n');

const mapping = {};
let counter = 0;
const matches = data.matchAll(kRegexCSS);

for (const match of matches) {
  const name = match[1];
  const code = match[2];
  const dartName = name.toLowerCase().replaceAll('-', '_');
  const codepoint = `0x${code}`;

  stream.write(`  /// ${name}\n`);
  stream.write(`  static const ${dartName} = IconData(${codepoint}, fontFamily: "Ionicons", fontPackage: "ionicons_flutter");\n`);

  mapping[name] = String.fromCodePoint(parseInt(code, 16));
  counter++;
}

stream.write('}\n\n');

stream.write('/// Mapping of icon names to their Unicode characters.\n');
stream.write('/// Useful for dynamic icon lookup by name.\n');
stream.write('const Map<String, String> ioniconsMapping = {\n');
for (const [name, char] of Object.entries(mapping)) {
  const hex = char.codePointAt(0).toString(16);
  stream.write(`  '${name}': '\\u{${hex}}',\n`);
}
stream.write('};\n');

stream.end();

console.log(`Written: ${dartFile}`);
console.log(`Total icons: ${counter}`);
