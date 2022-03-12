import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todos_api/todos_api.dart';

/// {@template firestore_todos_api}
/// Firestore implementation for the Todos example
/// {@endtemplate}
class FirestoreTodosApi implements TodosApi {
  /// {@macro firestore_todos_api}
  FirestoreTodosApi({
    required FirebaseFirestore firestore,
  }) : _firestore = firestore;

  final FirebaseFirestore _firestore;

  @override
  Future<int> clearCompleted() {
    // TODO: implement clearCompleted
    throw UnimplementedError();
  }

  @override
  Future<int> completeAll({required bool isCompleted}) {
    // TODO: implement completeAll
    throw UnimplementedError();
  }

  @override
  Future<void> deleteTodo(String id) {
    // TODO: implement deleteTodo
    throw UnimplementedError();
  }

  @override
  Stream<List<Todo>> getTodos() {
    // TODO: implement getTodos
    throw UnimplementedError();
  }

  @override
  Future<void> saveTodo(Todo todo) {
    // TODO: implement saveTodo
    throw UnimplementedError();
  }
}
