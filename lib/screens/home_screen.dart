import 'package:flutter/material.dart';

import '../data/sample_ebooks_data.dart';
import '../widgets/contact_section.dart';
import '../widgets/footer_section.dart';
import '../widgets/sotong_control_hub_section.dart';
import '../widgets/ebook_category_card.dart';
import '../widgets/ebook_project_card.dart';
import '../widgets/hero_section.dart';
import '../widgets/monetization_section.dart';
import '../widgets/publishing_process_section.dart';
import '../widgets/sales_channel_section.dart';
import '../widgets/section_title.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController _scrollController = ScrollController();
  final GlobalKey _directionKey = GlobalKey();
  final GlobalKey _portfolioKey = GlobalKey();
  final GlobalKey _hubKey = GlobalKey();
  final GlobalKey _contactKey = GlobalKey();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  Future<void> _scrollTo(GlobalKey key) async {
    final context = key.currentContext;
    if (context == null) return;
    await Scrollable.ensureVisible(
      context,
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeInOut,
      alignment: 0.05,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SelectionArea(
        child: CustomScrollView(
          controller: _scrollController,
          slivers: [
            SliverToBoxAdapter(
              child: HeroSection(
                badges: heroBadges,
                onViewDirection: () => _scrollTo(_directionKey),
                onViewPortfolio: () => _scrollTo(_portfolioKey),
                onContact: () => _scrollTo(_hubKey),
              ),
            ),
            SliverToBoxAdapter(
              child: KeyedSubtree(
                key: _directionKey,
                child: SectionContainer(
                  id: 'direction',
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SectionTitle(
                        title: '소통웨어가 만드는 전자책의 방향',
                        subtitle: '실무 경험과 디지털 사업을 연결하는 6가지 전자책 영역입니다.',
                      ),
                      const SizedBox(height: 40),
                      _ResponsiveCardGrid(
                        itemCount: businessDirections.length,
                        minCardWidth: 320,
                        itemBuilder: (context, index) => BusinessDirectionCard(
                          direction: businessDirections[index],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: KeyedSubtree(
                key: _portfolioKey,
                child: SectionContainer(
                  alternate: true,
                  id: 'portfolio',
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SectionTitle(
                        title: '출간 예정 전자책',
                        subtitle: '기획 중·준비 중인 전자책 포트폴리오입니다.',
                      ),
                      const SizedBox(height: 40),
                      _ResponsiveCardGrid(
                        itemCount: sampleEbooks.length,
                        minCardWidth: 360,
                        itemBuilder: (context, index) =>
                            EbookProjectCard(project: sampleEbooks[index]),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: SectionContainer(
                id: 'categories',
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SectionTitle(
                      title: '확장 가능한 전자책 카테고리',
                      subtitle: '앞으로 전자책이 계속 추가될 수 있는 영역입니다.',
                    ),
                    const SizedBox(height: 40),
                    _ResponsiveCardGrid(
                      itemCount: expandableCategories.length,
                      minCardWidth: 200,
                      itemBuilder: (context, index) => EbookCategoryCard(
                        category: expandableCategories[index],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: PublishingProcessSection(steps: publishingSteps),
            ),
            SliverToBoxAdapter(
              child: SalesChannelSection(channels: salesChannels),
            ),
            SliverToBoxAdapter(
              child: SectionContainer(
                alternate: true,
                id: 'business-connection',
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SectionTitle(
                      title: '전자책과 소통웨어 사업 연결',
                      subtitle: '소통웨어의 앱·콘텐츠·스토어와 전자책을 연결하는 구조입니다.',
                    ),
                    const SizedBox(height: 40),
                    _ResponsiveCardGrid(
                      itemCount: businessConnections.length,
                      minCardWidth: 300,
                      itemBuilder: (context, index) => BusinessConnectionCard(
                        connection: businessConnections[index],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: MonetizationSection(items: monetizationItems),
            ),
            SliverToBoxAdapter(
              child: SectionContainer(
                id: 'future-ideas',
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SectionTitle(
                      title: '계속 확장되는 전자책 아이디어',
                      subtitle: '체크리스트, 템플릿, 가이드로 확장할 예정인 자료 아이디어입니다.',
                    ),
                    const SizedBox(height: 40),
                    _ResponsiveCardGrid(
                      itemCount: futureIdeas.length,
                      minCardWidth: 280,
                      itemBuilder: (context, index) =>
                          FutureIdeaCard(idea: futureIdeas[index]),
                    ),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: KeyedSubtree(
                key: _hubKey,
                child: const SotongControlHubSection(),
              ),
            ),
            SliverToBoxAdapter(
              child: KeyedSubtree(
                key: _contactKey,
                child: const ContactSection(),
              ),
            ),
            const SliverToBoxAdapter(child: FooterSection()),
          ],
        ),
      ),
    );
  }
}

class _ResponsiveCardGrid extends StatelessWidget {
  const _ResponsiveCardGrid({
    required this.itemCount,
    required this.minCardWidth,
    required this.itemBuilder,
  });

  final int itemCount;
  final double minCardWidth;
  final Widget Function(BuildContext context, int index) itemBuilder;

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

        return GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
            childAspectRatio: _aspectRatio(crossAxisCount, minCardWidth),
          ),
          itemCount: itemCount,
          itemBuilder: itemBuilder,
        );
      },
    );
  }

  double _aspectRatio(int columns, double minWidth) {
    if (minWidth >= 360) return columns == 2 ? 0.72 : 0.68;
    if (minWidth >= 300) return columns == 2 ? 1.6 : 1.4;
    if (minWidth >= 200) return 1.8;
    return 2.2;
  }
}
