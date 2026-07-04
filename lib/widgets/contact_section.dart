import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../data/promo_contact.dart';
import '../theme/promo_theme.dart';
import 'section_title.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SectionContainer(
      id: 'contact',
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
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
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
              decoration: BoxDecoration(
                border: Border.all(
                  color: PromoColors.goldLight.withValues(alpha: 0.5),
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Text(
                'SOTONG HUB · EBOOK INQUIRY',
                style: TextStyle(
                  color: PromoColors.goldLight,
                  fontSize: 11,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 0.8,
                ),
              ),
            ),
            const SizedBox(height: 24),
            const SectionTitle(
              title: '전자책 제작 및 협업 문의',
              subtitle:
                  '문의는 소통총관제로 접수되어 검토·피드백·후속 지시까지 연계됩니다. '
                  '전자책 주제 제안, PDF 자료 요청, 앱개발/AI 활용/산업자동화 실무 자료 관련 상담을 받을 수 있습니다.',
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
                  PromoContact.email,
                  style: Theme.of(
                    context,
                  ).textTheme.titleMedium?.copyWith(color: PromoColors.beige),
                ),
              ],
            ),
            const SizedBox(height: 28),
            Wrap(
              spacing: 14,
              runSpacing: 14,
              children: [
                ElevatedButton.icon(
                  onPressed: () => launchUrl(PromoContact.hubInquiryUri()),
                  icon: const Icon(Icons.hub_outlined, size: 20),
                  label: const Text('소통총관제 상담 문의'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: PromoColors.gold,
                    foregroundColor: PromoColors.deepNavy,
                  ),
                ),
                OutlinedButton.icon(
                  onPressed: () =>
                      launchUrl(PromoContact.hubCollaborationUri()),
                  icon: const Icon(Icons.handshake_outlined, size: 20),
                  label: const Text('전자책 협업 · 주제 제안'),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: PromoColors.beige,
                    side: const BorderSide(color: PromoColors.goldLight),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
