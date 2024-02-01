@OnPlatform({
  'js': Skip(),
})

import 'dart:io';

import 'package:flutter_data/flutter_data.dart';
import 'package:test/test.dart';

void main() async {
  test('local storage', () async {
    late final Directory dir;
    // TODO remove dir creation
    dir = await Directory('tmp').create();
    final storage = ObjectboxLocalStorage(
      baseDirFn: () => dir.path,
      encryptionKey: '_encryptionKey',
      clear: LocalStorageClearStrategy.always,
    );
    await storage.initialize();

    expect(() {
      return ObjectboxLocalStorage(
        baseDirFn: null,
        encryptionKey: '_encryptionKey',
        clear: LocalStorageClearStrategy.never,
      ).initialize();
    }, throwsA(isA<UnsupportedError>()));
  });
}
