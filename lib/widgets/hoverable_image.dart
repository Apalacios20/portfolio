import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HoverableImage extends StatefulWidget {
  final String imageUrl;
  final Offset offset;

  const HoverableImage({
    required this.imageUrl,
    required this.offset,
    Key? key,
  }) : super(key: key);

  @override
  _HoverableImageState createState() => _HoverableImageState();
}

class _HoverableImageState extends State<HoverableImage> {
  bool _isHovered = false;

  void _showImageModal() {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          child: Stack(
            children: [
              widget.imageUrl.toLowerCase().endsWith('.svg')
                  ? SvgPicture.asset(
                      widget.imageUrl,
                      width: 600,
                      height: 600,
                      fit: BoxFit.contain,
                    )
                  : Image.asset(
                      widget.imageUrl,
                      width: 600,
                      height: 600,
                      fit: BoxFit.contain,
                    ),
              Positioned(
                top: 10,
                right: 10,
                child: IconButton(
                  icon: Icon(Icons.close, color: Colors.white),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: _showImageModal,
        child: AnimatedContainer(
          duration: Duration(milliseconds: 300),
          transform:
              Matrix4.translationValues(widget.offset.dx, widget.offset.dy, 0),
          decoration: BoxDecoration(
            boxShadow: _isHovered
                ? [
                    const BoxShadow(
                      color: Colors.black26,
                      blurRadius: 15,
                      offset: Offset(0, 10),
                    ),
                  ]
                : [],
          ),
          child: widget.imageUrl.toLowerCase().endsWith('.svg')
              ? SvgPicture.asset(
                  widget.imageUrl,
                  height: 200,
                  fit: BoxFit.contain,
                )
              : Image.asset(
                  widget.imageUrl,
                  height: 200,
                  fit: BoxFit.contain,
                ),
        ),
      ),
    );
  }
}
