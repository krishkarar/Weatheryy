import 'package:geolocator/geolocator.dart';


class location{

  double latitude=0;
  double longitude=0;

  Future<void> getCurrentLocation() async{
    try{
      Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
      // print(position);
      latitude = position.latitude;
      longitude = position.longitude;
    }
    catch(e){
      print(e);
    }



  }
}