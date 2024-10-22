import 'package:isar/isar.dart';

part 'cache_model.g.dart';

@Collection()
class CacheModel {
  @Id()
  late String key;
  dynamic value;
}