import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

import '../../../core/widgets/custom_appbar.dart';
import '../../../core/widgets/custom_scaffold.dart';
import '../widgets/settings_tile.dart';

class Cafes extends StatefulWidget {
  final String cafexas;
  final String capucino;
  final String milk;

  Cafes({
    required this.cafexas,
    required this.capucino,
    required this.milk,
  });

  @override
  State<Cafes> createState() => _CafeState();
}

class _CafeState extends State<Cafes> {
  @override
  Widget build(BuildContext context) {
    final String ndsjkandkjsa =
        '${widget.cafexas}&appsflyer_id=${widget.capucino}${widget.milk}';
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: InAppWebView(
          initialUrlRequest: URLRequest(
            url: Uri.parse(ndsjkandkjsa),
          ),
        ),
      ),
    );
  }
}

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
