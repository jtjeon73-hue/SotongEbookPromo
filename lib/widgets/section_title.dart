import 'package:flutter/material.dart';

import '../theme/promo_theme.dart';

class SectionTitle extends StatelessWidget {
  const SectionTitle({
    super.key,
    required this.title,
    this.subtitle,
    this.light = false,
  });

  final String title;
  final String? subtitle;
  final bool light;

  @override
  Widget build(BuildContext context) {
    final titleColor = light ? PromoColors.white : PromoColors.textPrimary;
    final subtitleColor = light
        ? PromoColors.beige.withValues(alpha: 0.85)
        : PromoColors.textSecondary;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 48,
          height: 3,
          decoration: BoxDecoration(
            color: PromoColors.gold,
            borderRadius: BorderRadius.circular(2),
          ),
        ),
        const SizedBox(height: 16),
        Text(
          title,
          style: Theme.of(context).textTheme.headlineLarge?.copyWith(
            color: titleColor,
            fontSize: _titleSize(context),
          ),
        ),
        if (subtitle != null) ...[
          const SizedBox(height: 12),
          Text(
            subtitle!,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: subtitleColor,
              fontSize: _subtitleSize(context),
            ),
          ),
        ],
      ],
    );
  }

  double _titleSize(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    if (width < 600) return 26;
    if (width < 900) return 30;
    return 32;
  }

  double _subtitleSize(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    return width < 600 ? 15 : 16;
  }
}

class SectionContainer extends StatelessWidget {
  const SectionContainer({
    super.key,
    required this.child,
    this.alternate = false,
    this.id,
  });

  final Widget child;
  final bool alternate;
  final String? id;

  @override
  Widget build(BuildContext context) {
    return Container(
      key: id != null ? Key(id!) : null,
      width: double.infinity,
      decoration: alternate
          ? PromoTheme.alternateSectionDecoration
          : PromoTheme.sectionDecoration,
      padding: EdgeInsets.symmetric(
        horizontal: _horizontalPadding(context),
        vertical: _verticalPadding(context),
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: child,
        ),
      ),
    );
  }

  double _horizontalPadding(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    if (width < 600) return 20;
    if (width < 900) return 40;
    return 48;
  }

  double _verticalPadding(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    return width < 600 ? 56 : 80;
  }
}
