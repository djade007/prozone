import 'package:flutter/foundation.dart';

class StateLocation {
  final String id;
  final String name;

  StateLocation({
    @required this.id,
    @required this.name,
  });

  factory StateLocation.fromMap(Map item) {
    if (item == null) {
      // default to Lagos
      return StateLocation(id: '1', name: 'Lagos');
    }
    return StateLocation(
      id: item['id'].toString(),
      name: item['name'],
    );
  }

    static List<StateLocation> resolveList(List<dynamic> data) {
    final items = data.map((item) => StateLocation.fromMap(item));
    return List<StateLocation>.from(items);
  }

  @override
  String toString() {
    return id;
  }
}
