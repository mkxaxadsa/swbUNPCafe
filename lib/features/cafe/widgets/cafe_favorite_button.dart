import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/config/app_colors.dart';
import '../../../core/widgets/texts/text_b.dart';

class CafeFavoriteButton extends StatelessWidget {
  const CafeFavoriteButton({
    super.key,
    required this.active,
    required this.onPressed,
  });

  final bool active;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 35,
          width: 163,
          decoration: BoxDecoration(
            color: active ? AppColors.pink2 : AppColors.white,
            borderRadius: BorderRadius.circular(24),
          ),
          child: CupertinoButton(
            onPressed: onPressed,
            padding: EdgeInsets.zero,
            minSize: 35,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                    active ? 'assets/star.svg' : 'assets/star2.svg'),
                const SizedBox(width: 10),
                const TextB('Add to Favorite', fontSize: 14),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
