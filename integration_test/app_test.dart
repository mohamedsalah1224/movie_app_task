import 'package:flutter/material.dart';
import 'package:integration_test/integration_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moive_app_task/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  testWidgets("Test Scroll View of List View to Find a Text no more Data",
      (widgetTester) async {
    app.main();
    await widgetTester.pumpAndSettle();
    final gesture = await widgetTester
        .startGesture(Offset(0, 300)); //Position of the scrollview
    await gesture.moveBy(Offset(0, -300)); //How much to scroll by
    await widgetTester.pump();
  });
}
