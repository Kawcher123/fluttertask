import 'package:flutter/material.dart';

import '../constants/contants.dart';

class BlockButtonWidget extends StatelessWidget {
  const BlockButtonWidget(
      {Key? key,
      this.color,
      this.child,
      this.width,
      this.height,
      this.isBlur = true,
      this.radius,
      this.hasBorder = false,
      this.onPressed})
      : super(key: key);

  final Color? color;
  final Widget? child;
  final double? radius;
  final double? width;
  final double? height;
  final bool? isBlur;
  final bool? hasBorder;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: width ?? size.width,
      height: height ?? 50,
      decoration:  hasBorder == true
              ? BoxDecoration(
                  border: Border.all(
                    width: 2,
                    color: primaryColor,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(radius ?? 30)),
                )
              : null,
      child: MaterialButton(
        onPressed: onPressed,
        padding: const EdgeInsets.symmetric(vertical: 0),
        color: color,
        disabledElevation: 0,
        disabledColor: Theme.of(context).disabledColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius ?? 30),
        ),
        elevation: 0,
        child: child,
      ),
    );
  }
}
