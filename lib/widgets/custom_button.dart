import 'package:flutter/material.dart';
import '../core/constants/app_constants.dart';

// ignore: must_be_immutable
class CustomPrimaryButton extends StatelessWidget {
  CustomPrimaryButton({
    Key? key,
    required this.text,
    required this.onPress,
    this.isDisabled = false,
    this.width = 327,
    this.borderRadius,
    this.isSmallText = false,
  }) : super(key: key);

  String text;
  VoidCallback onPress;

  BorderRadiusGeometry? borderRadius;
  bool? isDisabled;
  double width;
  bool? isSmallText;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: width,
      child: ElevatedButton(
        onPressed: isDisabled == true ? null : onPress,
        child: Text(text),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final String text;
  final TextStyle style;
  final Color backgroundColor;
  final VoidCallback onPressed;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    required this.style,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
      ),
      child: Text(text, style: style),
    );
  }
}

// ignore: must_be_immutable
class CustomTextButton extends StatelessWidget {
  CustomTextButton({
    Key? key,
    required this.text,
    required this.color,
    required this.onPress,
    this.background,
    this.enable = true,
    this.isOutlined = false,
    this.icon,
    this.borderRadius,
  }) : super(key: key);

  String text;
  Color color;
  bool? background;
  Function() onPress;
  double? borderRadius;

  bool? isOutlined;
  bool? enable;
  IconData? icon;

  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return const Color(0xffF8FFFB);
      }
      return const Color(0xffF8FFFB);
    }

    return TextButton(
      onPressed: enable == true ? onPress : null,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.resolveWith(getColor),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              borderRadius ?? kBorderRadius,
            ),
            side: BorderSide(
              color: isOutlined == true ? color : Colors.transparent,
            ),
          ),
        ),
      ),
      child: Text(
        text,
        style: Theme.of(context)
            .textTheme
            .bodyMedium!
            .copyWith(color: color, fontWeight: FontWeight.bold),
      ),
    );
  }
}

// ignore: must_be_immutable
class CustomIconButton extends StatelessWidget {
  CustomIconButton({
    Key? key,
    required this.icon,
    required this.onTap,
    required this.text,
    this.color,
  }) : super(key: key);

  Widget icon;
  Function() onTap;
  Color? color;
  String? text;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 45,
        width: 45,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(kBorderRadius),
          boxShadow: const [
            BoxShadow(
              blurRadius: 7,
              spreadRadius: 1,
            )
          ],
        ),
        child: Row(
          children: [
            Text(
              text!,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: color, fontWeight: FontWeight.bold),
            ),
            icon
          ],
        ),
      ),
    );
  }
}
