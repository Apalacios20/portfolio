class ProjectInfo {
  final String imageUrl;
  final String title;
  final String projectType;
  final String description;
  final List<String> imageUrls;
  final List<String> skills;
  final String? gitUrl;

  ProjectInfo({
    required this.imageUrl,
    required this.title,
    required this.projectType,
    required this.description,
    required this.imageUrls,
    required this.skills,
    this.gitUrl,
  });
}
