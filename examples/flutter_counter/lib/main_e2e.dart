import 'package:flutter/widgets.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

import 'app.dart';

void main() => runApp(const CounterApp());

/// In memory hydrated storage impl.
class InMemoryHydratedStorage extends Storage {
  final _storage = <String, dynamic>{};

  @override
  Future<void> clear() async {
    _storage.clear();
  }

  @override
  Future<void> delete(String key) async {
    _storage.remove(key);
  }

  @override
  dynamic read(String key) {
    return _storage[key];
  }

  @override
  Future<void> write(String key, dynamic value) async {
    _storage[key] = value;
  }
}
