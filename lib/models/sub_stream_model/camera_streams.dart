import 'package:flutter/material.dart';
import 'package:gods_eye/models/sub_stream_model/camera.dart';

class CameraStreams extends ChangeNotifier {
  int _selectedCamera = 0;

  Map<String, List<Camera>> _cameraStreams = {
    "Cafeteria - East": [
      Camera(
          title: 'Camera 1',
          imgSrc: 'images/cameras/cafEast_cam1.jpeg',
          // streamSrc: 'http://206.255.127.63:88/mjpg/video.mjpg'
          streamSrc: 'http://godseye-env.eba-gpcz6ppk.us-east-2.elasticbeanstalk.com/parents/feed/2'
          ),
      Camera(
          title: 'Camera 2',
          imgSrc: 'images/cameras/cafEast_cam2.jpg',
          streamSrc: 'http://213.226.254.135:91/mjpg/video.mjpg'),
      Camera(
          title: 'Camera 3',
          imgSrc: 'images/cameras/cafEast_cam2.jpg',
          streamSrc: 'http://68.113.21.65:8082/?action=stream')
    ],
    "Cafeteria - West": [
      Camera(
          title: 'Camera 1',
          imgSrc: 'images/cameras/cafWest_cam1.jpeg',
          streamSrc:
              'http://63.41.229.60/cgi-bin/camera?resolution=640&amp;quality=1&amp;Language=0&amp;1585678759'),
      Camera(
          title: 'Camera 2',
          imgSrc: 'images/cameras/cafWest_cam2.jpeg',
          streamSrc: 'http://73.228.66.59:1024/cam_1.cgi')
    ],
    "Penguin Room - North": [
      Camera(
          title: 'Camera 1',
          imgSrc: 'images/cameras/studyA_cam1.jpg',
          streamSrc: 'http://73.239.95.63:8080/?action=stream'),
      Camera(
          title: 'Camera 2',
          imgSrc: 'images/cameras/studyA_cam1.jpg',
          streamSrc: 'http://67.172.188.60:8090/img/video.mjpeg'),
      Camera(
          title: 'Camera 3',
          imgSrc: 'images/cameras/studyA_cam1.jpg',
          streamSrc: 'http://72.135.244.62:80/videostream.cgi?user=admin&pwd=')
    ],
    "Penguin Room - South": [
      Camera(
          title: 'Camera 1',
          imgSrc: 'images/cameras/studyA_cam1.jpg',
          streamSrc:
              'http://75.75.177.59:8084/videostream.cgi?user=admin&pwd='),
      Camera(
          title: 'Camera 2',
          imgSrc: 'images/cameras/studyA_cam1.jpg',
          streamSrc:
              'http://76.200.143.62:80/jpgmulreq/1/image.jpg?key=1516975535684&lq=1&COUNTER'),
      Camera(
          title: 'Camera 3',
          imgSrc: 'images/cameras/studyA_cam1.jpg',
          streamSrc:
              'http://184.60.117.62:8082/cgi-bin/camera?resolution=640&amp;quality=1&amp;Language=0&amp;COUNTER')
    ],
    "Playground - East": [
      Camera(
          title: 'Camera 1',
          imgSrc: 'images/cameras/playGroundEast_cam1.jpeg',
          streamSrc: 'http://68.169.144.60:80/mjpg/video.mjpg'),
      Camera(
          title: 'Camera 2',
          imgSrc: 'images/cameras/playGroundEast_cam2.jpeg',
          streamSrc: 'http://74.68.105.59:8200/mjpg/video.mjpg'),
      Camera(
          title: 'Camera 3',
          imgSrc: 'images/cameras/playGroundEast_cam3.jpeg',
          streamSrc: 'http://71.61.225.58:82/mjpg/video.mjpg'),
      Camera(
          title: 'Camera 4',
          imgSrc: 'images/cameras/playGroundEast_cam4.jpeg',
          streamSrc:
              'http://68.169.137.58:60001/cgi-bin/snapshot.cgi?chn=0&u=admin&p=&q=0&COUNTER')
    ],
    "Playground - South": [
      Camera(
          title: 'Camera 1',
          imgSrc: 'images/cameras/playGroundSouth_cam1.jpeg',
          streamSrc:
              'http://75.75.177.59:8084/videostream.cgi?user=admin&pwd='),
      Camera(
          title: 'Camera 2',
          imgSrc: 'images/cameras/playGroundSouth_cam2.jpeg',
          streamSrc:
              'http://76.200.143.62:80/jpgmulreq/1/image.jpg?key=1516975535684&lq=1&COUNTER'),
      Camera(
          title: 'Camera 3',
          imgSrc: 'images/cameras/playGroundSouth_cam3.jpeg',
          streamSrc:
              'http://184.60.117.62:8082/cgi-bin/camera?resolution=640&amp;quality=1&amp;Language=0&amp;COUNTER')
    ],
    "Playground - West": [
      Camera(
          title: 'Camera 1',
          imgSrc: 'images/cameras/playGroundSouth_cam1.jpeg',
          streamSrc:
              'http://75.75.177.59:8084/videostream.cgi?user=admin&pwd='),
      Camera(
          title: 'Camera 2',
          imgSrc: 'images/cameras/playGroundSouth_cam2.jpeg',
          streamSrc:
              'http://76.200.143.62:80/jpgmulreq/1/image.jpg?key=1516975535684&lq=1&COUNTER'),
      Camera(
          title: 'Camera 3',
          imgSrc: 'images/cameras/playGroundSouth_cam3.jpeg',
          streamSrc:
              'http://184.60.117.62:8082/cgi-bin/camera?resolution=640&amp;quality=1&amp;Language=0&amp;COUNTER')
    ],
    "Study - A": [
      Camera(
          title: 'Camera 1',
          imgSrc: 'images/cameras/studyA_cam1.jpg',
          streamSrc:
              'http://75.75.177.59:8084/videostream.cgi?user=admin&pwd='),
      Camera(
          title: 'Camera 2',
          imgSrc: 'images/cameras/studyA_cam2.jpeg',
          streamSrc:
              'http://76.200.143.62:80/jpgmulreq/1/image.jpg?key=1516975535684&lq=1&COUNTER'),
      Camera(
          title: 'Camera 3',
          imgSrc: 'images/cameras/studyA_cam1.jpg',
          streamSrc:
              'http://184.60.117.62:8082/cgi-bin/camera?resolution=640&amp;quality=1&amp;Language=0&amp;COUNTER')
    ],
    "Study - B": [
      Camera(
          title: 'Camera 1',
          imgSrc: 'images/cameras/studyA_cam1.jpg',
          streamSrc:
              'http://75.75.177.59:8084/videostream.cgi?user=admin&pwd='),
      Camera(
          title: 'Camera 2',
          imgSrc: 'images/cameras/studyB_cam1.jpeg',
          streamSrc:
              'http://76.200.143.62:80/jpgmulreq/1/image.jpg?key=1516975535684&lq=1&COUNTER'),
      Camera(
          title: 'Camera 3',
          imgSrc: 'images/cameras/studyA_cam1.jpg',
          streamSrc:
              'http://184.60.117.62:8082/cgi-bin/camera?resolution=640&amp;quality=1&amp;Language=0&amp;COUNTER')
    ],
    "Study - C": [
      Camera(
          title: 'Camera 1',
          imgSrc: 'images/cameras/studyA_cam1.jpg',
          streamSrc:
              'http://75.75.177.59:8084/videostream.cgi?user=admin&pwd='),
      Camera(
          title: 'Camera 2',
          imgSrc: 'images/cameras/studyA_cam1.jpg',
          streamSrc:
              'http://76.200.143.62:80/jpgmulreq/1/image.jpg?key=1516975535684&lq=1&COUNTER'),
      Camera(
          title: 'Camera 3',
          imgSrc: 'images/cameras/studyA_cam1.jpg',
          streamSrc:
              'http://184.60.117.62:8082/cgi-bin/camera?resolution=640&amp;quality=1&amp;Language=0&amp;COUNTER')
    ],
    "Turtle Room - North": [
      Camera(
          title: 'Camera 1',
          imgSrc: 'images/cameras/studyA_cam1.jpg',
          streamSrc:
              'http://75.75.177.59:8084/videostream.cgi?user=admin&pwd='),
      Camera(
          title: 'Camera 2',
          imgSrc: 'images/cameras/studyA_cam1.jpg',
          streamSrc:
              'http://76.200.143.62:80/jpgmulreq/1/image.jpg?key=1516975535684&lq=1&COUNTER'),
      Camera(
          title: 'Camera 3',
          imgSrc: 'images/cameras/studyA_cam1.jpg',
          streamSrc:
              'http://184.60.117.62:8082/cgi-bin/camera?resolution=640&amp;quality=1&amp;Language=0&amp;COUNTER')
    ],
    "Turtle Room - South": [
      Camera(
          title: 'Camera 1',
          imgSrc: 'images/cameras/studyA_cam1.jpg',
          streamSrc:
              'http://75.75.177.59:8084/videostream.cgi?user=admin&pwd='),
      Camera(
          title: 'Camera 2',
          imgSrc: 'images/cameras/studyA_cam1.jpg',
          streamSrc:
              'http://76.200.143.62:80/jpgmulreq/1/image.jpg?key=1516975535684&lq=1&COUNTER'),
      Camera(
          title: 'Camera 3',
          imgSrc: 'images/cameras/studyA_cam1.jpg',
          streamSrc:
              'http://184.60.117.62:8082/cgi-bin/camera?resolution=640&amp;quality=1&amp;Language=0&amp;COUNTER')
    ],
  };

  Map get cameraStreams {
    return _cameraStreams;
  }

  int get currentCamera {
    return _selectedCamera;
  }

  void updateCurrentCamera(int index) {
    _selectedCamera = index;
    notifyListeners();
  }
}
