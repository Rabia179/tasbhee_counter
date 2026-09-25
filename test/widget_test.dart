import 'package:flutter_test/flutter_test.dart';
import 'package:tasbhee_counter/main.dart';

void main() {
  testWidgets('Tasbhee Counter app test', (WidgetTester tester) async {
    // Start the app
    await tester.pumpWidget(const TasbheeApp());

    // Check app title
    expect(find.text('Tasbhee Counter'), findsOneWidget);

    // Check Tasbhee name
    expect(find.text('SubhanAllah'), findsOneWidget);

    // Initial counter should be 0
    expect(find.text('0'), findsOneWidget);

    // Find COUNT button
    expect(find.text('+  COUNT'), findsOneWidget);

    // Find RESET button
    expect(find.text('RESET'), findsOneWidget);

    // Press COUNT button
    await tester.tap(find.text('+  COUNT'));
    await tester.pump();

    // Counter should become 1
    expect(find.text('1'), findsOneWidget);

    // Press COUNT again
    await tester.tap(find.text('+  COUNT'));
    await tester.pump();

    // Counter should become 2
    expect(find.text('2'), findsOneWidget);

    // Press RESET
    await tester.tap(find.text('RESET'));
    await tester.pump();

    // Counter should return to 0
    expect(find.text('0'), findsOneWidget);
  });
}