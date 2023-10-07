import 'package:meter_reading/widgets/custom_svg.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class WidgetCardSetting extends StatelessWidget {
  WidgetCardSetting({
    super.key,
    required this.text,
    required this.image,
    this.onTap,
  });
  String text, image;
  Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6),
      ),
      shadowColor: Colors.grey[200],
      child: ListTile(
        onTap: onTap,
        contentPadding: const EdgeInsets.only(right: 8),
        minLeadingWidth: 20,
        leading: CustomSvg(image),
        title: Text(
          text,
          style: Theme.of(context)
              .textTheme
              .bodyLarge!
              .copyWith(color: const Color(0xff5F5F5F)),
        ),
      ),
    );
  }
}
