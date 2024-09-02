import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../config/app_colors.dart';

class NumberField extends StatelessWidget {
  const NumberField({
    super.key,
    required this.controller,
    this.hintText = '',
    required this.onChanged,
  });

  final TextEditingController controller;
  final String hintText;
  final void Function() onChanged;

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
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
          LengthLimitingTextInputFormatter(6),
          // FilteringTextInputFormatter.allow(RegExp("[a-zA-Zа-яА-Я]")),
        ],
        textCapitalization: TextCapitalization.sentences,
        style: const TextStyle(
          color: AppColors.grey1,
          fontFamily: Fonts.medium,
          fontSize: 15,
        ),
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 14,
            vertical: 0,
          ),
          hintText: hintText,
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
        onChanged: (value) {
          // controller.text = value;
          onChanged();
        },
      ),
    );
  }
}
