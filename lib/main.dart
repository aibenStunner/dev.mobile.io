import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gods_eye/models/children_model/children_data.dart';
import 'package:gods_eye/models/stream_model/stream_data.dart';
import 'package:gods_eye/models/teacher_model/teachers_data.dart';
import 'package:gods_eye/models/sub_stream_model/camera_streams.dart';
import 'package:gods_eye/screens/login_screen/login_screen.dart';
import 'package:gods_eye/screens/sign_up_screen/sign_up_screen.dart';
import 'package:gods_eye/screens/stream_screen/stream_fullscreen.dart';
import 'package:gods_eye/utils/hive/adapters/Session.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'screens/main_nav.dart';

void main() async {
  // Get directory location of hive DB from device
  WidgetsFlutterBinding.ensureInitialized();
  final appDocumentDir = await getApplicationDocumentsDirectory();
  Hive.init(appDocumentDir.path);

  // register session adapter with hive
  Hive.registerAdapter(SessionAdapter());

  return runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => StreamData()),
        ChangeNotifierProvider(create: (_) => CameraStreams()),
        ChangeNotifierProvider(create: (_) => ChildrenData()),
        ChangeNotifierProvider(create: (_) => TeachersData()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: LoginScreen.id,
        routes: {
          LoginScreen.id: (context) => LoginScreen(),
          SignUpScreen.id: (context) => SignUpScreen(),
          MainNav.id: (context) => MainNav(),
          StreamFullScreen.id: (context) => StreamFullScreen(),
        },
        theme: ThemeData(
          fontFamily: 'Gilroy',
        ),
      ),
    );
  }
}
