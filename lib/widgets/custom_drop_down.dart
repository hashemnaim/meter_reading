// ignore_for_file: use_key_in_widget_constructors
import 'package:meter_reading/config/theme/light_theme_colors.dart';
import 'package:meter_reading/core/constants/images_path.dart';
import 'package:meter_reading/widgets/custom_svg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDropDown extends StatelessWidget {
  final List<Item>? itemsList;
  final String? hint;
  final Function(Item?)? onChanged;

  const CustomDropDown({
    this.itemsList,
    this.hint = "",
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5.r),
        border: Border.all(color: Colors.grey[200]!),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 3),
        child: DropdownButton(
          underline: Container(),
          isExpanded: true,
          elevation: 0,
          hint: Text("  ${hint!}",
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: const Color(0xff848484),
                  )),
          icon: const Padding(
              padding: EdgeInsets.all(8.0),
              child: CustomSvg(
                ImagePaths.arrowDropDownCircle,
                height: 22,
              )),
          borderRadius: BorderRadius.circular(2),
          items: itemsList!
              .map(
                (Item item) => DropdownMenuItem<Item>(
                  value: item,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.r),
                      color: item.name == hint
                          ? LightThemeColors.primaryColor.withOpacity(0.2)
                          : LightThemeColors.white,
                    ),
                    child: Row(
                      children: [
                        Checkbox(
                            fillColor: MaterialStateProperty.resolveWith<Color>(
                                (Set<MaterialState> states) {
                              if (states.contains(MaterialState.disabled)) {
                                return item.name == hint
                                    ? LightThemeColors.buttonColor
                                    : LightThemeColors.white;
                              }
                              return LightThemeColors.buttonColor;
                            }),
                            splashRadius: 12,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4)),
                            value: item.name == hint,
                            onChanged: null),
                        Text(item.name!,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(color: const Color(0xff848484))),
                      ],
                    ),
                  ),
                ),
              )
              .toList(),
          onChanged: onChanged,
        ),
      ),
    );
  }
}

class Item {
  int? id;
  String? name;

  Item({this.id, this.name});

  Item.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    return data;
  }
}
