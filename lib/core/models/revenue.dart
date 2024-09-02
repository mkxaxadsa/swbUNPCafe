import 'package:hive_flutter/hive_flutter.dart';

@HiveType(typeId: 2)
class Revenue {
  @HiveField(0)
  final int id;
  @HiveField(1)
  int price;
  @HiveField(2)
  String category;
  @HiveField(3)
  String date;
  @HiveField(4)
  bool revenue;

  Revenue({
    required this.id,
    required this.price,
    required this.category,
    required this.date,
    required this.revenue,
  });
}

class RevenueAdapter extends TypeAdapter<Revenue> {
  @override
  final typeId = 2;

  @override
  Revenue read(BinaryReader reader) {
    return Revenue(
      id: reader.read(),
      price: reader.read(),
      category: reader.read(),
      date: reader.read(),
      revenue: reader.read(),
    );
  }

  @override
  void write(BinaryWriter writer, Revenue obj) {
    writer.write(obj.id);
    writer.write(obj.price);
    writer.write(obj.category);
    writer.write(obj.date);
    writer.write(obj.revenue);
  }
}
