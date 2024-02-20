import 'package:flutter/material.dart';
import 'package:lines/core/app_theme.dart';
import 'package:lines/modules/info/widgets/info_dropdown_header.dart';
import 'package:lines/widgets/coin/app_coin.dart';

class InfoDropDown extends StatefulWidget {
  const InfoDropDown({
    super.key,
  });

  @override
  State<InfoDropDown> createState() => _InfoDropDownState();
}

class _InfoDropDownState extends State<InfoDropDown> {
  bool _isHidden = true;

  static const Color _bgColor = Color(0xfff3eef4);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: _bgColor,
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(
          ThemeSize.paddingSmall,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            InkWell(
              onTap: () {
                _isHidden = !_isHidden;
                setState(() {});
              },
              child: InfoDropDownHeader(
                title: "Lines è",
                isHidden: _isHidden,
              ),
            ),
            Visibility(
              visible: _isHidden,
              child: const Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 2,
                ),
                child: Divider(),
              ),
            ),
            Visibility(
              visible: _isHidden,
              child: ListView.separated(
                itemBuilder: (context, index) => _infoItem(
                  "Lines è con ali",
                  250,
                ),
                itemCount: 10,
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                separatorBuilder: (context, index) => const Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 2,
                  ),
                  child: Divider(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _infoItem(String text, int coinAmount) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        BodyMedium(
          text,
          color: ThemeColor.darkBlue,
        ),
        AppCoin.small(coinAmount: coinAmount),
      ],
    );
  }
}
