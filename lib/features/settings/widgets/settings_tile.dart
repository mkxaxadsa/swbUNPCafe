import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

import '../../../core/config/app_colors.dart';
import '../../../core/widgets/texts/text_b.dart';

class SettingsTile extends StatelessWidget {
  const SettingsTile({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64,
      margin: const EdgeInsets.symmetric(horizontal: 24),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(14),
      ),
      child: CupertinoButton(
        onPressed: () {
          if (title == 'Support') {
            context.push('/settings/support');
          } else if (title == 'Terms of Service') {
            context.push('/settings/terms');
          } else if (title == 'Privacy Policy') {
            context.push('/settings/privacy');
          }
        },
        padding: EdgeInsets.zero,
        child: Row(
          children: [
            const SizedBox(width: 14),
            TextB(title, fontSize: 14),
          ],
        ),
      ),
    );
  }
}
