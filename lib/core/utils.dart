import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'models/cafe.dart';
import 'models/inventory.dart';
import 'models/news.dart';
import 'models/revenue.dart';

bool onboard = true;

Future<void> getData() async {
  final prefs = await SharedPreferences.getInstance();
  // await prefs.remove('onboard');
  onboard = prefs.getBool('onboard') ?? true;
}

Future<void> saveData() async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setBool('onboard', false);
}

bool getButtonActive(List<TextEditingController> controllers) {
  for (TextEditingController controller in controllers) {
    if (controller.text.isEmpty) return false;
  }
  return true;
}

int getCurrentTimestamp() {
  return DateTime.now().millisecondsSinceEpoch ~/ 1000;
}

String formatTimestamp(int timestamp) {
  DateTime date = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
  String formattedDate = DateFormat('dd.MM.yyyy').format(date);
  return formattedDate;
}

String formatDateTime(DateTime date) {
  String formattedDate = DateFormat('dd.MM.yyyy').format(date);
  return formattedDate;
}

DateTime convertToDateTime(String date) {
  return DateFormat('dd.MM.yyyy').parse(date);
}

double getStatusBar(BuildContext context) {
  return MediaQuery.of(context).viewPadding.top;
}

double getBottom(BuildContext context) {
  return MediaQuery.of(context).viewPadding.bottom;
}

Future<XFile> pickImage() async {
  try {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == null) return XFile('');
    return image;
  } catch (e) {
    log(e.toString());
    return XFile('');
  }
}

Future<String> filterValidImage(String url) async {
  final dio = Dio();
  try {
    final response = await dio.get(
      url,
      options: Options(
        receiveTimeout: const Duration(seconds: 5),
        sendTimeout: const Duration(seconds: 5),
      ),
    );
    log(response.statusCode.toString());
    if (response.statusCode == 200) return url;
    return '';
  } catch (e) {
    log(e.toString());
    return '';
  }
}

String inventorybox = 'inventorybox';
List<Cafe> cafeList = [];
List<Inventory> inventoryList = [];
List<Revenue> revenuesList = [];
List<News> newsList = [];

Future<void> initHive() async {
  await Hive.initFlutter();
  // await Hive.deleteBoxFromDisk(inventorybox);
  Hive.registerAdapter(CafeAdapter());
  Hive.registerAdapter(InventoryAdapter());
  Hive.registerAdapter(RevenueAdapter());
  Hive.registerAdapter(NewsAdapter());
}

Future<void> getCafes() async {
  final box = await Hive.openBox(inventorybox);
  List data = box.get('cafeList') ?? [];
  cafeList = data.cast<Cafe>();
}

Future<void> updateCafes() async {
  final box = await Hive.openBox(inventorybox);
  box.put('cafeList', cafeList);
  cafeList = await box.get('cafeList');
}

Future<void> getInventories() async {
  final box = await Hive.openBox(inventorybox);
  List data = box.get('inventoryList') ?? [];
  inventoryList = data.cast<Inventory>();
}

Future<void> updateInventories() async {
  final box = await Hive.openBox(inventorybox);
  box.put('inventoryList', inventoryList);
  inventoryList = await box.get('inventoryList');
}

Future<void> getRevenues() async {
  final box = await Hive.openBox(inventorybox);
  List data = box.get('revenuesList') ?? [];
  revenuesList = data.cast<Revenue>();
}

Future<void> updateRevenues() async {
  final box = await Hive.openBox(inventorybox);
  box.put('revenuesList', revenuesList);
  revenuesList = await box.get('revenuesList');
}

Future<void> getNews() async {
  final box = await Hive.openBox(inventorybox);
  List data = box.get('newsList') ?? internetNews;
  newsList = data.cast<News>();
}

Future<void> updateNews() async {
  final box = await Hive.openBox(inventorybox);
  box.put('newsList', newsList);
  newsList = await box.get('newsList');
}

int getTotalAmount() {
  int total = 0;
  for (Revenue revenue in revenuesList) {
    if (!revenue.revenue) {
      total += revenue.price;
    }
  }
  return total * 2;
}
