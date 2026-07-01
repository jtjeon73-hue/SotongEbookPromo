import 'package:flutter/material.dart';

import '../theme/promo_theme.dart';
import 'promo_badge.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({
    super.key,
    required this.badges,
    required this.onViewDirection,
    required this.onViewPortfolio,
    required this.onContact,
  });

  final List<String> badges;
  final VoidCallback onViewDirection;
  final VoidCallback onViewPortfolio;
  final VoidCallback onContact;

  @override
  Widget build(BuildContext context) {
    final isNarrow = MediaQuery.sizeOf(context).width < 700;

    return Container(
      width: double.infinity,
      decoration: PromoTheme.heroDecoration,
      child: Stack(
        children: [
          Positioned(
            right: -60,
            top: -40,
            child: Opacity(
              opacity: 0.06,
              child: Icon(
                Icons.menu_book_rounded,
                size: isNarrow ? 200 : 320,
                color: PromoColors.gold,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: isNarrow ? 20 : 48,
              vertical: isNarrow ? 64 : 96,
            ),
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 1200),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildBrandLabel(),
                    const SizedBox(height: 20),
                    Text(
                      '소통웨어 전자책',
                      style: Theme.of(context).textTheme.displayLarge?.copyWith(
                        color: PromoColors.white,
                        fontSize: isNarrow ? 34 : 48,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      '경험과 기술을 디지털 지식 상품으로 만듭니다',
                      style: Theme.of(context).textTheme.headlineMedium
                          ?.copyWith(
                            color: PromoColors.goldLight,
                            fontWeight: FontWeight.w500,
                            fontSize: isNarrow ? 18 : 22,
                          ),
                    ),
                    const SizedBox(height: 24),
                    ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 720),
                      child: Text(
                        '소통웨어 전자책은 산업자동화 실무, 앱개발 과정, AI 활용법, 농촌생활, 수익자동화 아이디어를 '
                        '전자책과 PDF 자료로 정리하여 필요한 사람에게 전달하는 지식 콘텐츠 사업입니다. '
                        '실무 경험을 정리하고, 앱·유튜브·스마트스토어와 연결되는 디지털 지식 상품을 만들어갑니다.',
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: PromoColors.beige.withValues(alpha: 0.9),
                          fontSize: isNarrow ? 15 : 16,
                          height: 1.75,
                        ),
                      ),
                    ),
                    const SizedBox(height: 32),
                    Wrap(
                      spacing: 12,
                      runSpacing: 12,
                      children: [
                        ElevatedButton(
                          onPressed: onViewDirection,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: PromoColors.gold,
                            foregroundColor: PromoColors.deepNavy,
                          ),
                          child: const Text('전자책 기획 보기'),
                        ),
                        OutlinedButton(
                          onPressed: onViewPortfolio,
                          style: OutlinedButton.styleFrom(
                            foregroundColor: PromoColors.white,
                            side: const BorderSide(color: PromoColors.gold),
                          ),
                          child: const Text('출간 예정 주제 보기'),
                        ),
                        TextButton(
                          onPressed: onContact,
                          style: TextButton.styleFrom(
                            foregroundColor: PromoColors.beige,
                          ),
                          child: const Text('문의하기 →'),
                        ),
                      ],
                    ),
                    const SizedBox(height: 40),
                    Wrap(
                      spacing: 10,
                      runSpacing: 10,
                      children: badges
                          .map(
                            (badge) => PromoBadge(
                              label: badge,
                              style: PromoBadgeStyle.hero,
                            ),
                          )
                          .toList(),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBrandLabel() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
      decoration: BoxDecoration(
        color: PromoColors.badgeBackground.withValues(alpha: 0.9),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: PromoColors.gold.withValues(alpha: 0.55)),
      ),
      child: const Text(
        'Sotong Ebook Lab',
        style: TextStyle(
          color: PromoColors.badgeText,
          fontSize: 13,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.8,
        ),
      ),
    );
  }
}
