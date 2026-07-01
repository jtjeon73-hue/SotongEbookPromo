class EbookProject {
  const EbookProject({
    required this.title,
    required this.categories,
    required this.stage,
    required this.description,
    required this.outlineCandidates,
    required this.targetReaders,
    required this.usageDirection,
    required this.statusBadge,
  });

  final String title;
  final List<String> categories;
  final String stage;
  final String description;
  final List<String> outlineCandidates;
  final String targetReaders;
  final String usageDirection;
  final String statusBadge;
}
