import 'package:flutter/cupertino.dart';

import '../../../core/config/app_colors.dart';
import '../../../core/widgets/texts/text_e.dart';

class TabWidget extends StatelessWidget {
  const TabWidget({
    super.key,
    required this.title,
    required this.active,
    required this.value,
    required this.onPressed,
  });

  final String title;
  final bool active;
  final bool value;
  final void Function(bool) onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 118,
      decoration: BoxDecoration(
        color: active ? AppColors.black : AppColors.white,
        borderRadius: BorderRadius.circular(30),
        border: Border.all(
          width: 1,
          color: AppColors.black,
        ),
      ),
      child: CupertinoButton(
        onPressed: () {
          onPressed(value);
        },
        padding: EdgeInsets.zero,
        minSize: 40,
        child: Center(
          child: TextE2(
            title,
            fontSize: 15,
            color: active ? AppColors.white : AppColors.black,
          ),
        ),
      ),
    );
  }
}
