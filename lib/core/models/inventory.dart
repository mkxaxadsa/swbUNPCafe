import 'package:hive_flutter/hive_flutter.dart';

@HiveType(typeId: 0)
class Inventory {
  @HiveField(0)
  final int id;
  @HiveField(1)
  String name;
  @HiveField(2)
  int price;
  @HiveField(3)
  int salePrice;
  @HiveField(4)
  String image;
  @HiveField(5)
  String category;

  Inventory({
    required this.id,
    required this.name,
    required this.price,
    required this.salePrice,
    required this.image,
    required this.category,
  });
}

class InventoryAdapter extends TypeAdapter<Inventory> {
  @override
  final typeId = 0;

  @override
  Inventory read(BinaryReader reader) {
    return Inventory(
      id: reader.read(),
      name: reader.read(),
      price: reader.read(),
      salePrice: reader.read(),
      image: reader.read(),
      category: reader.read(),
    );
  }

  @override
  void write(BinaryWriter writer, Inventory obj) {
    writer.write(obj.id);
    writer.write(obj.name);
    writer.write(obj.price);
    writer.write(obj.salePrice);
    writer.write(obj.image);
    writer.write(obj.category);
  }
}
