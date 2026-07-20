import 'package:flutter/material.dart';

class NavDestination {
  const NavDestination({
    required this.id,
    required this.label,
    required this.path,
    required this.icon,
    required this.selectedIcon,
  });

  final String id;
  final String label;
  final String path;
  final IconData icon;
  final IconData selectedIcon;
}

const List<NavDestination> appDestinations = [
  NavDestination(
    id: 'home',
    label: '홈',
    path: '/',
    icon: Icons.home_outlined,
    selectedIcon: Icons.home_rounded,
  ),
  NavDestination(
    id: 'about',
    label: '소통전자책 소개',
    path: '/about',
    icon: Icons.menu_book_outlined,
    selectedIcon: Icons.menu_book_rounded,
  ),
  NavDestination(
    id: 'ebooks',
    label: '전체 전자책',
    path: '/ebooks',
    icon: Icons.library_books_outlined,
    selectedIcon: Icons.library_books_rounded,
  ),
  NavDestination(
    id: 'published',
    label: '출간 전자책',
    path: '/published',
    icon: Icons.check_circle_outline,
    selectedIcon: Icons.check_circle_rounded,
  ),
  NavDestination(
    id: 'upcoming',
    label: '출간 예정',
    path: '/upcoming',
    icon: Icons.schedule_outlined,
    selectedIcon: Icons.schedule_rounded,
  ),
  NavDestination(
    id: 'categories',
    label: '분야별 전자책',
    path: '/categories',
    icon: Icons.category_outlined,
    selectedIcon: Icons.category_rounded,
  ),
  NavDestination(
    id: 'recommended',
    label: '추천 전자책',
    path: '/recommended',
    icon: Icons.star_outline_rounded,
    selectedIcon: Icons.star_rounded,
  ),
  NavDestination(
    id: 'guide',
    label: '전자책 활용법',
    path: '/guide',
    icon: Icons.auto_stories_outlined,
    selectedIcon: Icons.auto_stories_rounded,
  ),
  NavDestination(
    id: 'news',
    label: '출간 및 업데이트 소식',
    path: '/news',
    icon: Icons.campaign_outlined,
    selectedIcon: Icons.campaign_rounded,
  ),
  NavDestination(
    id: 'faq',
    label: '자주 묻는 질문',
    path: '/faq',
    icon: Icons.help_outline_rounded,
    selectedIcon: Icons.help_rounded,
  ),
  NavDestination(
    id: 'contact',
    label: '문의하기',
    path: '/contact',
    icon: Icons.mail_outline_rounded,
    selectedIcon: Icons.mail_rounded,
  ),
];
