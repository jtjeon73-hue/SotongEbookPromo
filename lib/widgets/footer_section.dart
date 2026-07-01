import 'package:flutter/material.dart';

import '../data/sample_ebooks_data.dart';
import '../theme/promo_theme.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    final year = DateTime.now().year;
    final isNarrow = MediaQuery.sizeOf(context).width < 600;

    return Container(
      width: double.infinity,
      color: PromoColors.deepNavy,
      padding: EdgeInsets.symmetric(
        horizontal: isNarrow ? 20 : 48,
        vertical: 48,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                '소통웨어 전자책',
                style: TextStyle(
                  color: PromoColors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 6),
              const Text(
                'Sotong Ebook Lab',
                style: TextStyle(
                  color: PromoColors.goldLight,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 0.5,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'Digital Ebook / PDF Guide / AI Knowledge / Practical Notes',
                style: TextStyle(
                  color: PromoColors.beige.withValues(alpha: 0.7),
                  fontSize: 13,
                ),
              ),
              const SizedBox(height: 12),
              SelectableText(
                'Contact: $contactEmail',
                style: TextStyle(
                  color: PromoColors.beige.withValues(alpha: 0.7),
                  fontSize: 13,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Public Promo Site',
                style: TextStyle(
                  color: PromoColors.beige.withValues(alpha: 0.5),
                  fontSize: 12,
                ),
              ),
              const SizedBox(height: 24),
              Divider(color: PromoColors.white.withValues(alpha: 0.1)),
              const SizedBox(height: 16),
              Text(
                '© $year Sotongware. All rights reserved.',
                style: TextStyle(
                  color: PromoColors.beige.withValues(alpha: 0.5),
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
