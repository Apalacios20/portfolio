import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/pages/controller.dart';
import 'package:portfolio/widgets/job_detail.dart';

class JobTile extends StatefulWidget {
  final MainController controller;
  final String positionHeldAtCompany;
  final String yearsWorkedAtCo;
  final String jobLocation;
  final String? jobWebsite;
  final String jobDescription;
  final List<String> skills;
  final String imageName;

  const JobTile({
    required this.controller,
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
  State<JobTile> createState() => _JobTileState();
}

class _JobTileState extends State<JobTile> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;
  RxBool isDetailVisible = false.obs;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.ease,
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
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  spreadRadius: 1,
                  blurRadius: 5,
                  offset: const Offset(0, 3),
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
            padding:
                EdgeInsets.only(left: MediaQuery.of(context).size.width * .09),
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
                      ? Colors.transparent
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: isDetailVisible.value
                    ? JobDetail(
                        controller: widget.controller,
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
