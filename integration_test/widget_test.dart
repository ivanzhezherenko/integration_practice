import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_practice/pages/contacts_list/contacts_list.dart';
import 'package:integration_practice/pages/home_page/widgets/home_page_body.dart';
import 'package:integration_test/integration_test.dart';
import 'package:integration_practice/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('HomePage Integration Tests', () {
    testWidgets('Test HomePage transitions and logic', (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();
      await Future.delayed(const Duration(seconds: 1));

      expect(find.byType(Scaffold), findsOneWidget);
      expect(find.byType(AppBar), findsOneWidget);
      expect(find.byType(HomePageBody), findsOneWidget);
      expect(find.text('You have pushed the button this many times:'), findsOneWidget);
      expect(find.text('0'), findsOneWidget);

      await tester.tap(find.byTooltip('Open navigation menu'));
      await tester.pumpAndSettle();
      await tester.pumpAndSettle();

      expect(find.byType(Drawer), findsOneWidget);

      await tester.dragFrom(const Offset(300, 100), const Offset(-300, 0));
      await tester.pumpAndSettle();

      final fabFinder = find.byType(FloatingActionButton);
      expect(fabFinder, findsOneWidget);

      await tester.tap(fabFinder);
      await tester.pumpAndSettle();

      expect(find.text('1'), findsOneWidget);

      await tester.tap(fabFinder);
      await tester.pumpAndSettle();

      expect(find.text('2'), findsOneWidget);

      await tester.tap(find.byTooltip('Open navigation menu'));
      await tester.pumpAndSettle();
      await tester.pumpAndSettle();

      expect(find.byType(Drawer), findsOneWidget);

      await tester.tap(find.text('List Page'));
      await tester.pumpAndSettle();
      await tester.pumpAndSettle();

      expect(find.byType(ListView), findsOneWidget);
      expect(find.byType(ContactsList), findsOneWidget);
      expect(find.text('Contacts'), findsOneWidget);

      final contactTile = find.byType(ListTile).first;
      await tester.longPress(contactTile);
      await tester.pumpAndSettle();

      expect(find.text('Імя скопійовано'), findsOneWidget);
    });
  });
}
