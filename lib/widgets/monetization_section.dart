import 'package:flutter/material.dart';

import '../models/ebook_category.dart';
import '../theme/promo_theme.dart';
import 'section_title.dart';

class MonetizationSection extends StatelessWidget {
  const MonetizationSection({super.key, required this.items});

  final List<MonetizationItem> items;

  @override
  Widget build(BuildContext context) {
    return SectionContainer(
      alternate: true,
      id: 'monetization',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionTitle(
            title: '전자책 수익화 방향',
            subtitle: '전자책을 중심으로 확장 가능한 수익화 방향을 정리합니다.',
          ),
          const SizedBox(height: 40),
          LayoutBuilder(
            builder: (context, constraints) {
              final crossAxisCount = constraints.maxWidth >= 900
                  ? 3
                  : constraints.maxWidth >= 600
                  ? 2
                  : 1;

              return GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                  childAspectRatio: crossAxisCount == 1 ? 2.2 : 1.15,
                ),
                itemCount: items.length,
                itemBuilder: (context, index) =>
                    _MonetizationCard(item: items[index]),
              );
            },
          ),
        ],
      ),
    );
  }
}

class _MonetizationCard extends StatelessWidget {
  const _MonetizationCard({required this.item});

  final MonetizationItem item;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: PromoTheme.cardDecoration,
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(item.icon, color: PromoColors.gold, size: 24),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  item.title,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            item.description,
            style: Theme.of(
              context,
            ).textTheme.bodyMedium?.copyWith(height: 1.65),
          ),
        ],
      ),
    );
  }
}
