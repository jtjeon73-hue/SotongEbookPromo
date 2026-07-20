import 'package:flutter/material.dart';

import 'router/app_router.dart';
import 'theme/promo_theme.dart';

class SotongEbookApp extends StatelessWidget {
  const SotongEbookApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: '소통웨어 전자책',
      debugShowCheckedModeBanner: false,
      theme: PromoTheme.lightTheme,
      routerConfig: appRouter,
    );
  }
}
