import 'package:flutter/material.dart';

import '../../config/colorz.dart';



class CustomElevatedButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget child;
  final bool isEnabled;
  final bool isDark;

  const CustomElevatedButton({
    super.key,
    required this.onPressed,
    required this.child,
    required this.isEnabled,
    required this.isDark,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:   const BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            spreadRadius: 1,
            blurRadius: 4,
            offset: Offset(0, 0),
          )
        ],
      ),
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: _backGround(isEnabled, isDark),
          minimumSize: MaterialStateProperty.all<Size>(
            const Size.fromHeight(50),
          ), // NEW
        ),
        onPressed: () => isEnabled ? onPressed() : null,
        child: child,
      ),
    );
  }

  MaterialStateProperty<Color> _backGround(bool isEnabled, bool isDark) {
    if (isDark) {
      return isEnabled
          ? MaterialStateProperty.all<Color>(Colors.blue)
          : MaterialStateProperty.all<Color>(Colorz.white);
    } else {
      return isEnabled
          ? MaterialStateProperty.all<Color>(Colorz.white)
          : MaterialStateProperty.all<Color>(Colorz.white);
    }
  }
}
