import 'package:meter_reading/config/theme/light_theme_colors.dart';
import 'package:meter_reading/core/constants/app_constants.dart';
import 'package:meter_reading/core/helper/valdtion_helper.dart';
import 'package:meter_reading/widgets/custom_input.dart';
import 'package:meter_reading/widgets/custom_svg.dart';
import 'package:datetime_picker_formfield_new/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hijri/hijri_calendar.dart';
import 'package:intl/intl.dart';

class BasicDateField extends StatelessWidget {
  final format = DateFormat("yyyy-MM-dd");

  BasicDateField({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Text('Basic date field (${format.pattern})'),
      DateTimeField(
        format: format,
        onShowPicker: (context, currentValue) {
          return showDatePicker(
            context: context,
            firstDate: DateTime(1900),
            initialDate: currentValue ?? DateTime.now(),
            lastDate: DateTime(2100),
          );
        },
      ),
    ]);
  }
}

class BasicTimeField extends StatelessWidget {
  final format = DateFormat("HH:mm");

  BasicTimeField({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Text('Basic time field (${format.pattern})'),
      DateTimeField(
        format: format,
        onShowPicker: (context, currentValue) async {
          final time = await showTimePicker(
            context: context,
            initialTime: TimeOfDay.fromDateTime(currentValue ?? DateTime.now()),
          );
          return DateTimeField.convert(time);
        },
      ),
    ]);
  }
}

// ignore: must_be_immutable
class BasicDateTimeField extends StatelessWidget {
  final format = DateFormat("yyyy-MM-dd");

  BasicDateTimeField({super.key, this.leadingIcon, this.hint});
  String? leadingIcon;
  String? hint;

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      DateTimeField(
        format: format,
        decoration: customInputDecoration(hint: hint, leadingIcon: leadingIcon),
        style: Theme.of(context).textTheme.bodyMedium,
        validator: (value) =>
            ValidationHelper.validationHelper.validateNull(value.toString()),
        onShowPicker: (context, currentValue) async {
          return await showDatePicker(
                  context: context,
                  firstDate: DateTime(1900),
                  initialDate: currentValue ?? DateTime.now(),
                  lastDate: DateTime(2100),
                  cancelText: "إلغاء",
                  initialDatePickerMode: DatePickerMode.year,
                  // locale: const Locale('ar'),
                  routeSettings: const RouteSettings(),
                  confirmText: "تأكيد")
              .then((DateTime? date) async {
            if (date != null) {
              HijriCalendar.fromDate(DateTime(date.year, date.day, date.month));

              // DateTimeField.combine(date, time);
            } else {
              return currentValue;
            }
            return null;
          });
        },
      ),
    ]);
  }

  InputDecoration customInputDecoration({
    String? leadingIcon,
    String? hint,
  }) {
    return InputDecoration(
      fillColor: LightThemeColors.white,
      contentPadding: EdgeInsets.zero,
      filled: true,
      prefixIcon: leadingIcon == null
          ? null
          : Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Container(
                width: 50.w,
                height: 50.h,
                decoration: const BoxDecoration(
                    color: LightThemeColors.primaryColor,
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(kBorderRadius),
                        topRight: Radius.circular(kBorderRadius))),
                child: Padding(
                  padding: const EdgeInsets.all(kPadding / 1.6),
                  child: CustomSvg(
                    leadingIcon,
                  ),
                ),
              ),
            ),
      hintText: "  $hint",
      border: outlineInputBorder(),
      disabledBorder: outlineInputBorder(),
      enabledBorder: outlineInputBorder(),
      focusedBorder: outlineInputBorder(),
    );
  }
}
