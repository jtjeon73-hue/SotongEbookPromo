import 'package:flutter/material.dart';

import '../models/nav_destination.dart';
import '../theme/promo_theme.dart';

class SideNavMenu extends StatelessWidget {
  const SideNavMenu({
    super.key,
    required this.selectedPath,
    required this.onSelect,
    this.compactHeader = false,
  });

  final String selectedPath;
  final ValueChanged<String> onSelect;
  final bool compactHeader;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: PromoColors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _BrandHeader(compact: compactHeader),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.fromLTRB(12, 8, 12, 24),
              itemCount: appDestinations.length,
              itemBuilder: (context, index) {
                final item = appDestinations[index];
                final selected = _isSelected(selectedPath, item.path);
                return Padding(
                  padding: const EdgeInsets.only(bottom: 4),
                  child: Material(
                    color: selected
                        ? PromoColors.badgeBackgroundAlt
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(12),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(12),
                      hoverColor: PromoColors.badgeBackground,
                      onTap: () => onSelect(item.path),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 12,
                        ),
                        child: Row(
                          children: [
                            Icon(
                              selected ? item.selectedIcon : item.icon,
                              size: 22,
                              color: selected
                                  ? PromoColors.deepNavy
                                  : PromoColors.textSecondary,
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Text(
                                item.label,
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: selected
                                      ? FontWeight.w700
                                      : FontWeight.w500,
                                  color: selected
                                      ? PromoColors.badgeText
                                      : PromoColors.textPrimary,
                                  height: 1.3,
                                ),
                              ),
                            ),
                            if (selected)
                              Container(
                                width: 6,
                                height: 6,
                                decoration: const BoxDecoration(
                                  color: PromoColors.gold,
                                  shape: BoxShape.circle,
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 20),
            child: Text(
              'Sotong Ebook Lab',
              style: TextStyle(
                fontSize: 12,
                color: PromoColors.textSecondary.withValues(alpha: 0.8),
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }

  bool _isSelected(String current, String path) {
    if (path == '/') return current == '/' || current.isEmpty;
    return current == path || current.startsWith('$path/');
  }
}

class _BrandHeader extends StatelessWidget {
  const _BrandHeader({required this.compact});

  final bool compact;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.fromLTRB(20, compact ? 20 : 28, 20, 20),
      decoration: const BoxDecoration(
        color: PromoColors.deepNavy,
        border: Border(bottom: BorderSide(color: PromoColors.gold, width: 2)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: PromoColors.gold.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: PromoColors.gold.withValues(alpha: 0.5),
                  ),
                ),
                child: const Icon(
                  Icons.menu_book_rounded,
                  color: PromoColors.goldLight,
                  size: 22,
                ),
              ),
              const SizedBox(width: 12),
              const Expanded(
                child: Text(
                  '소통전자책',
                  style: TextStyle(
                    color: PromoColors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            '경험과 기술을 디지털 지식 상품으로 정리하는 전자책 포트폴리오 허브',
            style: TextStyle(
              color: PromoColors.beige.withValues(alpha: 0.9),
              fontSize: 12.5,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}
