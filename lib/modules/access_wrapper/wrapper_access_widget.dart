import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lines/core/helpers/hive_manager.dart';
import 'package:lines/core/utils/singletons.dart';
import 'package:lines/modules/access_wrapper/controller/wrapper_access_controller.dart';
import 'package:lines/modules/access_wrapper/lock_page.dart';
import 'package:local_auth/local_auth.dart';

class WrapperAccessWidget extends StatefulWidget {
  final Widget child;
  final bool authNeeded;

  const WrapperAccessWidget({
    required this.child,
    this.authNeeded = true,
    super.key,
  });

  @override
  State<WrapperAccessWidget> createState() => _WrapperAccessWidgetState();
}

class _WrapperAccessWidgetState extends State<WrapperAccessWidget> {
  late final WrapperAccessController controller;

  final LocalAuthentication _auth = LocalAuthentication();

  @override
  void initState() {
    controller = Get.put(
      WrapperAccessController(),
    );
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      /// The listener will be added only if the page need an authentication
      AppLifecycleListener(
        onRestart: () {
          if (mounted) {
            setState(() {});
          }
        },
        onHide: () {
          HiveManager.showLockPage = true;
          appController.showLockPage.value = true;
        },
      );
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.authNeeded &&
        (HiveManager.showLockPage || appController.showLockPage.value)) {
      authenticate().then((value) async {
        if (value == false) {
          /// HERE WHEN THE USER ENTER THE WRONG PIN AND CLOSE THE PIN PAGE
          /// TODO: CHECK HOW TO MANAGE THIS SCENARIO
          return value;
        } else {
          HiveManager.showLockPage = false;

          /// !!! Non togliere le righe sotto, altrimenti la pagina di Face ID rischia di bloccarsi
          appController.showLockPage.value = true;
          appController.showLockPage.refresh();
          appController.showLockPage.value = false;
          appController.showLockPage.refresh();
        }
      });
    }
    return Obx(
      () {
        return Stack(
          children: [
            widget.authNeeded &&
                    (appController.showLockPage.value ||
                        HiveManager.showLockPage)
                ? const LockPage()
                : widget.child,
            if (controller.lockApp.value)
              Container(
                width: Get.width,
                height: Get.height,
                color: Colors.black.withOpacity(0.5),
              ),
          ],
        );
      },
    );
  }

  /// Authenticates the user using biometrics if available.
  /// Returns true if the user is authenticated with Face-id or pin, false otherwise.
  Future<bool> authenticate() async {
    if (await hasBiometrics) {
      try {
        return await _auth.authenticate(
          localizedReason: 'Touch/Face ID o inserisci codice',
          options: const AuthenticationOptions(
            stickyAuth: true,
            biometricOnly: false,
          ),
        );
      } catch (e) {
        return true;
      }
    }
    return true;
  }

  /// Checks if the device has biometric capabilities and is supported.
  /// Returns `true` if biometrics are available and supported, otherwise `false`.
  Future<bool> get hasBiometrics async {
    final isAvailable = await _auth.canCheckBiometrics;
    final isDeviceSupported = await _auth.isDeviceSupported();
    return isAvailable && isDeviceSupported;
  }
}
