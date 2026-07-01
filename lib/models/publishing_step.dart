import 'package:flutter/material.dart';

class PublishingStep {
  const PublishingStep({
    required this.stepNumber,
    required this.title,
    required this.description,
    required this.icon,
  });

  final int stepNumber;
  final String title;
  final String description;
  final IconData icon;
}
