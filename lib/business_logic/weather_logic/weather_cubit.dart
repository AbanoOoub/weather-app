import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/business_logic/weather_logic/weather_state.dart';
import 'package:weather_app/data/constants/countries.dart';
import 'package:weather_app/data/constants/strings.dart';
import 'package:weather_app/data/helpers/dio.dart';
import 'package:weather_app/data/helpers/shared_prefs.dart';
import 'package:weather_app/data/helpers/toast_message.dart';
import 'package:weather_app/data/models/weather_model.dart';



class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit() : super(WeatherInitial());

  static WeatherCubit get(context) => BlocProvider.of(context);

   WeatherModel weatherModel = WeatherModel();

  List<String> currCountries = [];
  String selectedCountry = "egypt";


  void getWeather({required String country}) async{
    initCountries();
    emit(GetWeatherLoadingState());
    await DioHelper.getData(endPoint: weatherEndPoint, query: {'city': country})
        .then((value) {
      weatherModel = WeatherModel.fromJson(value.data);
      initTempImg(weatherModel.temp!);
      emit(GetWeatherSuccessState());
    }).catchError((e) {
      emit(GetWeatherErrorState());
      toast(msg: 'This is invalid name of country');
      debugPrint(e.toString());
    });
  }

  void initTempImg(int temp){
    if(temp <= 0){
      weatherModel.tempImg = thunderImg;
    }
    else if (temp > 0 && temp <= 10){
      weatherModel.tempImg = rainImg;
    }
    else if (temp >= 11 && temp <= 15){
      weatherModel.tempImg = cloudyImg;
    }
    else if (temp >= 16 && temp <= 25){
      weatherModel.tempImg = normalImg;
    }else{
      weatherModel.tempImg = sunnyImg;
    }
  }

  void initCountries(){
    currCountries = CacheHelper.getDataList(key: allCountriesKey) ?? countries;
  }



  Future<Position> getGeoLocationPosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      await Geolocator.openLocationSettings();
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {

        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    return await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
  }

  Future<String> getCountryNameFromPosition(Position position)async {
    List<Placemark> placeMarks = await placemarkFromCoordinates(position.latitude, position.longitude);
    Placemark place = placeMarks[0];
    CacheHelper.saveData(key: userLocationKey, val: place.country);
    emit(GetCountryNameSuccessState());
    return place.country!;
  }

}
