import 'package:flutter/material.dart';

class EbookCategory {
  const EbookCategory({
    required this.title,
    required this.description,
    required this.icon,
  });

  final String title;
  final String description;
  final IconData icon;
}

class EbookCategoryItem {
  const EbookCategoryItem({required this.title, required this.icon});

  final String title;
  final IconData icon;
}

class BusinessDirection {
  const BusinessDirection({
    required this.title,
    required this.description,
    required this.icon,
  });

  final String title;
  final String description;
  final IconData icon;
}

class SalesChannel {
  const SalesChannel({
    required this.title,
    required this.description,
    required this.icon,
  });

  final String title;
  final String description;
  final IconData icon;
}

class MonetizationItem {
  const MonetizationItem({
    required this.title,
    required this.description,
    required this.icon,
  });

  final String title;
  final String description;
  final IconData icon;
}

class BusinessConnection {
  const BusinessConnection({
    required this.from,
    required this.to,
    required this.icon,
  });

  final String from;
  final String to;
  final IconData icon;
}

class FutureIdea {
  const FutureIdea({required this.title, required this.icon});

  final String title;
  final IconData icon;
}
