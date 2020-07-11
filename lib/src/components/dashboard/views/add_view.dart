import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:prozone/src/controllers/dashboard/add_view_controller.dart';
import 'package:prozone/src/init.dart';
import 'package:prozone/src/widgets/buttons/button.dart';

class AddView extends StatelessWidget {
  final formKey = GlobalKey<FormBuilderState>();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: GetBuilder<AddViewController>(
        init: AddViewController(formKey),
        builder: (controller) {
          return FormBuilder(
            key: controller.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Styles.titleText('New Provider,')
                    .left()
                    .space(bottom: 10, top: 40),
                Styles.greyText('Enter some information about the provider')
                    .space(bottom: 40),
                FormBuilderTextField(
                  readOnly: controller.loading,
                  attribute: 'name',
                  decoration: Utils.decoration(
                    'Name',
                    hint: 'Name',
                  ),
                  maxLines: 1,
                  validator: FormBuilderValidators.required(context),
                ).space(bottom: 20),
                FormBuilderTextField(
                  readOnly: controller.loading,
                  attribute: 'description',
                  decoration: Utils.decoration(
                    'Description',
                    hint: 'Description',
                  ),
                  maxLines: 3,
                  validator: FormBuilderValidators.required(context),
                ).space(bottom: 20),
                FormBuilderTextField(
                  readOnly: controller.loading,
                  attribute: 'address',
                  decoration: Utils.decoration(
                    'Address',
                    hint: 'Address',
                  ),
                  maxLines: 2,
                  validator: FormBuilderValidators.required(context),
                ).space(bottom: 20),
                FormBuilderDropdown(
                  items: Application.states
                      .map(
                        (e) => DropdownMenuItem(
                          child: Text(e.name),
                          value: e.id,
                        ),
                      )
                      .toList(),
                  readOnly: controller.loading,
                  attribute: 'state',
                  decoration: Utils.decoration(
                    'State',
                  ),
                  validator: FormBuilderValidators.required(context),
                ).space(bottom: 20),
                FormBuilderRating(
                  attribute: 'rating',
                  readOnly: controller.loading,
                  decoration: Utils.decoration(
                    'Rating',
                    hint: 'Rating',
                  ),
                ).space(bottom: 20),
                FormBuilderDropdown(
                  initialValue: 'Pending',
                  items: [
                    DropdownMenuItem(
                      child: Text('Pending'),
                      value: 'Pending',
                    ),
                    DropdownMenuItem(
                      child: Text('Active'),
                      value: 'Active',
                    ),
                  ],
                  readOnly: controller.loading,
                  attribute: 'active_status',
                  decoration: Utils.decoration(
                    'Status',
                  ),
                  validator: FormBuilderValidators.required(context),
                ).space(bottom: 20),
                FormBuilderDropdown(
                  items: Application.providerTypes
                      .map(
                        (e) => DropdownMenuItem(
                          child: Text(e.name),
                          value: e.id,
                        ),
                      )
                      .toList(),
                  readOnly: controller.loading,
                  attribute: 'provider_type',
                  decoration: Utils.decoration(
                    'Type',
                  ),
                  validator: FormBuilderValidators.required(context),
                ).space(bottom: 20),
                AppButton(
                  elevation: null,
                  title: controller.loading ? 'Loading...' : 'Submit',
                  onPressed: controller.loading ? null : controller.submit,
                ).space(
                  bottom: 20,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
