import 'package:flutter/material.dart';
import 'package:flutter_compass/flutter_compass.dart';
import 'package:geolocator/geolocator.dart';
import 'dart:math';

class QiblaScreen extends StatefulWidget {
  const QiblaScreen({super.key});

  @override
  State<QiblaScreen> createState() => _QiblaScreenState();
}

class _QiblaScreenState extends State<QiblaScreen> {
  double? _userLat;
  double? _userLon;
  String _status = 'Mendapatkan posisi...';

  final double _kaabaLat = 21.4225;
  final double _kaabaLon = 39.8262;

  @override
  void initState() {
    super.initState();
    _determinePosition();
  }

  Future<void> _determinePosition() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      setState(() => _status = 'Nyalakan GPS untuk menggunakan kompas');
      return;
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    if (permission == LocationPermission.deniedForever || permission == LocationPermission.denied) {
      setState(() => _status = 'Izin lokasi ditolak');
      return;
    }

    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    setState(() {
      _userLat = position.latitude;
      _userLon = position.longitude;
      _status = 'GPS siap';
    });
  }

  double _calculateQiblaDirection(double userLat, double userLon) {
    double latRad = userLat * pi / 180;
    double lonRad = userLon * pi / 180;
    double kaabaLatRad = _kaabaLat * pi / 180;
    double kaabaLonRad = _kaabaLon * pi / 180;

    double y = sin(kaabaLonRad - lonRad);
    double x = cos(latRad) * tan(kaabaLatRad) - sin(latRad) * cos(kaabaLonRad - lonRad);
    double angle = atan2(y, x);
    return angle * 180 / pi; // derajat
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Arah Kiblat')),
      body: Center(
        child: _status != 'GPS siap'
            ? Text(_status)
            : StreamBuilder<CompassEvent?>(
          stream: FlutterCompass.events,
          builder: (context, snapshot) {
            if (!snapshot.hasData || _userLat == null || _userLon == null) {
              return const CircularProgressIndicator();
            }

            final direction = snapshot.data!.heading ?? 0;
            final qiblaDirection = _calculateQiblaDirection(_userLat!, _userLon!);
            final angle = ((qiblaDirection - direction) * (pi / 180) * -1);

            return Transform.rotate(
              angle: angle,
              child: Image.asset('assets/compass.png', width: 200),
            );
          },
        ),
      ),
    );
  }
}




