import 'package:flutter_test/flutter_test.dart';

import 'package:sotong_ebook_promo/app.dart';

void main() {
  testWidgets('App loads home screen', (WidgetTester tester) async {
    await tester.pumpWidget(const SotongEbookApp());
    await tester.pumpAndSettle();

    expect(find.text('소통웨어 전자책'), findsOneWidget);
    expect(find.text('경험과 기술을 디지털 지식 상품으로 만듭니다'), findsOneWidget);
  });
}
