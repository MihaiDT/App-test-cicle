import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lines/core/app_theme.dart';

class FaqTile extends StatefulWidget {
  final String title;

  final String? description;

  const FaqTile({
    required this.title,
    this.description,
    super.key,
  });

  @override
  State<FaqTile> createState() => _FaqTileState();
}

class _FaqTileState extends State<FaqTile> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          _isExpanded = !_isExpanded;
        });
      },
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xffE4D8E7),
          borderRadius: BorderRadius.circular(20),
        ),
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 14,
            horizontal: 16,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              LayoutBuilder(builder: (context, constrains) {
                return Row(
                  children: [
                    ConstrainedBox(
                      constraints: BoxConstraints(
                        maxWidth: constrains.maxWidth * 0.6,
                      ),
                      child: HeadlineSmall(
                        widget.title,
                        color: ThemeColor.darkBlue,
                        textAlign: TextAlign.start,
                      ),
                    ),
                    const Spacer(),
                    AnimatedRotation(
                      turns: _isExpanded ? 0.5 : 0,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                      child: SvgPicture.asset(
                        ThemeIcon.arrowUp,
                      ),
                    ),
                  ],
                );
              }),
              if (widget.description?.isNotEmpty == true)
                AnimatedSize(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                  child: Container(
                    margin: EdgeInsets.zero,
                    width: double.infinity,
                    color: const Color(0xffE4D8E7),
                    child: _isExpanded
                        ? Text(
                            widget.description!,
                          )
                        : null,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
