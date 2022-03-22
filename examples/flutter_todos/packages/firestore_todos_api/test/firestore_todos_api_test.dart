import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:firestore_todos_api/firestore_todos_api.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';
import 'package:todos_api/todos_api.dart';

void main() {
  late FirebaseFirestore firestore;

  group(
    'FirestoreTodosApi',
    () {
      final todos = [
        Todo(
          id: '1',
          title: 'title 1',
          description: 'description 1',
        ),
        Todo(
          id: '2',
          title: 'title 2',
          description: 'description 2',
        ),
        Todo(
          id: '3',
          title: 'title 3',
          description: 'description 3',
          isCompleted: true,
        ),
      ];

      setUp(
        () {
          firestore = FakeFirebaseFirestore();

          final todosCollection = firestore.collection('todos');

          for (final todo in todos) {
            todosCollection.add(todo.toJson());
            print('added');
          }
        },
      );

      FirestoreTodosApi createSubject() {
        return FirestoreTodosApi(firestore: firestore);
      }

      group(
        'constructor',
        () {
          test('can be instantiated', () {
            expect(FirestoreTodosApi(firestore: firestore), isNotNull);
          });

          group(
            'initializes the todos stream',
            () {
              test(
                'with existing todos if present',
                () {
                  final subject = createSubject();

                  expect(subject.getTodos(), emits(todos));
                },
              );

              test(
                'succeeds with a save call',
                () async {
                  final subject = createSubject();
                  expect(
                    subject.saveTodo(
                      Todo(title: 'test', description: 'test'),
                    ),
                    completes,
                  );
                },
              );

              test('with empty list if no todos present', () {
                firestore = FakeFirebaseFirestore();

                final subject = createSubject();

                expect(subject.getTodos(), emits(const <Todo>[]));
              });
            },
          );
        },
      );
    },
  );
}
