import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:prozone/src/components/provider/provider_page.dart';
import 'package:prozone/src/controllers/dashboard/home_view_controller.dart';
import 'package:prozone/src/init.dart';
import 'package:prozone/src/models/filter_state.dart';
import 'package:prozone/src/models/provider.dart';
import 'package:prozone/src/widgets/buttons/filter_button.dart';
import 'package:prozone/src/widgets/search_filter_view.dart';

class HomeView extends StatelessWidget {
  final FilterState _filterState = FilterState();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeViewController>(
      init: HomeViewController(),
      builder: (_) => _buildPage(context),
    );
  }

  Widget _buildPage(BuildContext context) {
    return Column(
      children: <Widget>[
        Material(
          borderRadius: BorderRadius.circular(5),
          elevation: 5,
          clipBehavior: Clip.antiAlias,
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Search Providers...',
              hintStyle: TextStyle(fontSize: 14),
              border: OutlineInputBorder(borderSide: BorderSide.none),
            ),
          ),
        ).space(bottom: 10),
        FilterButton(
          title: 'Filters',
          onPressed: () async {
            if (_filterState == null) return;
            await showDialog(
              barrierDismissible: false,
              context: context,
              builder: (context) {
                return SearchFilterView(filterState: _filterState);
              },
            );
            print(_filterState);
          },
          icon: 'toggles',
        ),
        _exploreZone(),
        _buildTopRated(),
        _buildOthers(),
      ],
    );
  }

  Widget _exploreZone() {
    return Column(
      children: [
        Styles.titleText('Explore ProZone').left().space(
              top: 20,
              bottom: 20,
            ),
        SizedBox(
          height: 140,
          child: ListView.builder(
            primary: false,
            scrollDirection: Axis.horizontal,
            itemCount: Application.providerTypes.length,
            itemBuilder: (context, index) {
              final item = Application.providerTypes[index];
              return SizedBox(
                width: 145,
                child: Card(
                  child: Column(
                    children: [
                      Expanded(
                          child: CachedNetworkImage(
                        imageUrl: item.image(),
                        fit: BoxFit.cover,
                      )),
                      Styles.orangeText(
                        item.name,
                        bold: true,
                      ).space(bottom: 10, top: 10),
                    ],
                  ),
                ),
              ).space(bottom: 0, right: 10);
            },
          ),
        )
      ],
    );
  }

  Widget _buildList(String title, List<Provider> providers) {
    return Column(
      children: [
        Row(children: [
          Styles.titleText(title),
          IconButton(
            visualDensity: VisualDensity.compact,
            icon: Icon(Icons.keyboard_arrow_right),
            onPressed: () {},
          ),
        ]).space(
          top: 20,
          bottom: 20,
        ),
        providers == null
            ? Align(
                alignment: Alignment.centerLeft,
                child: CircularProgressIndicator(),
              )
            : SizedBox(
                height: 180,
                child: ListView.builder(
                  primary: false,
                  scrollDirection: Axis.horizontal,
                  itemCount: providers.length,
                  itemBuilder: (context, index) {
                    final item = providers[index];
                    return SizedBox(
                      width: 160,
                      child: InkWell(
                        onTap: () {
                          Get.toNamed(ProviderPage.routeName, arguments: item);
                        },
                        child: Card(
                          elevation: 0,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CachedNetworkImage(
                                imageUrl: item.image,
                                height: 100,
                                fit: BoxFit.fitHeight,
                              ).space(bottom: 5),
                              Row(children: [
                                Expanded(
                                  child: Styles.orangeText(item.name,
                                      fontSize: 12),
                                ),
                                Icon(
                                  Icons.star,
                                  color: orange_color,
                                  size: 14,
                                ),
                                Styles.orangeText(
                                  item.rating.toString(),
                                  fontSize: 12,
                                ),
                              ]).space(bottom: 5),
                              Row(
                                children: [
                                  SvgPicture.asset('assets/svg/location.svg'),
                                  SizedBox(width: 10),
                                  Styles.greyDarkText(item.state.name,
                                      fontSize: 12)
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ).space(bottom: 0, right: 10);
                  },
                ),
              ),
      ],
    );
  }

  Widget _buildTopRated() {
    final HomeViewController controller = Get.find();
    return _buildList('Top Rated', controller.topProviders);
  }

  Widget _buildOthers() {
    final HomeViewController controller = Get.find();

    if (controller.others == null || controller.others.isEmpty) {
      return SizedBox();
    }

    List<Widget> list = [];
    controller.others.forEach((type, providers) {
      list.add(_buildList(type.name, providers));
    });

    return Column(
      children: list,
    );
  }
}
