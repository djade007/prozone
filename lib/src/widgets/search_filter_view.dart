import 'package:prozone/src/init.dart';
import 'package:prozone/src/models/filter_state.dart';
import 'package:prozone/src/models/provider.dart';

class SearchFilterView extends StatefulWidget {
  final FilterState filterState;

  const SearchFilterView({Key key, @required this.filterState})
      : super(key: key);

  @override
  _SearchFilterViewState createState() => _SearchFilterViewState();
}

class _SearchFilterViewState extends State<SearchFilterView> {
  FilterState _filterState;

  @override
  void initState() {
    super.initState();
    _filterState = widget.filterState;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.all(10),
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.close),
                color: orange_color,
                iconSize: 30,
              ),
              FlatButton(
                onPressed: () {
                  setState(() {
                    _filterState.clear();
                  });
                },
                child: Text('Clear'),
                textColor: grey_color,
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Styles.greyText('Provider Types').space(
                  bottom: 20,
                ),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Please type here',
                    hintStyle: TextStyle(fontSize: 14, color: grey_color),
                  ),
                  onChanged: (val) {
                    setState(() {
                      _filterState.searchProviders(val);
                    });
                  },
                ).space(),
                _displayProviders(),
                Styles.greyText('RATINGS').space(top: 20, bottom: 0),
                ..._filterState.ratings
                    .map((filter) => _starRow(filter))
                    .toList(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _providerRow(FilterItem<Provider> filter) {
    return Row(
      key: Key(filter.item.id),
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Styles.orangeText(
          filter.item.name,
          fontSize: 13,
        ),
        Checkbox(
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          value: filter.selected,
          onChanged: (value) {
            setState(() {
              filter.selected = value;
            });
          },
        )
      ],
    );
  }

  Widget _genderRow(FilterItem<String> filter) {
    return Row(
      key: Key(filter.item),
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Styles.orangeText(
          filter.item,
          fontSize: 13,
        ),
        Checkbox(
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          value: filter.selected,
          onChanged: (value) {
            setState(() {
              filter.selected = value;
            });
          },
        )
      ],
    );
  }

  Widget _starRow(FilterItem<int> filter) {
    return Row(
      key: Key('star_${filter.item}'),
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Row(
          children: <Widget>[
            Styles.orangeText(
              filter.item.toString(),
              fontSize: 13,
            ),
            SizedBox(width: 3),
            Icon(
              Icons.star,
              color: grey_color,
              size: 16,
            )
          ],
        ),
        Checkbox(
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          value: filter.selected,
          onChanged: (value) {
            setState(() {
              filter.selected = value;
            });
          },
        )
      ],
    );
  }

  Widget _displayProviders() {
    final all = _filterState.providers.where((filter) => filter.display);

    if (all.isEmpty)
      return Styles.greyText(
        'No match found',
        fontSize: 12,
      );

    return Column(children: all.map((filter) => _providerRow(filter)).toList());
  }

  Widget _buildPriceBlock(double price) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: light_grey_color, width: 1.2),
      ),
      padding: EdgeInsets.only(
        left: 3,
        top: 3,
        bottom: 3,
        right: 16,
      ),
      child: Row(
        children: <Widget>[
          Styles.orangeText('NGN', fontSize: 12),
          SizedBox(width: 5),
          Styles.greyText(
            Utils.formatPrice(price),
            fontSize: 12,
          ),
        ],
      ),
    );
  }
}
