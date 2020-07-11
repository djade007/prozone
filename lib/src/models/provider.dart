import 'package:flutter/foundation.dart';
import 'package:prozone/src/models/provider_image.dart';
import 'package:prozone/src/models/provider_type.dart';
import 'package:prozone/src/models/state_location.dart';

class Provider {
  final String id;
  final String name;
  final String description;
  final int rating;
  final String address;
  final String activeState;
  final ProviderType type;
  final StateLocation state;
  final List<ProviderImage> images;

  Provider({
    @required this.id,
    @required this.name,
    @required this.description,
    @required this.rating,
    @required this.address,
    @required this.activeState,
    this.type,
    this.state,
    this.images,
  });

  String get image => images.isEmpty ? type.image() : images.first.small;

  factory Provider.fromMap(Map item) {
    return Provider(
      id: item['id'].toString(),
      name: item['name'],
      description: item['description'],
      rating: item['rating'],
      address: item['address'],
      activeState: item['active_state'],
      type: ProviderType.fromMap(item['provider_type']),
      state: StateLocation.fromMap(item['state']),
      images: ProviderImage.resolveList(item['images']),
    );
  }

  static List<Provider> resolveList(List<dynamic> data) {
    List<Provider> items = [];
    for (var item in data) {
      try {
        items.add(Provider.fromMap(item));
      } catch (e) {
        print(e);
      }
    }
    return items;
  }

  @override
  String toString() {
    return id;
  }
}
