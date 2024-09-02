import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../config/app_colors.dart';

class TxtField extends StatelessWidget {
  const TxtField({
    super.key,
    required this.controller,
    this.hintText = '',
    this.email = false,
    this.multiline = false,
    required this.onChanged,
  });

  final TextEditingController controller;
  final String hintText;
  final bool email;
  final bool multiline;
  final void Function() onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: multiline ? null : 50,
      decoration: BoxDecoration(
        color: AppColors.textField,
        borderRadius: BorderRadius.circular(8),
      ),
      child: TextField(
        controller: controller,
        keyboardType: email
            ? TextInputType.emailAddress
            : multiline
                ? TextInputType.multiline
                : null,
        maxLines: multiline ? null : 1,
        inputFormatters: [
          LengthLimitingTextInputFormatter(multiline ? 200 : 20),
          // FilteringTextInputFormatter.allow(RegExp("[a-zA-Zа-яА-Я]")),
          // FilteringTextInputFormatter.digitsOnly,
        ],
        textCapitalization: TextCapitalization.sentences,
        style: const TextStyle(
          color: AppColors.grey1,
          fontFamily: Fonts.medium,
          fontSize: 15,
        ),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(
            horizontal: 14,
            vertical: multiline ? 14 : 0,
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
          controller.text = value;
          onChanged();
        },
      ),
    );
  }
}
