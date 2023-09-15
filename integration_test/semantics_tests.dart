// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:semantics_widget/main.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  WidgetsFlutterBinding.ensureInitialized();

  // Verify that the 'Account' icon semantics are correctly set
  testWidgets('Account icon semantics are correct', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Test label
    expect(
      tester.getSemantics(find.byIcon(CupertinoIcons.person)).label,
      'Account',
    );

    // Test on tap hint
    expect(
      tester.getSemantics(find.byIcon(CupertinoIcons.person)),
      matchesSemantics(
        onTapHint: 'Tap to view account page',
      ),
    );
  });

  // Verify that the 'Explore' text semantics are correctly set
  testWidgets('Explore text semantics are correct', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Test label
    expect(
      tester.getSemantics(find.text('Explore')).label,
      'Explore available cakes',
    );
  });
}
