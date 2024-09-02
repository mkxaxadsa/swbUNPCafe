import 'package:hive_flutter/hive_flutter.dart';

@HiveType(typeId: 1)
class Cafe {
  @HiveField(0)
  final int id;
  @HiveField(1)
  String name;
  @HiveField(2)
  String country;
  @HiveField(3)
  String address;
  @HiveField(4)
  String note;
  @HiveField(5)
  bool favorite;
  @HiveField(6)
  String image1;
  @HiveField(7)
  String image2;
  @HiveField(8)
  String image3;
  @HiveField(9)
  String image4;

  Cafe({
    required this.id,
    required this.name,
    required this.country,
    required this.address,
    required this.note,
    required this.favorite,
    required this.image1,
    required this.image2,
    required this.image3,
    required this.image4,
  });
}

class CafeAdapter extends TypeAdapter<Cafe> {
  @override
  final typeId = 1;

  @override
  Cafe read(BinaryReader reader) {
    return Cafe(
      id: reader.read(),
      name: reader.read(),
      country: reader.read(),
      address: reader.read(),
      note: reader.read(),
      favorite: reader.read(),
      image1: reader.read(),
      image2: reader.read(),
      image3: reader.read(),
      image4: reader.read(),
    );
  }

  @override
  void write(BinaryWriter writer, Cafe obj) {
    writer.write(obj.id);
    writer.write(obj.name);
    writer.write(obj.country);
    writer.write(obj.address);
    writer.write(obj.note);
    writer.write(obj.favorite);
    writer.write(obj.image1);
    writer.write(obj.image2);
    writer.write(obj.image3);
    writer.write(obj.image4);
  }
}
