import 'package:flutter/foundation.dart';

class ProviderImage {
  final String id;
  final String name;
  final String small;
  final String thumbnail;
  final String medium;

  ProviderImage({
    @required this.id,
    @required this.name,
    @required this.small,
    @required this.thumbnail,
    @required this.medium,
  });

  factory ProviderImage.fromMap(Map item) {
    return ProviderImage(
      id: item['id'].toString(),
      name: item['name'],
      thumbnail: item['formats']['thumbnail']['url'],
      small: item['formats']['small']['url'],
      medium: item['formats']['medium'] != null
          ? item['formats']['medium']['url']
          : item['formats']['large'] != null
              ? item['formats']['large']['url']
              : null,
    );
  }

  static List<ProviderImage> resolveList(List<dynamic> data) {
    if (data == null) return null;
    final items = data.map((item) => ProviderImage.fromMap(item));
    return List<ProviderImage>.from(items);
  }

  @override
  String toString() {
    return id;
  }
}
