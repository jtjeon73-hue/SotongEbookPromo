import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../data/sample_ebooks_data.dart';
import '../theme/promo_theme.dart';
import 'section_title.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  Future<void> _launchEmail() async {
    final uri = Uri.parse(mailtoLink);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SectionContainer(
      id: 'contact',
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [PromoColors.deepNavy, PromoColors.charcoal],
          ),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: PromoColors.deepNavy.withValues(alpha: 0.2),
              blurRadius: 32,
              offset: const Offset(0, 12),
            ),
          ],
        ),
        padding: EdgeInsets.all(
          MediaQuery.sizeOf(context).width < 600 ? 28 : 48,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SectionTitle(
              title: '전자책 제작 및 협업 문의',
              subtitle:
                  '전자책 주제 제안, PDF 자료 요청, 앱개발/AI 활용/산업자동화 실무 자료와 관련된 문의를 받을 수 있습니다.',
              light: true,
            ),
            const SizedBox(height: 32),
            Row(
              children: [
                const Icon(
                  Icons.email_outlined,
                  color: PromoColors.gold,
                  size: 22,
                ),
                const SizedBox(width: 12),
                SelectableText(
                  contactEmail,
                  style: Theme.of(
                    context,
                  ).textTheme.titleMedium?.copyWith(color: PromoColors.beige),
                ),
              ],
            ),
            const SizedBox(height: 28),
            ElevatedButton.icon(
              onPressed: _launchEmail,
              icon: const Icon(Icons.mail_outline, size: 20),
              label: const Text('이메일 문의하기'),
              style: ElevatedButton.styleFrom(
                backgroundColor: PromoColors.gold,
                foregroundColor: PromoColors.deepNavy,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
