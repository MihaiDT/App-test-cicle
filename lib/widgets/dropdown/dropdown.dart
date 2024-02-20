import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lines/core/app_theme.dart';

class DropDown extends StatefulWidget {
  final String title;
  final Widget? child;

  const DropDown({
    required this.title,
    this.child,
    super.key,
  });

  @override
  State<DropDown> createState() => _DropDownState();
}

class _DropDownState extends State<DropDown> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Container(
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
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            LayoutBuilder(builder: (context, constrains) {
              return InkWell(
                onTap: () {
                  setState(() {
                    _isExpanded = !_isExpanded;
                  });
                },
                child: Row(
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
                      duration: const Duration(
                        milliseconds: 300,
                      ),
                      curve: Curves.easeInOut,
                      child: SvgPicture.asset(
                        ThemeIcon.arrowUp,
                      ),
                    ),
                  ],
                ),
              );
            }),
            if (widget.child != null)
              AnimatedSize(
                duration: const Duration(
                  milliseconds: 300,
                ),
                curve: Curves.easeInOut,
                child: Visibility(visible: _isExpanded, child: widget.child!),
              ),
          ],
        ),
      ),
    );
  }
}
