import 'package:flutter/material.dart';
import 'package:lines/core/helpers/hive_manager.dart';
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
  final LocalAuthentication _auth = LocalAuthentication();

  @override
  void initState() {
    setState(() {
      HiveManager.appHidden = false;
    });

    /// The listener will be added only if the page need an authentication
    if (widget.authNeeded) {
      AppLifecycleListener(
        onRestart: () async {
          await authenticate().then(
            (value) {
              if (value == false) {
                /// HERE WHEN THE USER ENTER THE WRONG PIN AND CLOSE THE PIN PAGE
                /// TODO: CHECK HOW TO MANAGE THIS SCENARIO
                return value;
              } else {
                setState(() {
                  HiveManager.appHidden = false;
                });
              }
            },
          );
        },
        onHide: () {
          setState(() {
            HiveManager.appHidden = true;
          });
        },
      );
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return widget.authNeeded && HiveManager.appHidden
        ? const LockPage()
        : widget.child;
  }

  /// Authenticates the user using biometrics if available.
  /// Returns true if the user is authenticated with Face-id or pin, false otherwise.
  Future<bool> authenticate() async {
    if (await hasBiometrics) {
      try {
        return await _auth.authenticate(
          localizedReason: 'Touch your finger on the sensor to login',
        );
      } catch (e) {
        return false;
      }
    }
    return false;
  }

  /// Checks if the device has biometric capabilities and is supported.
  /// Returns `true` if biometrics are available and supported, otherwise `false`.
  Future<bool> get hasBiometrics async {
    final isAvailable = await _auth.canCheckBiometrics;
    final isDeviceSupported = await _auth.isDeviceSupported();
    return isAvailable && isDeviceSupported;
  }
}
