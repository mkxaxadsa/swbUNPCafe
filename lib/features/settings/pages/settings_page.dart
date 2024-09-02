import 'package:flutter/material.dart';

import '../../../core/widgets/custom_appbar.dart';
import '../../../core/widgets/custom_scaffold.dart';
import '../widgets/settings_tile.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScaffold(
      body: Column(
        children: [
          CustomAppbar(
            title: 'Settings',
            settings: true,
          ),
          SizedBox(height: 12),
          SettingsTile(title: 'Support'),
          SizedBox(height: 14),
          SettingsTile(title: 'Terms of Service'),
          SizedBox(height: 14),
          SettingsTile(title: 'Privacy Policy'),
        ],
      ),
    );
  }
}
