import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:sizer/sizer.dart';
import 'package:weather_app/business_logic/weather_logic/weather_cubit.dart';
import 'package:weather_app/business_logic/weather_logic/weather_state.dart';
import '../../data/constants/countries.dart';
import '../../data/models/app_colors.dart';

class WeatherScreen extends StatelessWidget {
  const WeatherScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WeatherCubit()..getWeather(country: 'egypt'),
      child: BlocConsumer<WeatherCubit, WeatherState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          var weatherCubit = WeatherCubit.get(context);
          return Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 5.h),
                  DropdownButtonHideUnderline(
                    child: DropdownButton(
                      hint: Text(
                        weatherCubit.selectedCountry,
                        style: TextStyle(
                          fontSize: 20.sp,
                          color: AppColors.secondColor,
                        ),
                      ),
                      items: weatherCubit.currCountries
                          .map((String item) => DropdownMenuItem<String>(
                                value: item,
                                child: Text(
                                  item,
                                  style: TextStyle(
                                    fontSize: 16.sp,
                                    color: AppColors.secondColor,
                                  ),
                                ),
                              ))
                          .toList(),
                      onChanged: (String? value) {
                        weatherCubit.selectedCountry = value!;
                        weatherCubit.getWeather(country: value);
                      },
                    ),
                  ),
                  SizedBox(height: 15.h),
                  if (state is! GetWeatherLoadingState) ...[
                    Center(
                        child: Image.asset('${weatherCubit.weatherModel.tempImg}',
                            height: 20.h, width: 40.w)),
                    Center(
                      child: Text(
                        '${weatherCubit.weatherModel.temp ?? ''}°',
                        style: TextStyle(
                            fontSize: 48.sp, color: AppColors.secondColor),
                      ),
                    ),
                  ] else ...[
                    SizedBox(
                        width: 20.w,
                        height: 10.h,
                        child: const CircularProgressIndicator(
                            color: AppColors.secondColor))
                  ],
                  SizedBox(height: 20.h),
                  TextButton(
                      onPressed: () async {
                        Position pos =
                            await weatherCubit.getGeoLocationPosition();
                        weatherCubit.selectedCountry =
                            await weatherCubit.getCountryNameFromPosition(pos);
                        weatherCubit.getWeather(country: weatherCubit.selectedCountry);
                      },
                      child: Text(
                        'Get weather of current location',
                        style: TextStyle(
                            fontSize: 14.sp, color: AppColors.secondColor),
                      )),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
