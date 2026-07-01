import 'package:flutter/material.dart';

import '../models/ebook_project.dart';
import '../theme/promo_theme.dart';
import 'promo_badge.dart';

class EbookProjectCard extends StatelessWidget {
  const EbookProjectCard({super.key, required this.project});

  final EbookProject project;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: PromoTheme.cardDecoration,
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _BookCoverHeader(project: project),
          Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Wrap(
                  spacing: 6,
                  runSpacing: 6,
                  children: project.categories
                      .map(
                        (cat) => PromoBadge(
                          label: cat,
                          style: PromoBadgeStyle.category,
                        ),
                      )
                      .toList(),
                ),
                const SizedBox(height: 14),
                Text(
                  project.title,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 10),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    PromoBadge(
                      label: project.statusBadge,
                      style: PromoBadgeStyle.status,
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        '현재 단계: ${project.stage}',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: PromoColors.textSecondary,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 14),
                Text(
                  project.description,
                  style: Theme.of(
                    context,
                  ).textTheme.bodyMedium?.copyWith(height: 1.7),
                ),
                const SizedBox(height: 20),
                _InfoBlock(title: '주요 목차 후보', items: project.outlineCandidates),
                const SizedBox(height: 16),
                _InfoRow(title: '예상 독자', content: project.targetReaders),
                const SizedBox(height: 12),
                _InfoRow(title: '활용 방향', content: project.usageDirection),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _BookCoverHeader extends StatelessWidget {
  const _BookCoverHeader({required this.project});

  final EbookProject project;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(28),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [PromoColors.deepNavy, PromoColors.charcoal],
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 56,
            height: 72,
            decoration: BoxDecoration(
              color: PromoColors.gold.withValues(alpha: 0.2),
              borderRadius: BorderRadius.circular(6),
              border: Border.all(
                color: PromoColors.gold.withValues(alpha: 0.5),
              ),
            ),
            child: const Icon(
              Icons.menu_book_rounded,
              color: PromoColors.goldLight,
              size: 28,
            ),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  '출간 예정',
                  style: TextStyle(
                    color: PromoColors.goldLight,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  project.title,
                  style: const TextStyle(
                    color: PromoColors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    height: 1.35,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _InfoBlock extends StatelessWidget {
  const _InfoBlock({required this.title, required this.items});

  final String title;
  final List<String> items;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(
            context,
          ).textTheme.labelLarge?.copyWith(color: PromoColors.deepNavy),
        ),
        const SizedBox(height: 8),
        ...items.map(
          (item) => Padding(
            padding: const EdgeInsets.only(bottom: 4),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('· ', style: TextStyle(color: PromoColors.gold)),
                Expanded(
                  child: Text(
                    item,
                    style: Theme.of(
                      context,
                    ).textTheme.bodySmall?.copyWith(height: 1.5),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _InfoRow extends StatelessWidget {
  const _InfoRow({required this.title, required this.content});

  final String title;
  final String content;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: Theme.of(context).textTheme.labelLarge),
        const SizedBox(height: 4),
        Text(
          content,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(height: 1.6),
        ),
      ],
    );
  }
}
