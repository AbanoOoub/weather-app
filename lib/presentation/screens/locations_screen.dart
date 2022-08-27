import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:weather_app/data/constants/countries.dart';
import 'package:weather_app/data/constants/strings.dart';
import 'package:weather_app/data/helpers/shared_prefs.dart';
import 'package:weather_app/data/helpers/toast_message.dart';
import 'package:weather_app/data/models/app_colors.dart';
import 'package:weather_app/presentation/custom_widgets/def_text.dart';

import '../custom_widgets/custom_text_input.dart';

class LocationsScreen extends StatefulWidget {
  const LocationsScreen({Key? key}) : super(key: key);

  @override
  State<LocationsScreen> createState() => _LocationsScreenState();
}

class _LocationsScreenState extends State<LocationsScreen> {
  final TextEditingController countryController = TextEditingController();

  final _locationFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Form(
              key: _locationFormKey,
              child: Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        width: 70.w,
                        child: CustomTextInput(
                            controller: countryController,
                            hint: 'Enter new country',
                            prefixIcon: Icons.location_on,
                            type: TextInputType.text),
                      ),
                      InkWell(
                          child: const Icon(Icons.add_circle_outlined),
                          onTap: () {
                            if (_locationFormKey.currentState!.validate()) {
                              if (countries.contains(countryController.text.toLowerCase())) {
                                toast(msg: 'Country is already exists');
                                countryController.clear();
                              } else {
                                setState(() {
                                  countries.add(countryController.text.toLowerCase());
                                  countryController.clear();
                                });
                                CacheHelper.saveDataList(
                                    key: allCountriesKey, valList: countries);
                              }
                            }
                          }),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 6,
              child: SizedBox(
                width: 90.w,
                child: ListView.builder(
                    itemCount: countries.length,
                    itemBuilder: (context, index) => Center(
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: CustomTextWidget(
                                text: countries[index],
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w300,
                                textColor: AppColors.secondColor),
                          ),
                        )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
