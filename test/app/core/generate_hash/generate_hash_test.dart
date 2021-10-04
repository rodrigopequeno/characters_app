import 'package:characters_app/app/core/generate_hash/generate_hash.dart';
import 'package:crypto/crypto.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockHash extends Mock implements Hash {}

void main() {
  late GenerateHash generateHashImpl;
  late Hash mockHash;

  setUp(() {
    mockHash = MockHash();
    generateHashImpl = GenerateHashImpl(md5: mockHash);
  });

  group('GenerateHash', () {
    test(
      'should forward the call to md5.convert',
      () async {
        final bytes = [
          70,
          145,
          249,
          218,
          10,
          101,
          211,
          116,
          206,
          53,
          123,
          61,
          168,
          105,
          125,
          37,
        ];
        final timestamp = generateHashImpl.timestamp;
        final tHashConvert = Digest(bytes);
        when(() => mockHash.convert(any())).thenAnswer((_) => tHashConvert);
        final result = generateHashImpl(timestamp);
        verify(() => mockHash.convert(any()));
        expect(result, tHashConvert.toString());
      },
    );
  });
}
