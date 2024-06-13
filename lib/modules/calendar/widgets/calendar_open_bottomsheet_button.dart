import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:lines/core/app_theme.dart';

class CalendarOpenBottomsheetButton extends StatelessWidget {
  final String value;
  final List<String> values;
  final Function(String) callback;

  const CalendarOpenBottomsheetButton({
    required this.value,
    required this.callback,
    required this.values,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        callback(
          await openBottomSheet(context).value ?? value,
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 12,
          ),
          child: Row(
            children: [
              HeadlineSmall(
                value,
                color: ThemeColor.darkBlue,
                fontWeight: FontWeight.w500,
              ),
              const Spacer(),
              SvgPicture.asset(
                ThemeIcon.arrowDown,
                colorFilter: const ColorFilter.mode(
                  ThemeColor.darkBlue,
                  BlendMode.srcIn,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Rx<Future<String?>> openBottomSheet(BuildContext context) {
    return showCupertinoModalPopup<String>(
      context: context,
      builder: (context) {
        return Material(
          child: SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.3,
            child: ListView.builder(
              itemCount: values.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(values[index]),
                  onTap: () {
                    Navigator.of(context).pop(values[index]);
                  },
                );
              },
            ),
          ),
        );
      },
    ).obs;
  }
}
