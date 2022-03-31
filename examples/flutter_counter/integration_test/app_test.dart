import 'package:flutter/material.dart';
import 'package:flutter_counter/main_e2e.dart' as app;
import 'package:flutter_test/flutter_test.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:mocktail/mocktail.dart';

class MockStorage extends Mock implements Storage {}

void main() {
  late Storage storage;

  setUp(() {
    storage = MockStorage();
    when<dynamic>(() => storage.read(any())).thenReturn(null);
    when(() => storage.write(any(), any<dynamic>())).thenAnswer((_) async {});
  });

  testWidgets('renders correct AppBar text', (tester) async {
    await HydratedBlocOverrides.runZoned(
      app.main,
      createStorage: () => storage,
    );

    await tester.pump();

    expect(find.text('Counter'), findsOneWidget);
  });

  testWidgets('renders correct initial count', (tester) async {
    await HydratedBlocOverrides.runZoned(
      app.main,
      createStorage: () => storage,
    );

    await tester.pump();

    expect(find.text('0'), findsOneWidget);
  });

  testWidgets('tapping increment button updates the count', (tester) async {
    await HydratedBlocOverrides.runZoned(
      app.main,
      createStorage: () => storage,
    );

    await tester.pump();

    await tester.incrementCounter();
    expect(find.text('1'), findsOneWidget);

    await tester.incrementCounter();
    expect(find.text('2'), findsOneWidget);

    await tester.incrementCounter();
    expect(find.text('3'), findsOneWidget);
  });

  testWidgets('tapping decrement button updates the count', (tester) async {
    await HydratedBlocOverrides.runZoned(
      app.main,
      createStorage: () => storage,
    );

    await tester.pump();

    await tester.decrementCounter();
    expect(find.text('-1'), findsOneWidget);

    await tester.decrementCounter();
    expect(find.text('-2'), findsOneWidget);

    await tester.decrementCounter();
    expect(find.text('-3'), findsOneWidget);
  });
}

extension on WidgetTester {
  Future<void> incrementCounter() async {
    await tap(
      find.byKey(const Key('counterView_increment_floatingActionButton')),
    );
    await pump();
  }

  Future<void> decrementCounter() async {
    await tap(
      find.byKey(const Key('counterView_decrement_floatingActionButton')),
    );
    await pump();
  }
}
