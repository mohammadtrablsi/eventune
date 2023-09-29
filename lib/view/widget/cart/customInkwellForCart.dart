import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomInkwellForCart extends StatelessWidget {
  final Color colorBorder;
  final Color colorIcon;
  final IconData icon;
  final void Function()? onTap;

  const CustomInkwellForCart(
      {super.key,
      required this.colorBorder,
      required this.colorIcon,
      this.onTap, required this.icon});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onTap,
        child: CircleAvatar(
          backgroundColor: colorBorder,
          radius: 14,
          child: CircleAvatar(
              backgroundColor: Colors.white,
              radius: 13,
              child: FaIcon(
                icon,
                size: 16,
                color: colorIcon,
              )),
        ));
  }
}
