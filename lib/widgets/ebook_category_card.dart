import 'package:flutter/material.dart';

import '../models/ebook_category.dart';
import '../theme/promo_theme.dart';

class EbookCategoryCard extends StatelessWidget {
  const EbookCategoryCard({super.key, required this.category});

  final EbookCategoryItem category;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: PromoTheme.cardDecoration,
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: PromoColors.deepNavy.withValues(alpha: 0.08),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(category.icon, color: PromoColors.deepNavy, size: 24),
          ),
          const SizedBox(height: 16),
          Text(category.title, style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 8),
          Text(
            '출간 예정 · 확장 가능 영역',
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: PromoColors.gold,
              fontWeight: FontWeight.w600,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}

class BusinessDirectionCard extends StatelessWidget {
  const BusinessDirectionCard({super.key, required this.direction});

  final BusinessDirection direction;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: PromoTheme.cardDecoration,
      padding: const EdgeInsets.all(28),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      PromoColors.gold.withValues(alpha: 0.2),
                      PromoColors.gold.withValues(alpha: 0.05),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(direction.icon, color: PromoColors.deepNavy),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  direction.title,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            direction.description,
            style: Theme.of(
              context,
            ).textTheme.bodyMedium?.copyWith(height: 1.7),
          ),
        ],
      ),
    );
  }
}

class FutureIdeaCard extends StatelessWidget {
  const FutureIdeaCard({super.key, required this.idea});

  final FutureIdea idea;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: PromoTheme.cardDecoration,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
      child: Row(
        children: [
          Icon(idea.icon, color: PromoColors.gold, size: 22),
          const SizedBox(width: 14),
          Expanded(
            child: Text(
              idea.title,
              style: Theme.of(
                context,
              ).textTheme.titleMedium?.copyWith(fontSize: 15),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: PromoColors.beige,
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Text(
              '준비 중',
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w600,
                color: PromoColors.textSecondary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class BusinessConnectionCard extends StatelessWidget {
  const BusinessConnectionCard({super.key, required this.connection});

  final BusinessConnection connection;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: PromoTheme.cardDecoration,
      padding: const EdgeInsets.all(24),
      child: Row(
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: PromoColors.deepNavy.withValues(alpha: 0.08),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(connection.icon, color: PromoColors.deepNavy),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  connection.from,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 6),
                Row(
                  children: [
                    const Icon(
                      Icons.arrow_forward,
                      size: 16,
                      color: PromoColors.gold,
                    ),
                    const SizedBox(width: 6),
                    Expanded(
                      child: Text(
                        connection.to,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: PromoColors.gold,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
