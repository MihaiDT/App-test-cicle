import 'package:flutter/material.dart';
import 'package:lines/widgets/buttons/primary_button.dart';
import 'package:lottie/lottie.dart';

class PrimaryLoadingButton extends PrimaryButton {
  final bool isLoading;

  const PrimaryLoadingButton({
    super.key,
    required this.isLoading,
    required void Function()? onPressed,
    required Widget child,
  }) : super(
          child: isLoading ? const _LoadingButtonIndicator() : child,
          onPressed: isLoading ? null : onPressed,
        );
}

class _LoadingButtonIndicator extends StatelessWidget {
  const _LoadingButtonIndicator();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 20,
      width: 20,
      child: LottieBuilder.asset(
        "assets/lottie/dark_loader.json",
      ),
    );
  }
}
