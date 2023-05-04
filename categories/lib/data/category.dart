import 'package:hive/hive.dart';

part 'category.g.dart';

@HiveType(typeId: 0)
class Category extends HiveObject {
  @HiveField(0)
  String title;

  @HiveField(1)
  Map<String, String> items;

  Category(this.title, this.items);
}
