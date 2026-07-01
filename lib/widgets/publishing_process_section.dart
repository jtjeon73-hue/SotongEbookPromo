import 'package:flutter/material.dart';

import '../models/publishing_step.dart';
import '../theme/promo_theme.dart';
import 'section_title.dart';

class PublishingProcessSection extends StatelessWidget {
  const PublishingProcessSection({super.key, required this.steps});

  final List<PublishingStep> steps;

  @override
  Widget build(BuildContext context) {
    return SectionContainer(
      alternate: true,
      id: 'publishing-process',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionTitle(
            title: '전자책 제작 흐름',
            subtitle: '실무 경험을 디지털 지식 상품으로 만드는 7단계 과정입니다.',
          ),
          const SizedBox(height: 40),
          LayoutBuilder(
            builder: (context, constraints) {
              final isWide = constraints.maxWidth >= 800;
              if (isWide) {
                return _buildTimeline(context);
              }
              return _buildMobileList(context);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildTimeline(BuildContext context) {
    return Column(
      children: [
        for (int i = 0; i < steps.length; i++) ...[
          _StepCard(step: steps[i], horizontal: true),
          if (i < steps.length - 1)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Row(
                children: [
                  const SizedBox(width: 36),
                  Container(
                    width: 2,
                    height: 24,
                    color: PromoColors.gold.withValues(alpha: 0.4),
                  ),
                ],
              ),
            ),
        ],
      ],
    );
  }

  Widget _buildMobileList(BuildContext context) {
    return Column(
      children: steps
          .map(
            (step) => Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: _StepCard(step: step, horizontal: false),
            ),
          )
          .toList(),
    );
  }
}

class _StepCard extends StatelessWidget {
  const _StepCard({required this.step, required this.horizontal});

  final PublishingStep step;
  final bool horizontal;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: PromoTheme.cardDecoration,
      padding: const EdgeInsets.all(24),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: PromoColors.deepNavy,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: Text(
                '${step.stepNumber}',
                style: const TextStyle(
                  color: PromoColors.gold,
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(step.icon, size: 20, color: PromoColors.gold),
                    const SizedBox(width: 8),
                    Text(
                      step.title,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  step.description,
                  style: Theme.of(
                    context,
                  ).textTheme.bodyMedium?.copyWith(height: 1.65),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
