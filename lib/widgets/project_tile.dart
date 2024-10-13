import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProjectTile extends StatefulWidget {
  final String imageUrl;
  final String title;
  final String projectType;
  final VoidCallback onTap;

  const ProjectTile({
    required this.imageUrl,
    required this.title,
    required this.projectType,
    required this.onTap,
    super.key,
  });

  @override
  ProjectTileState createState() => ProjectTileState();
}

class ProjectTileState extends State<ProjectTile> {
  bool isHovered = false;

  bool isSvg(String imageUrl) {
    return imageUrl.toLowerCase().endsWith('.svg');
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: InkWell(
        onTap: widget.onTap,
        child: SizedBox(
          width: 300,
          height: 375,
          child: Card(
            elevation: 5.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius:
                      const BorderRadius.vertical(top: Radius.circular(12.0)),
                  child: AnimatedScale(
                    scale: isHovered ? 1.1 : 1.0,
                    duration: const Duration(milliseconds: 200),
                    curve: Curves.easeInOut,
                    child: isSvg(widget.imageUrl)
                        ? Container(
                            padding: const EdgeInsets.all(35),
                            color: Colors.white,
                            width: double.infinity,
                            height: 260,
                            child: SvgPicture.asset(
                              'assets/${widget.imageUrl}',
                              width: double.infinity,
                              height: 260,
                              fit: BoxFit.contain,
                            ),
                          )
                        : Image.asset(
                            'assets/${widget.imageUrl}',
                            width: double.infinity,
                            height: 260,
                            fit: BoxFit.cover,
                          ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.title,
                        style: const TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8.0),
                      Row(
                        children: [
                          Text(
                            isHovered ? "Details" : widget.projectType,
                            style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.grey[600],
                            ),
                          ),
                          if (isHovered) ...[
                            const SizedBox(
                              width: 5,
                            ),
                            const Icon(
                              Icons.arrow_circle_right_outlined,
                              size: 25,
                            )
                          ]
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
