// ignore_for_file: prefer_const_constructors
import 'package:firestore_todos_api/firestore_todos_api.dart';
import 'package:test/test.dart';

void main() {
  group('FirestoreTodosApi', () {
    test('can be instantiated', () {
      expect(FirestoreTodosApi(), isNotNull);
    });
  });
}
