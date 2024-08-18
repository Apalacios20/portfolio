import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/widgets/job_content.dart';

class JobTileWidget extends StatefulWidget {
  final String positionHeldAtCompany;
  final String yearsWorkedAtCo;
  final String jobLocation;
  final String? jobWebsite;
  final String jobDescription;
  final List<String> skills;
  final String imageName;

  const JobTileWidget({
    required this.positionHeldAtCompany,
    required this.yearsWorkedAtCo,
    required this.jobLocation,
    this.jobWebsite,
    required this.jobDescription,
    required this.skills,
    required this.imageName,
    super.key,
  });

  @override
  State<JobTileWidget> createState() => _JobTileWidgetState();
}

class _JobTileWidgetState extends State<JobTileWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;
  RxBool isDetailVisible = false.obs;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.linear,
    );
  }

  void toggleDetails() {
    if (isDetailVisible.value) {
      _animationController.reverse();
    } else {
      _animationController.forward();
    }
    isDetailVisible.value = !isDetailVisible.value;
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: MediaQuery.of(context).size.width / 2,
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            decoration: BoxDecoration(
              color: Colors.blueGrey[600],
              borderRadius: BorderRadius.circular(12.0),
              // AP20 new
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2), // Shadow color
                  spreadRadius: 1, // Spread radius
                  blurRadius: 5, // Blur radius
                  offset: Offset(0, 3), // Shadow position
                ),
              ],
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    widget.positionHeldAtCompany,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                    ),
                  ),
                ),
                Text(
                  widget.yearsWorkedAtCo,
                  style: const TextStyle(color: Colors.white, fontSize: 18),
                ),
                const SizedBox(
                  width: 15,
                ),
                IconButton(
                  icon: Icon(
                    isDetailVisible.value ? Icons.clear : Icons.add,
                    color: Colors.white,
                  ),
                  onPressed: toggleDetails,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 155.0),
            child: SizeTransition(
              sizeFactor: _animation,
              axisAlignment: -1.0,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeInOut,
                width: MediaQuery.of(context).size.width / 2,
                padding: isDetailVisible.value
                    ? const EdgeInsets.all(16.0)
                    : EdgeInsets.zero,
                decoration: BoxDecoration(
                  color: isDetailVisible.value
                      ? Colors.orange[800]!.withOpacity(0.2)
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: isDetailVisible.value
                    ? JobContent(
                        jobLocation: widget.jobLocation,
                        jobWebsite: widget.jobWebsite,
                        jobDescription: widget.jobDescription,
                        skills: widget.skills,
                        imageName: widget.imageName,
                      )
                    : null,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
