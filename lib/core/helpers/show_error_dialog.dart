import 'package:flutter/material.dart';

Future<T?> showErrorDialog<T>({
  required BuildContext context,
  required Widget Function(BuildContext) builder,
  bool dismissible = true,
}) async {
  bool isCurrent = ModalRoute.of(context)?.isCurrent ?? true;
  if (!isCurrent) return null;
  return await showDialog(
    context: context,
    builder: builder,
    barrierDismissible: dismissible,
  );
}
