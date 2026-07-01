import 'package:flutter/material.dart';

import '../models/ebook_category.dart';
import '../theme/promo_theme.dart';
import 'section_title.dart';

class SalesChannelSection extends StatelessWidget {
  const SalesChannelSection({super.key, required this.channels});

  final List<SalesChannel> channels;

  @override
  Widget build(BuildContext context) {
    return SectionContainer(
      id: 'sales-channels',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionTitle(
            title: '판매와 배포 채널',
            subtitle: '출간 후 연결을 검토하는 판매·배포 채널 후보입니다.',
          ),
          const SizedBox(height: 40),
          _ResponsiveGrid(
            itemCount: channels.length,
            itemBuilder: (context, index) =>
                _ChannelCard(channel: channels[index]),
          ),
        ],
      ),
    );
  }
}

class _ChannelCard extends StatelessWidget {
  const _ChannelCard({required this.channel});

  final SalesChannel channel;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: PromoTheme.cardDecoration,
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: PromoColors.gold.withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(channel.icon, color: PromoColors.deepNavy),
          ),
          const SizedBox(height: 16),
          Text(channel.title, style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 10),
          Text(
            channel.description,
            style: Theme.of(
              context,
            ).textTheme.bodyMedium?.copyWith(height: 1.65),
          ),
        ],
      ),
    );
  }
}

class _ResponsiveGrid extends StatelessWidget {
  const _ResponsiveGrid({required this.itemCount, required this.itemBuilder});

  final int itemCount;
  final Widget Function(BuildContext context, int index) itemBuilder;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
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
          itemCount: itemCount,
          itemBuilder: itemBuilder,
        );
      },
    );
  }
}
