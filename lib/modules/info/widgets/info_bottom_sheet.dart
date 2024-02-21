import 'package:flutter/material.dart';
import 'package:lines/core/app_theme.dart';

class InfoBottomSheet extends StatelessWidget {
  final Widget? child;

  DraggableScrollableController get draggableScrollableController =>
      DraggableScrollableController();

  const InfoBottomSheet({
    this.child,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      shouldCloseOnMinExtent: true,
      expand: false,
      initialChildSize: 0.2,
      minChildSize: 0.1,
      maxChildSize: 0.9,
      controller: draggableScrollableController,
      builder: (context, scrollController) {
        return Container(
          clipBehavior: Clip.antiAlias,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: Stack(
            children: [
              SingleChildScrollView(
                controller: scrollController,
                child: child,
              ),
              IgnorePointer(
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 4,
                      width: 64,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: ThemeColor.primaryOpaque,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
