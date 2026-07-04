import 'package:flutter/material.dart';

import '../theme/promo_theme.dart';

/// 소통총관제 연동 흐름 — 전자책 프로모 사이트 (실제 API 미연동)
class SotongHubConfig {
  SotongHubConfig._();

  static const String hubName = '소통총관제';
  static const String hubSubtitle = 'Sotong Central Command Hub';
  static const String siteLabel = 'SotongEbookPromo';

  static const flowSteps = [
    HubFlowStep(
      step: 1,
      title: '온라인 문의 접수',
      description: '전자책 상담·협업·PDF 자료·출간 관련 문의가 홍보사이트와 이메일로 접수됩니다.',
      icon: Icons.edit_note_outlined,
      color: PromoColors.deepNavy,
    ),
    HubFlowStep(
      step: 2,
      title: '소통총관제 배정',
      description: '총관제에서 전자책 주제·출간 단계·문의 유형별로 담당 채널에 배정합니다.',
      icon: Icons.hub_outlined,
      color: PromoColors.gold,
    ),
    HubFlowStep(
      step: 3,
      title: '피드백 · 상담 회신',
      description: '검토 결과, 기획 가능 범위, 목차·일정 제안에 대한 피드백을 전달합니다.',
      icon: Icons.forum_outlined,
      color: PromoColors.charcoal,
    ),
    HubFlowStep(
      step: 4,
      title: '총관제 지시 반영',
      description: '원고 보완, PDF 제작, Promo 사이트 수정, 유통 준비 등 총관제 지시에 따라 진행합니다.',
      icon: Icons.assignment_turned_in_outlined,
      color: PromoColors.goldLight,
    ),
  ];

  static const sampleTickets = [
    HubTicket(
      id: 'EBK-2407-001',
      type: '전자책 상담',
      status: HubTicketStatus.received,
      summary: '산업자동화 실무 노트 전자책 기획 검토',
    ),
    HubTicket(
      id: 'EBK-2407-002',
      type: '협업 제안',
      status: HubTicketStatus.inReview,
      summary: '앱개발 실무 가이드 공동 저술·출간 협업 문의',
    ),
    HubTicket(
      id: 'EBK-2407-003',
      type: 'PDF 자료',
      status: HubTicketStatus.feedback,
      summary: '체크리스트·템플릿 PDF 제공 범위 및 형식',
    ),
    HubTicket(
      id: 'EBK-2407-004',
      type: 'Promo 연동',
      status: HubTicketStatus.instruction,
      summary: '출간 예정 전자책 포트폴리오 Promo 업데이트 지시',
    ),
  ];

  static const sampleInstructions = [
    HubInstruction(
      title: '자료 보완 요청',
      description: '전자책 목차 초안·타깃 독자·실무 사례 개요 전달',
    ),
    HubInstruction(
      title: '상담 일정 확정',
      description: '온라인 미팅 7/18 14:00 — PDF 가이드 구성 논의',
    ),
    HubInstruction(
      title: '출간 단계 지시',
      description: '1차 원고 검토 후 Promo 사이트 목차·소개 반영',
    ),
  ];
}

class HubFlowStep {
  const HubFlowStep({
    required this.step,
    required this.title,
    required this.description,
    required this.icon,
    required this.color,
  });

  final int step;
  final String title;
  final String description;
  final IconData icon;
  final Color color;
}

enum HubTicketStatus {
  received('접수', PromoColors.deepNavy),
  inReview('검토중', PromoColors.gold),
  feedback('피드백', PromoColors.charcoal),
  instruction('지시반영', PromoColors.goldLight);

  const HubTicketStatus(this.label, this.color);
  final String label;
  final Color color;
}

class HubTicket {
  const HubTicket({
    required this.id,
    required this.type,
    required this.status,
    required this.summary,
  });

  final String id;
  final String type;
  final HubTicketStatus status;
  final String summary;
}

class HubInstruction {
  const HubInstruction({required this.title, required this.description});

  final String title;
  final String description;
}
