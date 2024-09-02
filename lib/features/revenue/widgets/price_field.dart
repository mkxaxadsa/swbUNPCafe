import 'package:cafe_test/core/widgets/texts/text_b.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../core/config/app_colors.dart';

class PriceField extends StatelessWidget {
  const PriceField({
    super.key,
    required this.controller,
    required this.onChanged,
  });

  final TextEditingController controller;
  final void Function() onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 52,
      decoration: BoxDecoration(
        color: AppColors.pink2,
        borderRadius: BorderRadius.circular(8),
      ),
      child: TextField(
        controller: controller,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
          LengthLimitingTextInputFormatter(6),
        ],
        textCapitalization: TextCapitalization.sentences,
        style: const TextStyle(
          color: AppColors.grey1,
          fontFamily: Fonts.medium,
          fontSize: 15,
        ),
        decoration: const InputDecoration(
          suffixIcon: Column(),
          prefixIcon: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextB('\$', fontSize: 16),
            ],
          ),
          contentPadding: EdgeInsets.symmetric(
            horizontal: 14,
            vertical: 0,
          ),
          hintText: 'Enter the price',
          hintStyle: TextStyle(
            color: AppColors.grey1,
            fontFamily: Fonts.medium,
            fontSize: 15,
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
          ),
          enabledBorder: OutlineInputBorder(
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
