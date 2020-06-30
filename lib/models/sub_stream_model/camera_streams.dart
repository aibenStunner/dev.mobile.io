import 'package:flutter/material.dart';
import 'package:gods_eye/models/camera_data/CameraData.dart';
import 'package:gods_eye/models/sub_stream_model/camera.dart';
import 'package:hive/hive.dart';

class CameraStreams extends ChangeNotifier {
  int _selectedCamera = 0;

  Map<String, List<Camera>> _cameraStreams = {};

  Map get cameraStreams {
    return _cameraStreams;
  }

  int get currentCamera {
    return _selectedCamera;
  }

  void setCameraStreams(Map data){
    _cameraStreams = data;
  }

  void updateCurrentCamera(int index) {
    _selectedCamera = index;
    notifyListeners();
  }
}
