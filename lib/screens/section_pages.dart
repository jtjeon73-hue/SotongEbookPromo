import 'package:flutter/material.dart';

import '../data/sample_ebooks_data.dart';
import '../models/ebook_project.dart';
import '../theme/promo_theme.dart';
import '../widgets/contact_section.dart';
import '../widgets/ebook_category_card.dart';
import '../widgets/ebook_project_card.dart';
import '../widgets/footer_section.dart';
import '../widgets/monetization_section.dart';
import '../widgets/publishing_process_section.dart';
import '../widgets/sales_channel_section.dart';
import '../widgets/section_title.dart';
import '../widgets/sotong_control_hub_section.dart';

class PageScaffold extends StatelessWidget {
  const PageScaffold({super.key, required this.child, this.maxWidth = 1100});

  final Widget child;
  final double maxWidth;

  @override
  Widget build(BuildContext context) {
    return SelectionArea(
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Center(
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: maxWidth),
                child: child,
              ),
            ),
          ),
          const SliverToBoxAdapter(child: FooterSection()),
        ],
      ),
    );
  }
}

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      child: SectionContainer(
        id: 'about',
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SectionTitle(
              title: '소통전자책 소개',
              subtitle: '소통웨어가 만드는 전자책의 방향과 지식 콘텐츠 사업 소개입니다.',
            ),
            const SizedBox(height: 32),
            Text(
              '소통웨어 전자책은 산업자동화 실무, 앱개발 과정, AI 활용법, 농촌생활, 수익자동화 아이디어를 '
              '전자책과 PDF 자료로 정리하여 필요한 사람에게 전달하는 지식 콘텐츠 사업입니다.',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 36),
            _CardGrid(
              itemCount: businessDirections.length,
              minCardWidth: 320,
              itemBuilder: (context, index) =>
                  BusinessDirectionCard(direction: businessDirections[index]),
            ),
          ],
        ),
      ),
    );
  }
}

class EbooksPage extends StatelessWidget {
  const EbooksPage({super.key});

  @override
  Widget build(BuildContext context) {
    return _EbookListPage(
      title: '전체 전자책',
      subtitle: '출간 예정·기획 중인 전자책 포트폴리오 전체 목록입니다.',
      projects: sampleEbooks,
    );
  }
}

class PublishedPage extends StatelessWidget {
  const PublishedPage({super.key});

  @override
  Widget build(BuildContext context) {
    final published = sampleEbooks
        .where(
          (e) => e.statusBadge.contains('출간') && !e.statusBadge.contains('후보'),
        )
        .toList();

    if (published.isEmpty) {
      return PageScaffold(
        child: SectionContainer(
          id: 'published',
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SectionTitle(
                title: '출간 전자책',
                subtitle: '정식 출간이 완료된 전자책 목록입니다.',
              ),
              const SizedBox(height: 28),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(28),
                decoration: PromoTheme.cardDecoration,
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '현재 정식 출간 완료된 전자책은 준비 중입니다.',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: PromoColors.textPrimary,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      '지금은 출간 예정·기획 중 주제 중심으로 포트폴리오를 공개하고 있습니다. '
                      '출간 예정 메뉴에서 진행 중인 주제를 먼저 확인해 주세요.',
                      style: TextStyle(
                        fontSize: 14,
                        height: 1.65,
                        color: PromoColors.textSecondary,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    }

    return _EbookListPage(
      title: '출간 전자책',
      subtitle: '정식 출간이 완료된 전자책 목록입니다.',
      projects: published,
    );
  }
}

class UpcomingPage extends StatelessWidget {
  const UpcomingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return _EbookListPage(
      title: '출간 예정',
      subtitle: '기획 중·준비 중인 출간 예정 전자책입니다.',
      projects: sampleEbooks,
    );
  }
}

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      child: SectionContainer(
        id: 'categories',
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SectionTitle(
              title: '분야별 전자책',
              subtitle: '앞으로 전자책이 계속 추가될 수 있는 확장 가능한 카테고리입니다.',
            ),
            const SizedBox(height: 36),
            _CardGrid(
              itemCount: expandableCategories.length,
              minCardWidth: 200,
              itemBuilder: (context, index) =>
                  EbookCategoryCard(category: expandableCategories[index]),
            ),
          ],
        ),
      ),
    );
  }
}

class RecommendedPage extends StatelessWidget {
  const RecommendedPage({super.key});

  @override
  Widget build(BuildContext context) {
    final recommended = sampleEbooks
        .where(
          (e) =>
              e.statusBadge.contains('출간 후보') || e.statusBadge.contains('기획 중'),
        )
        .take(4)
        .toList();

    return _EbookListPage(
      title: '추천 전자책',
      subtitle: '먼저 살펴보면 좋은 출간 후보·기획 중 주제입니다.',
      projects: recommended.isEmpty
          ? sampleEbooks.take(3).toList()
          : recommended,
    );
  }
}

class GuidePage extends StatelessWidget {
  const GuidePage({super.key});

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      child: Column(
        children: [
          PublishingProcessSection(steps: publishingSteps),
          SalesChannelSection(channels: salesChannels),
          MonetizationSection(items: monetizationItems),
        ],
      ),
    );
  }
}

class NewsPage extends StatelessWidget {
  const NewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      child: Column(
        children: [
          SectionContainer(
            id: 'news',
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SectionTitle(
                  title: '출간 및 업데이트 소식',
                  subtitle: '앞으로 확장될 전자책·템플릿·가이드 아이디어와 사업 연결 소식입니다.',
                ),
                const SizedBox(height: 28),
                _CardGrid(
                  itemCount: futureIdeas.length,
                  minCardWidth: 280,
                  itemBuilder: (context, index) =>
                      FutureIdeaCard(idea: futureIdeas[index]),
                ),
              ],
            ),
          ),
          const SotongControlHubSection(),
        ],
      ),
    );
  }
}

class FaqPage extends StatelessWidget {
  const FaqPage({super.key});

  static const _items = [
    (
      '지금 전자책을 구매할 수 있나요?',
      '아직 판매 결제·PG는 연결하지 않은 홍보·포트폴리오 사이트입니다. 출간 예정 주제를 먼저 공개하고 있으며, 문의는 이메일로 받을 수 있습니다.',
    ),
    (
      '어떤 주제의 전자책을 준비하나요?',
      '앱개발·AI 활용, 산업자동화 실무, 수익자동화, 농촌생활, 1인 사업 구축 기록 등 실무 경험을 정리한 전자책·PDF 가이드를 준비합니다.',
    ),
    (
      '출판·협업 문의는 어디로 하면 되나요?',
      '전자책 주제 제안, PDF 자료 요청, 앱개발·AI·자동화 실무 자료 관련 문의는 sotongware@naver.com 으로 보내 주세요.',
    ),
    (
      '앱·유튜브·스마트스토어와 어떻게 연결되나요?',
      '전자책은 소통웨어 앱, 유튜브 콘텐츠, 홍보사이트, 스마트스토어/소통창고와 연결되는 지식 상품으로 확장하는 구조를 목표로 합니다.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      child: SectionContainer(
        id: 'faq',
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SectionTitle(
              title: '자주 묻는 질문',
              subtitle: '전자책 사업 방향과 문의에 대해 자주 묻는 내용을 정리했습니다.',
            ),
            const SizedBox(height: 28),
            ..._items.map(
              (item) => Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(24),
                  decoration: PromoTheme.cardDecoration,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.$1,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: PromoColors.textPrimary,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        item.$2,
                        style: const TextStyle(
                          fontSize: 14,
                          height: 1.7,
                          color: PromoColors.textSecondary,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const PageScaffold(child: ContactSection());
  }
}

class _EbookListPage extends StatelessWidget {
  const _EbookListPage({
    required this.title,
    required this.subtitle,
    required this.projects,
  });

  final String title;
  final String subtitle;
  final List<EbookProject> projects;

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      child: SectionContainer(
        alternate: true,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SectionTitle(title: title, subtitle: subtitle),
            const SizedBox(height: 36),
            _CardGrid(
              itemCount: projects.length,
              minCardWidth: 360,
              variableHeight: true,
              itemBuilder: (context, index) =>
                  EbookProjectCard(project: projects[index]),
            ),
          ],
        ),
      ),
    );
  }
}

class _CardGrid extends StatelessWidget {
  const _CardGrid({
    required this.itemCount,
    required this.minCardWidth,
    required this.itemBuilder,
    this.variableHeight = false,
  });

  final int itemCount;
  final double minCardWidth;
  final Widget Function(BuildContext context, int index) itemBuilder;
  final bool variableHeight;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final crossAxisCount = (constraints.maxWidth / minCardWidth)
            .floor()
            .clamp(1, 3);

        if (crossAxisCount == 1) {
          return Column(
            children: List.generate(
              itemCount,
              (index) => Padding(
                padding: EdgeInsets.only(
                  bottom: index < itemCount - 1 ? 20 : 0,
                ),
                child: itemBuilder(context, index),
              ),
            ),
          );
        }

        if (variableHeight) {
          const spacing = 20.0;
          final cardWidth =
              (constraints.maxWidth - (crossAxisCount - 1) * spacing) /
              crossAxisCount;
          return Wrap(
            spacing: spacing,
            runSpacing: spacing,
            children: List.generate(
              itemCount,
              (index) => SizedBox(
                width: cardWidth,
                child: itemBuilder(context, index),
              ),
            ),
          );
        }

        return GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
            childAspectRatio: minCardWidth >= 300 ? 1.4 : 1.8,
          ),
          itemCount: itemCount,
          itemBuilder: itemBuilder,
        );
      },
    );
  }
}
