import 'package:flutter/material.dart';
import 'package:flutter_automated_test/main.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Login Tests', () {
    testWidgets('test login success', (WidgetTester tester) async {

      // Start the app
      await tester.pumpWidget(MyApp());

      // Build the widget
      await tester.pumpWidget(MaterialApp(home: LoginPage(),));

      // Find the username and password input fields
      final usernameField = find.byKey(ValueKey('email_field'));
      final passwordField = find.byKey(ValueKey('password_field'));

      // Enter valid credentials
      await tester.enterText(usernameField, 'dheeraj@gmail.com');
      await tester.enterText(passwordField, '123456');

      // Find and tap the login button
      final loginButton = find.byKey(ValueKey('login_button'));
      await tester.tap(loginButton);
      await tester.pump();

      // Expect to see the success message
      final successText = find.text('Success');
      expect(successText, findsOneWidget);
    });

    testWidgets('test login failure', (WidgetTester tester) async {
      // Build the widget
      await tester.pumpWidget(MaterialApp(home: LoginPage(),));

      // Find the username and password input fields
      final usernameField = find.byKey(ValueKey('email_field'));
      final passwordField = find.byKey(ValueKey('password_field'));

      // Enter invalid credentials
      await tester.enterText(usernameField, 'invalid@gmail.com');
      await tester.enterText(passwordField, 'invalid');

      // Find and tap the login button
      final loginButton = find.byKey(ValueKey('login_button'));
      await tester.tap(loginButton);
      await tester.pump();

      // Expect to see the failure message
      final failureText = find.text('Fail');
      expect(failureText, findsOneWidget);
    });
  });
}
