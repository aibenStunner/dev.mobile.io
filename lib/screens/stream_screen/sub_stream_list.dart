import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gods_eye/models/camera_data/CameraData.dart';
import 'package:gods_eye/models/stream_model/stream_data.dart';
import 'package:gods_eye/models/sub_stream_model/camera_streams.dart';
import 'package:gods_eye/screens/stream_screen/sub_stream_card.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';

class SubStreamList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<CameraStreams>(builder: (context, cameraData, child) {
      cameraData.setCameraStreams(Hive.box<CameraData>('cam').get(0).cameraStreams);
      return ListView.builder(
        itemBuilder: (context, index) {
          final camera = cameraData.cameraStreams[
              Provider.of<StreamData>(context).currentStreamTitle][index];
          return SubStreamCard(
            sImgSrc: camera.imgSrc,
            sTitle: camera.title,
            sIndex: index,
          );
        },
        shrinkWrap: true,
        itemCount: cameraData
            .cameraStreams[Provider.of<StreamData>(context).currentStreamTitle]
            .length,
        physics: BouncingScrollPhysics(),
      );
    });
  }
}
