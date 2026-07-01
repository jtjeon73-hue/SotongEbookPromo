import 'package:flutter/material.dart';

import '../theme/promo_theme.dart';

enum PromoBadgeStyle {
  /// Hero 섹션 — 밝은 배경 + 진한 글자, hover 지원
  hero,

  /// 상태 라벨 — 밝은 골드 톤 배경 + 딥 네이비 글자
  status,

  /// 카테고리 태그 — 베이지 배경 + 차콜 글자
  category,

  /// 강조 라벨 — 골드 톤 배경 + 진한 글자
  accent,
}

/// 가독성을 보장하는 공통 배지/칩 위젯
class PromoBadge extends StatefulWidget {
  const PromoBadge({
    super.key,
    required this.label,
    this.style = PromoBadgeStyle.hero,
    this.fontSize,
  });

  final String label;
  final PromoBadgeStyle style;
  final double? fontSize;

  @override
  State<PromoBadge> createState() => _PromoBadgeState();
}

class _PromoBadgeState extends State<PromoBadge> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final resolvedFontSize = widget.fontSize ?? _defaultFontSize(context);
    final colors = _resolveColors();

    return MouseRegion(
      onEnter: widget.style == PromoBadgeStyle.hero
          ? (_) => setState(() => _hovered = true)
          : null,
      onExit: widget.style == PromoBadgeStyle.hero
          ? (_) => setState(() => _hovered = false)
          : null,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        decoration: BoxDecoration(
          color: colors.background,
          borderRadius: BorderRadius.circular(
            widget.style == PromoBadgeStyle.status ? 8 : 20,
          ),
          border: Border.all(color: colors.border, width: 1.2),
        ),
        child: Text(
          widget.label,
          style: TextStyle(
            color: colors.foreground,
            fontSize: resolvedFontSize,
            fontWeight: FontWeight.w600,
            height: 1.35,
            letterSpacing: 0.1,
          ),
          softWrap: true,
        ),
      ),
    );
  }

  double _defaultFontSize(BuildContext context) {
    final isNarrow = MediaQuery.sizeOf(context).width < 600;
    switch (widget.style) {
      case PromoBadgeStyle.hero:
        return isNarrow ? 13 : 14;
      case PromoBadgeStyle.status:
        return isNarrow ? 12 : 13;
      case PromoBadgeStyle.category:
        return isNarrow ? 12 : 13;
      case PromoBadgeStyle.accent:
        return isNarrow ? 12 : 13;
    }
  }

  _BadgeColors _resolveColors() {
    switch (widget.style) {
      case PromoBadgeStyle.hero:
        return _BadgeColors(
          background: _hovered
              ? PromoColors.badgeBackgroundHover
              : PromoColors.badgeBackground,
          foreground: PromoColors.badgeText,
          border: PromoColors.gold.withValues(alpha: 0.65),
        );
      case PromoBadgeStyle.status:
        return const _BadgeColors(
          background: PromoColors.badgeBackgroundAlt,
          foreground: PromoColors.badgeText,
          border: PromoColors.gold,
        );
      case PromoBadgeStyle.category:
        return const _BadgeColors(
          background: PromoColors.beige,
          foreground: PromoColors.charcoal,
          border: PromoColors.beigeDark,
        );
      case PromoBadgeStyle.accent:
        return const _BadgeColors(
          background: PromoColors.badgeBackgroundAlt,
          foreground: PromoColors.badgeTextAlt,
          border: PromoColors.gold,
        );
    }
  }
}

class _BadgeColors {
  const _BadgeColors({
    required this.background,
    required this.foreground,
    required this.border,
  });

  final Color background;
  final Color foreground;
  final Color border;
}
