import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../models/nav_destination.dart';
import '../theme/promo_theme.dart';
import 'side_nav_menu.dart';

const double kSidebarBreakpoint = 768;
const double kSidebarWidth = 268;

class AppShell extends StatelessWidget {
  const AppShell({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final path = GoRouterState.of(context).uri.path;
    final wide = MediaQuery.sizeOf(context).width >= kSidebarBreakpoint;
    final title = _titleForPath(path);

    if (wide) {
      return Scaffold(
        backgroundColor: PromoColors.beige,
        body: Row(
          children: [
            SizedBox(
              width: kSidebarWidth,
              child: Material(
                elevation: 1,
                color: PromoColors.white,
                child: SideNavMenu(
                  selectedPath: path,
                  onSelect: (next) => context.go(next),
                ),
              ),
            ),
            Expanded(
              child: ColoredBox(color: PromoColors.beige, child: child),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: PromoColors.beige,
      appBar: AppBar(
        backgroundColor: PromoColors.deepNavy,
        foregroundColor: PromoColors.white,
        elevation: 0,
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w600,
            color: PromoColors.white,
          ),
        ),
      ),
      drawer: Drawer(
        backgroundColor: PromoColors.white,
        width: kSidebarWidth + 12,
        child: SafeArea(
          child: SideNavMenu(
            selectedPath: path,
            compactHeader: true,
            onSelect: (next) {
              Navigator.of(context).pop();
              context.go(next);
            },
          ),
        ),
      ),
      body: child,
    );
  }

  String _titleForPath(String path) {
    for (final item in appDestinations) {
      if (item.path == '/') {
        if (path == '/' || path.isEmpty) return item.label;
        continue;
      }
      if (path == item.path || path.startsWith('${item.path}/')) {
        return item.label;
      }
    }
    return '소통전자책';
  }
}
