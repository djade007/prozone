import 'package:prozone/src/init.dart';
import 'package:prozone/src/models/provider.dart';

class FilterState {
  final List<FilterItem<Provider>> providers = [];
  final genders = [FilterItem('Male'), FilterItem('Female')];
  final ratings = [5, 4, 3, 2, 1].map((star) => FilterItem(star)).toList();

  RangeValues rangeValues = RangeValues(3000, 30000);


  void searchProviders(String key) {
    if (key.isEmpty) {
      // show all
      providers.forEachIndex((item, index) => item.display = index < 7);
      return;
    }
    int count = 0;
    for (var Provider in providers) {
      if (Provider.item.name.toLowerCase().contains(key.toLowerCase()) &&
          count < 7) {
        Provider.display = true;
        count++;
      } else {
        Provider.display = false;
      }
    }
  }

  void clear() {
    providers
        .forEachIndex((item, index) => item.reset()..display = index < 7);
    genders.forEach((item) => item.reset());
    ratings.forEach((item) => item.reset());
  }

  Map<String, String> toMap() {
    return {
      'providers': _selected(providers),
      'gender': _selected(genders),
      'ratings': _selected(ratings),
      'minPrice': rangeValues.start.toString(),
      'maxPrice': rangeValues.end.toString(),
    };
  }

  String _selected(List<FilterItem> items) {
    return items.where((filter) => filter.selected).join(',');
  }

  @override
  String toString() {
    return toMap().toString();
  }
}

class FilterItem<T> {
  bool selected = false;
  bool display = true;

  final T item;

  FilterItem(this.item);

  FilterItem reset() {
    selected = false;
    return this;
  }

  @override
  String toString() {
    return item.toString();
  }
}
