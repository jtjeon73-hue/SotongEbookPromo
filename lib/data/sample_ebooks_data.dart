import 'package:flutter/material.dart';

import '../models/ebook_category.dart';
import '../models/ebook_project.dart';
import '../models/publishing_step.dart';

const String contactEmail = 'sotongware@naver.com';

const String mailtoLink = 'mailto:sotongware@naver.com?subject=소통웨어 전자책 문의';

const List<String> heroBadges = [
  'Digital Ebook',
  'PDF Guide',
  'AI 활용법',
  '앱개발 노하우',
  '산업자동화 실무',
  '농촌생활 기록',
  '수익자동화 아이디어',
  '지식 상품화',
];

const List<BusinessDirection> businessDirections = [
  BusinessDirection(
    title: '실무 경험 정리',
    description: '산업자동화, 생산라인 모니터링, 작업자 프로그램 개발 경험을 읽기 쉬운 실무 자료로 정리합니다.',
    icon: Icons.precision_manufacturing_outlined,
  ),
  BusinessDirection(
    title: '앱개발 과정 기록',
    description:
        'Flutter 앱 기획, Cursor 활용, APK 테스트, 프로모 사이트 제작, Play Store 준비 과정을 전자책으로 정리합니다.',
    icon: Icons.phone_android_outlined,
  ),
  BusinessDirection(
    title: 'AI 활용 노하우',
    description:
        'ChatGPT, Cursor, AI 음악, 콘텐츠 제작, 업무 자동화에 활용할 수 있는 실전형 AI 사용법을 정리합니다.',
    icon: Icons.auto_awesome_outlined,
  ),
  BusinessDirection(
    title: '농촌생활 콘텐츠',
    description: '시골생활, 농촌 일상, 텃밭, 지역 이야기, 농산물 판매 가능성을 전자책 콘텐츠로 확장합니다.',
    icon: Icons.eco_outlined,
  ),
  BusinessDirection(
    title: '수익자동화 아이디어',
    description: '앱, 유튜브, 전자책, 스마트스토어, 홍보사이트를 연결해 수익 흐름을 만드는 과정을 정리합니다.',
    icon: Icons.trending_up_outlined,
  ),
  BusinessDirection(
    title: '계속 확장되는 지식 상품',
    description:
        '전자책 한 권으로 끝나지 않고, PDF 자료, 체크리스트, 템플릿, 강의 자료로 확장할 수 있는 구조를 만듭니다.',
    icon: Icons.library_add_outlined,
  ),
];

const List<EbookProject> sampleEbooks = [
  EbookProject(
    title: 'AI로 앱 만드는 사람의 시작 노트',
    categories: ['앱개발', 'AI 활용', 'Flutter'],
    stage: '기획 중',
    description:
        '앱 아이디어를 정리하고, Cursor와 Flutter를 활용해 앱을 만들고, APK 테스트와 프로모 사이트까지 연결하는 과정을 정리한 전자책입니다.',
    outlineCandidates: [
      '앱 아이디어 정리 방법',
      'Flutter 프로젝트 시작',
      'Cursor에게 일 시키는 방법',
      'APK 테스트 흐름',
      '프로모 사이트 제작',
      'Play Store 준비 체크리스트',
    ],
    targetReaders: '앱을 처음 만들고 싶은 개인, AI로 개발을 시작하려는 사람, 1인 개발자',
    usageDirection: '앱개발 홍보사이트, 소통AI 앱, 유튜브 콘텐츠와 연결 예정',
    statusBadge: '기획 중',
  ),
  EbookProject(
    title: '생산라인 모니터링 시스템 실무 노트',
    categories: ['산업자동화', '생산관리', 'PC 프로그램'],
    stage: '자료 정리 예정',
    description:
        '제조 생산라인에서 작업순서, 바코드, PLC, MES, Tool 데이터, CSV, 그래프를 관리하는 PC 기반 모니터링 시스템 경험을 정리한 실무형 전자책입니다.',
    outlineCandidates: [
      '생산라인 모니터링 개념',
      '작업자 작업리스트 구성',
      '바코드 연동 구조',
      'PLC/MES 연동 흐름',
      'Tool 데이터 수집',
      'CSV와 그래프 관리',
      'OK/NG 이력 관리',
    ],
    targetReaders: '자동화 개발자, 생산관리 담당자, 설비 담당자, 제조업 시스템 개발 관심자',
    usageDirection: '산업자동화 홍보사이트, 실무 컨설팅 자료로 활용 예정',
    statusBadge: '자료 정리 예정',
  ),
  EbookProject(
    title: 'AI 시대의 1인 수익 자동화 구상',
    categories: ['수익자동화', 'AI 활용', '온라인 사업'],
    stage: '아이디어 정리',
    description:
        '앱, 유튜브, 전자책, 홍보사이트, 스마트스토어를 연결해 1인이 운영할 수 있는 수익 구조를 구상하는 전자책입니다.',
    outlineCandidates: [
      '1인 사업 구조 만들기',
      '앱 수익화 방향',
      '유튜브 콘텐츠 연결',
      '전자책 판매 구조',
      '스마트스토어와 소통창고',
      'AI를 업무 직원처럼 활용하는 방법',
    ],
    targetReaders: '1인 사업자, 부업 준비자, AI 활용 수익화에 관심 있는 사람',
    usageDirection: '수익자동화 시리즈의 핵심 가이드로 확장 예정',
    statusBadge: '아이디어 정리',
  ),
  EbookProject(
    title: '시골생활과 디지털 사업 노트',
    categories: ['농촌생활', '지역 콘텐츠', '디지털 전환'],
    stage: '기획 중',
    description:
        '시골생활, 농촌 경험, 지역 생활정보, 농산물, 마을 콘텐츠를 디지털 사업과 연결하는 과정을 정리하는 전자책입니다.',
    outlineCandidates: [
      '시골생활에서 발견한 기회',
      '지역 콘텐츠 만들기',
      '농산물과 온라인 판매',
      '마을 정보 앱 구상',
      '유튜브와 전자책 연결',
      '지역 기반 디지털 사업',
    ],
    targetReaders: '귀농귀촌 관심자, 농촌 콘텐츠 제작자, 지역 기반 사업을 고민하는 사람',
    usageDirection: '팜지기 앱, 농촌 콘텐츠 채널과 연결 예정',
    statusBadge: '기획 중',
  ),
  EbookProject(
    title: 'ChatGPT와 Cursor로 일하는 방법',
    categories: ['AI 업무 자동화', '개발 보조', '생산성'],
    stage: '출간 후보',
    description:
        'ChatGPT와 Cursor를 활용해 기획, 개발, 문서, 홍보사이트, 앱 제작 작업을 진행하는 방법을 정리한 실전형 전자책입니다.',
    outlineCandidates: [
      'ChatGPT에게 질문하는 방법',
      'Cursor에게 개발 지시하는 방법',
      '좋은 프롬프트 구조',
      '에러 해결 흐름',
      'GitHub와 연동하기',
      '앱/사이트를 빠르게 만드는 방법',
    ],
    targetReaders: 'AI를 업무에 쓰고 싶은 개인, 개발 초보자, 기획자, 1인 창업자',
    usageDirection: '소통AI 앱, AI 활용 콘텐츠와 연결 예정',
    statusBadge: '출간 후보',
  ),
  EbookProject(
    title: '소통웨어 사업 구축 기록',
    categories: ['사업기록', '브랜드 구축', '포트폴리오'],
    stage: '장기 프로젝트',
    description:
        '산업자동화, 앱개발, 콘텐츠, 전자책, 스마트스토어를 하나의 소통웨어 사업 구조로 만들어가는 과정을 기록하는 전자책입니다.',
    outlineCandidates: [
      '사업부 4개 구조 만들기',
      'private 관제센터 만들기',
      'public 홍보사이트 만들기',
      '앱 포트폴리오 구축',
      '콘텐츠와 전자책 연결',
      '수익화 흐름 정리',
    ],
    targetReaders: '1인 기업을 준비하는 사람, AI 기반 사업 운영에 관심 있는 사람',
    usageDirection: '소통웨어 브랜드 스토리의 핵심 기록물로 활용 예정',
    statusBadge: '장기 프로젝트',
  ),
];

const List<EbookCategoryItem> expandableCategories = [
  EbookCategoryItem(title: '앱개발 입문', icon: Icons.phone_android_outlined),
  EbookCategoryItem(
    title: '산업자동화 실무',
    icon: Icons.precision_manufacturing_outlined,
  ),
  EbookCategoryItem(title: 'AI 활용법', icon: Icons.auto_awesome_outlined),
  EbookCategoryItem(title: '수익자동화', icon: Icons.trending_up_outlined),
  EbookCategoryItem(title: '농촌생활', icon: Icons.eco_outlined),
  EbookCategoryItem(title: '지역 콘텐츠', icon: Icons.map_outlined),
  EbookCategoryItem(title: '유튜브 제작', icon: Icons.play_circle_outline),
  EbookCategoryItem(title: '스마트스토어 운영', icon: Icons.storefront_outlined),
  EbookCategoryItem(title: '1인 사업 구축', icon: Icons.business_center_outlined),
  EbookCategoryItem(title: '체크리스트/템플릿 자료', icon: Icons.checklist_outlined),
];

const List<PublishingStep> publishingSteps = [
  PublishingStep(
    stepNumber: 1,
    title: '주제 선정',
    description: '실제 경험과 독자의 필요가 만나는 주제를 선정합니다.',
    icon: Icons.lightbulb_outline,
  ),
  PublishingStep(
    stepNumber: 2,
    title: '목차 구성',
    description: '독자가 순서대로 이해할 수 있도록 큰 흐름과 세부 목차를 정리합니다.',
    icon: Icons.format_list_numbered,
  ),
  PublishingStep(
    stepNumber: 3,
    title: '원고 작성',
    description: '실무 경험, 사례, 체크리스트, 사용 방법을 읽기 쉬운 문장으로 정리합니다.',
    icon: Icons.edit_note_outlined,
  ),
  PublishingStep(
    stepNumber: 4,
    title: '편집 및 디자인',
    description: 'PDF 표지, 본문 레이아웃, 이미지, 도표, 체크리스트를 구성합니다.',
    icon: Icons.palette_outlined,
  ),
  PublishingStep(
    stepNumber: 5,
    title: '판매 페이지 제작',
    description: '전자책의 가치, 대상 독자, 목차, 구매 안내를 보여주는 판매 페이지를 준비합니다.',
    icon: Icons.web_outlined,
  ),
  PublishingStep(
    stepNumber: 6,
    title: '판매 채널 연결',
    description: '스마트스토어, 크몽, 블로그, 프로모 사이트, 유튜브 콘텐츠와 연결합니다.',
    icon: Icons.hub_outlined,
  ),
  PublishingStep(
    stepNumber: 7,
    title: '업데이트 및 확장',
    description: '앱, AI 도구, 사업 경험 변화에 따라 전자책을 계속 업데이트합니다.',
    icon: Icons.update_outlined,
  ),
];

const List<SalesChannel> salesChannels = [
  SalesChannel(
    title: '스마트스토어 / 소통창고',
    description: 'PDF 자료, 전자책, 템플릿, 체크리스트 판매 채널로 확장할 수 있습니다.',
    icon: Icons.storefront_outlined,
  ),
  SalesChannel(
    title: '크몽 / 프리랜서 플랫폼',
    description: '전자책, 컨설팅, 문서 템플릿, 개발 가이드 판매 가능성을 검토합니다.',
    icon: Icons.work_outline,
  ),
  SalesChannel(
    title: '블로그 / 홍보사이트',
    description: '전자책 소개글, 목차, 샘플 페이지를 통해 관심 독자를 모읍니다.',
    icon: Icons.article_outlined,
  ),
  SalesChannel(
    title: '유튜브 콘텐츠',
    description: '전자책 주제와 연결된 영상을 제작해 자연스럽게 판매 페이지로 연결합니다.',
    icon: Icons.play_circle_outline,
  ),
  SalesChannel(
    title: '앱과 연동',
    description: '소통웨어 앱 안에서 전자책, PDF 가이드, 프리미엄 자료로 확장할 수 있습니다.',
    icon: Icons.phone_android_outlined,
  ),
  SalesChannel(
    title: '이메일 문의',
    description: '전자책 구매, 협업, 자료 요청을 이메일로 받을 수 있습니다.',
    icon: Icons.email_outlined,
  ),
];

const List<BusinessConnection> businessConnections = [
  BusinessConnection(
    from: '산업자동화 홍보사이트',
    to: '실무 전자책',
    icon: Icons.precision_manufacturing_outlined,
  ),
  BusinessConnection(
    from: '앱개발 홍보사이트',
    to: '앱개발 전자책',
    icon: Icons.phone_android_outlined,
  ),
  BusinessConnection(
    from: '콘텐츠 홍보사이트',
    to: '유튜브/AI 음악 전자책',
    icon: Icons.movie_outlined,
  ),
  BusinessConnection(
    from: '소통여행 앱',
    to: '여행 계획 PDF 가이드',
    icon: Icons.flight_outlined,
  ),
  BusinessConnection(
    from: '팜지기 앱',
    to: '농촌 직거래 가이드',
    icon: Icons.agriculture_outlined,
  ),
  BusinessConnection(
    from: '소통AI 앱',
    to: 'AI 활용 전자책',
    icon: Icons.auto_awesome_outlined,
  ),
  BusinessConnection(
    from: '소통창고/스마트스토어',
    to: '전자책 판매',
    icon: Icons.shopping_bag_outlined,
  ),
];

const List<MonetizationItem> monetizationItems = [
  MonetizationItem(
    title: 'PDF 전자책 판매',
    description: '완성된 전자책을 PDF 상품으로 판매합니다.',
    icon: Icons.picture_as_pdf_outlined,
  ),
  MonetizationItem(
    title: '체크리스트/템플릿 판매',
    description: '앱개발 체크리스트, 자동화 요구사항 양식, 사업계획 템플릿 등을 판매할 수 있습니다.',
    icon: Icons.checklist_outlined,
  ),
  MonetizationItem(
    title: '유튜브와 연결',
    description: '영상에서 다룬 내용을 자세한 전자책으로 연결합니다.',
    icon: Icons.play_circle_outline,
  ),
  MonetizationItem(
    title: '앱 프리미엄 자료',
    description: '앱 안에서 고급 가이드나 리포트 형태로 전자책을 연결할 수 있습니다.',
    icon: Icons.star_outline,
  ),
  MonetizationItem(
    title: '컨설팅 연결',
    description: '전자책을 읽은 독자가 개발, 자동화, AI 활용 상담으로 연결될 수 있습니다.',
    icon: Icons.support_agent_outlined,
  ),
  MonetizationItem(
    title: '스마트스토어 상품화',
    description: '전자책, 템플릿, PDF 자료를 소통창고 상품으로 구성할 수 있습니다.',
    icon: Icons.storefront_outlined,
  ),
];

const List<FutureIdea> futureIdeas = [
  FutureIdea(title: 'Flutter 앱개발 체크리스트', icon: Icons.check_circle_outline),
  FutureIdea(title: 'Cursor 프롬프트 모음집', icon: Icons.terminal_outlined),
  FutureIdea(title: 'GitHub Desktop 사용 가이드', icon: Icons.code_outlined),
  FutureIdea(title: 'Play Store 등록 준비 가이드', icon: Icons.shop_outlined),
  FutureIdea(title: '산업자동화 요구사항 정리 양식', icon: Icons.description_outlined),
  FutureIdea(title: '바코드/PLC/MES 연동 개념 노트', icon: Icons.qr_code_outlined),
  FutureIdea(title: 'AI 유튜브 콘텐츠 제작 가이드', icon: Icons.smart_display_outlined),
  FutureIdea(title: '농촌생활 디지털 사업 노트', icon: Icons.eco_outlined),
  FutureIdea(title: '1인 사업 관제센터 구축기', icon: Icons.dashboard_outlined),
  FutureIdea(title: '스마트스토어 상품 설명 템플릿', icon: Icons.inventory_2_outlined),
];
