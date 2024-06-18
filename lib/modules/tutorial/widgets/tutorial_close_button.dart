import 'package:flutter/material.dart';

class TutorialCloseButton extends StatelessWidget {
  final Function onTap;

  const TutorialCloseButton({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Align(
        alignment: Alignment.topRight,
        child: Padding(
          padding: const EdgeInsets.only(
            right: 20,
          ),
          child: InkWell(
            onTap: () => onTap(),
            child: const Icon(
              Icons.close,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
