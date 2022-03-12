import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:firestore_todos_api/firestore_todos_api.dart';
import 'package:test/test.dart';

void main() {
  late FirebaseFirestore firestore;

  setUp(
    () {
      firestore = FakeFirebaseFirestore();
    },
  );

  group('FirestoreTodosApi', () {
    test('can be instantiated', () {
      expect(FirestoreTodosApi(firestore: firestore), isNotNull);
    });
  });
}
