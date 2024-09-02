import 'package:flutter/material.dart';
import 'package:date_picker_plus/date_picker_plus.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/config/app_colors.dart';
import '../../../core/utils.dart';

class DateField extends StatelessWidget {
  const DateField({
    super.key,
    required this.controller,
    required this.onDate,
  });

  final TextEditingController controller;
  final void Function(String) onDate;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        color: AppColors.textField,
        borderRadius: BorderRadius.circular(8),
      ),
      child: TextField(
        controller: controller,
        keyboardType: TextInputType.number,
        textCapitalization: TextCapitalization.sentences,
        style: const TextStyle(
          color: AppColors.grey1,
          fontFamily: Fonts.medium,
          fontSize: 15,
        ),
        readOnly: true,
        decoration: InputDecoration(
          suffixIcon: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 7),
                child: SvgPicture.asset('assets/calendar.svg'),
              ),
            ],
          ),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 14,
            vertical: 0,
          ),
          hintText: 'Date',
          hintStyle: const TextStyle(
            color: AppColors.grey1,
            fontFamily: Fonts.medium,
            fontSize: 15,
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
          ),
        ),
        onTapOutside: (event) {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        onTap: () async {
          final date = await showDatePickerDialog(
            context: context,
            leadingDateTextStyle: const TextStyle(
              color: AppColors.purple1,
              fontWeight: FontWeight.w700,
              fontFamily: 'InterB',
            ),
            enabledCellsTextStyle: const TextStyle(
              color: AppColors.black,
            ),
            currentDateTextStyle: const TextStyle(
              color: AppColors.white,
            ),
            currentDateDecoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: const Color(0xffFB41FF),
              // border: Border.all(color: const Color(0xffFB41FF)),
            ),
            disabledCellsTextStyle: const TextStyle(
              color: AppColors.black,
              fontSize: 12,
              fontWeight: FontWeight.w500,
              fontFamily: 'InterM',
            ),
            daysOfTheWeekTextStyle: const TextStyle(
              color: Color(0xff3d3d40),
              fontSize: 12,
              fontWeight: FontWeight.w600,
              fontFamily: 'InterM',
            ),
            splashColor: AppColors.pink1,
            highlightColor: AppColors.pink1,
            slidersColor: AppColors.purple1,
            currentDate: controller.text.isEmpty
                ? DateTime.now()
                : convertToDateTime(controller.text),
            minDate: DateTime(2020, 1, 1),
            maxDate: DateTime(2030, 1, 1),
            padding: EdgeInsets.zero,
            contentPadding: const EdgeInsets.all(24),
            height: 318,
          );
          if (date != null) {
            onDate(formatDateTime(date));
          }
        },
      ),
    );
  }
}
