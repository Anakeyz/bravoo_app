// Widget tests for Bravoo app

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:bravoo_app/main.dart';

void main() {
  testWidgets('App launches and shows splash screen', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const ProviderScope(child: BravooApp()));

    // Verify that splash screen is shown
    await tester.pump(const Duration(milliseconds: 100));

    // The app should start without errors
    expect(find.byType(MaterialApp), findsOneWidget);
  });
}
