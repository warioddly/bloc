import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firestore_todos_api/firestore_todos_api.dart';
import 'package:flutter_services_binding/flutter_services_binding.dart';
import 'package:flutter_todos/bootstrap.dart';
import 'package:flutter_todos/firebase_options.dart';

Future<void> main() async {
  FlutterServicesBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  final todosApi = FirestoreTodosApi(firestore: FirebaseFirestore.instance);

  bootstrap(todosApi: todosApi);
}
