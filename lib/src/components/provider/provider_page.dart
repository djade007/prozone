import 'package:dotted_border/dotted_border.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:multi_image_picker/multi_image_picker.dart';
import 'package:prozone/src/controllers/provider/provider_controller.dart';
import 'package:prozone/src/init.dart';

class ProviderPage extends StatelessWidget {
  static const routeName = 'provider';

  final controller = Get.put(ProviderController());

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      // The number of tabs / content sections to display.
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          bottom: TabBar(
            tabs: [
              Tab(
                child: Text('Pictures'),
              ),
              Tab(
                child: Text('Details'),
              ),
            ],
          ),
          title: Text(controller.provider.name),
        ),
        body: GetBuilder(
          init: controller,
          builder: (_) => TabBarView(
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: _addPictures(),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: _buildDetails(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDetails() {
    return Column(
      children: [
        _title('Description', controller.provider.description),
        _title('Address', controller.provider.address),
        _title('State', controller.provider.state.name),
      ],
    );
  }

  Widget _title(String key, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          key,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Text(value),
      ],
    ).space();
  }

  Widget _addPictures() {
    return Column(
      children: [
        InkResponse(
          onTap: controller.loadAssets,
          child: DottedBorder(
            color: grey_color,
            strokeWidth: 1,
            radius: const Radius.circular(10),
            padding: EdgeInsets.zero,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 16),
              width: double.infinity,
              color: status_bar_color,
              child: Row(
                children: <Widget>[
                  if (controller.images.length < 1)
                    SvgPicture.asset(
                      'assets/svg/button/add_green.svg',
                      height: 50,
                    ),
                  Expanded(
                    child: buildGridView(),
                  ),
                ],
              ),
            ),
            dashPattern: [10, 5],
          ),
        ).space(bottom: 16),
        FlatButton(
          padding: EdgeInsets.symmetric(horizontal: 25, vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(5)),
          ),
          color: blue_color,
          disabledColor: Colors.blue[200],
          textColor: white_color,
          onPressed: controller.uploading || controller.images.length < 1
              ? null
              : controller.upload,
          child: controller.uploading
              ? const Text('Uploading...')
              : const Text('Upload'),
        ),
      ],
    );
  }

  Widget buildGridView() {
    if (controller.images.length > 0)
      return SizedBox(
        height: 70,
        child: GridView.count(
          crossAxisSpacing: 10,
          primary: false,
          crossAxisCount: 4,
          children: List.generate(controller.images.length, (index) {
            Asset asset = controller.images[index];
            return AssetThumb(
              asset: asset,
              width: 100,
              height: 100,
            );
          }),
        ),
      );

    return Text(
      'You can upload up to 4 images for this provider',
      style: TextStyle(
        color: grey_color,
      ),
      textAlign: TextAlign.center,
    );
  }
}
