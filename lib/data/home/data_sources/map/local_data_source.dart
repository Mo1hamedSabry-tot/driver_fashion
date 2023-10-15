import 'package:geolocator/geolocator.dart';

abstract class MapLocalDataSource {
  Future<Position> getCurrentPosition();
}

class MapLocalDataSourceImpl implements MapLocalDataSource {
  @override
  Future<Position> getCurrentPosition() async {
    final permession = await Geolocator.requestPermission();
    if (permession == LocationPermission.always ||
        permession == LocationPermission.whileInUse) {
      return await Geolocator.getCurrentPosition();
    }
    // .then((value) async {
    //   return await Geolocator.getCurrentPosition();
    // }).onError((error, stackTrace) async {
    //   // await Geolocator.requestPermission();
    //   // debugPrint('Error: $error');
    //   throw (Exception(error));
    // });
    throw (Exception());
  }
}
