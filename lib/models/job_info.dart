class JobInfo {
  final String positionHeldAtCompany;
  final String yearsWorkedAtCo;
  final String jobLocation;
  final String? jobWebsite;
  final String jobDescription;
  final List<String> skills;
  final String imageName;

  JobInfo({
    required this.positionHeldAtCompany,
    required this.yearsWorkedAtCo,
    required this.jobLocation,
    this.jobWebsite,
    required this.jobDescription,
    required this.skills,
    required this.imageName,
  });
}
