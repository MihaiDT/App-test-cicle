import 'package:flutter/material.dart';
import 'package:lines/core/app_theme.dart';
import 'package:lines/modules/charts_and_statistics/widgets/follicular_line_widget.dart';
import 'package:lines/modules/charts_and_statistics/widgets/luteal_line_widget.dart';
import 'package:lines/modules/charts_and_statistics/widgets/menses_line_widget.dart';
import 'package:lines/modules/charts_and_statistics/widgets/ovulation_line_widget.dart';

class SymptomResumeSection extends StatefulWidget {
  const SymptomResumeSection({
    super.key,
  });

  static const List<int> list = [
    0,
    1,
    2,
    3,
    6,
    5,
    15,
    20,
    26,
    25,
    27,
  ];

  @override
  State<SymptomResumeSection> createState() => _SymptomResumeSectionState();
}

class _SymptomResumeSectionState extends State<SymptomResumeSection> {
  List<ScrollController> _scrollControllers = [];

  final List<int> list = List.generate(
    60,
    (index) => index,
  );

  @override
  void initState() {
    super.initState();

    _scrollControllers = List.generate(4, (index) {
      return ScrollController();
    });
  }

  @override
  Widget build(BuildContext context) {
    final constraints = lineWidth;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const HeadlineMedium(
              "20 sett",
              color: ThemeColor.darkBlue,
            ),
            ThemeSizedBox.width8,
            Container(
              decoration: BoxDecoration(
                color: ThemeColor.darkBlue,
                borderRadius: BorderRadius.circular(4),
              ),
              child: const Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 1,
                  horizontal: 6,
                ),
                child: LabelSmall(
                  "IN CORSO",
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
        ThemeSizedBox.height16,
        NotificationListener<ScrollNotification>(
          onNotification: (scrollNotification) {
            if (scrollNotification is ScrollUpdateNotification) {
              _syncScrolling(
                _scrollControllers.last,
                scrollNotification.metrics.pixels,
              );
            }
            return true;
          },
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            controller: _scrollControllers.last,
            child: Row(
              children: [
                MensesLineWidget(
                  indicatorWidth: constraints * 0.1,
                ),
                const SizedBox(width: 2),
                FollicularLineWidget(
                  indicatorWidth: constraints * 0.1,
                ),
                const SizedBox(width: 2),
                OvulationLineWidget(
                  indicatorWidth: constraints * 0.1,
                ),
                const SizedBox(width: 2),
                LutealLineWidget(
                  indicatorWidth: constraints * 0.7,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.5,
                ),
              ],
            ),
          ),
        ),
        ThemeSizedBox.height16,
        ListView.separated(
          padding: EdgeInsets.zero,
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: 3,
          itemBuilder: (context, index) {
            return Stack(
              alignment: Alignment.centerLeft,
              children: [
                SizedBox(
                  height: 8,
                  child: NotificationListener<ScrollNotification>(
                    onNotification: (scrollNotification) {
                      if (scrollNotification is ScrollUpdateNotification) {
                        _syncScrolling(
                          _scrollControllers[index],
                          scrollNotification.metrics.pixels,
                        );
                      }
                      return true;
                    },
                    child: ListView.builder(
                      padding: EdgeInsets.zero,
                      physics: const AlwaysScrollableScrollPhysics(),
                      controller: _scrollControllers[index],
                      scrollDirection: Axis.horizontal,
                      // + 1 to add a space at the end
                      itemCount: 50 + 1,
                      itemBuilder: (context, index) {
                        // Add a space at the end
                        if (index >= 50) {
                          return SizedBox(
                            width: MediaQuery.sizeOf(context).width * 0.5,
                          );
                        }
                        Color color = SymptomResumeSection.list.contains(index)
                            ? ThemeColor.menstruationColor
                            : ThemeColor.lightGrey;
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 1),
                          child: CircleAvatar(
                            radius: singleDotSize.width / 2,
                            backgroundColor: color,
                          ),
                        );
                      },
                    ),
                  ),
                ),
                ThemeSizedBox.height4,
                Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    color: Colors.white,
                    child: const BodySmall(
                      "Tranquilla",
                      fontWeight: FontWeight.w500,
                      color: ThemeColor.darkBlue,
                    ),
                  ),
                ),
              ],
            );
          },
          separatorBuilder: (context, index) {
            return ThemeSizedBox.height8;
          },
        ),
      ],
    );
  }

  void _syncScrolling(ScrollController controller, double offset) {
    if (controller.hasClients) {
      for (int i = 0; i < _scrollControllers.length; i++) {
        if (_scrollControllers[i] != controller &&
            _scrollControllers[i].position.pixels != offset) {
          _scrollControllers[i].jumpTo(offset);
        }
      }
    }
  }

  Size get singleDotSize => const Size(8, 8);

  double get lineWidth => list.length * singleDotSize.width;
}
