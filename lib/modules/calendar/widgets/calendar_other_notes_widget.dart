import 'package:flutter/material.dart';
import 'package:lines/core/app_theme.dart';

class CalendarOtherNotesWidget extends StatelessWidget {
  final String initialValue;
  final Function(String) onChanged;

  const CalendarOtherNotesWidget({
    this.initialValue = "",
    required this.onChanged,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: TextEditingController(text: initialValue),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 14,
        ),
        fillColor: Colors.white,
        filled: true,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        errorBorder: InputBorder.none,
        hintText: "Aggiungi nota",
        hintStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
              color: ThemeColor.darkBlue.withOpacity(0.5),
            ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
      ),
      maxLines: 3,
    );
  }
}
