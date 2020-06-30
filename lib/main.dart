import 'package:custom_splash/custom_splash.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gods_eye/models/camera_data/CameraData.dart';
import 'package:gods_eye/models/child/child.dart';
import 'package:gods_eye/models/stream_model/stream_data.dart';
import 'package:gods_eye/models/sub_stream_model/camera.dart';
import 'package:gods_eye/models/sub_stream_model/camera_streams.dart';
import 'package:gods_eye/models/teacher/teacher.dart';
import 'package:gods_eye/models/teachers/TeachersData.dart';
import 'package:gods_eye/models/user/UserData.dart';
import 'package:gods_eye/models/util_model/UserUtil.dart';
import 'package:gods_eye/screens/login_screen/login_screen.dart';
import 'package:gods_eye/screens/sign_up_screen/sign_up_screen.dart';
import 'package:gods_eye/screens/stream_screen/stream_fullscreen.dart';
import 'package:gods_eye/models/session/Session.dart';
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
  Hive.registerAdapter(UserDataAdapter());
  Hive.registerAdapter(ChildAdapter());
  Hive.registerAdapter(TeachersDataAdapter());
  Hive.registerAdapter(TeacherAdapter());
  Hive.registerAdapter(UserUtilAdapter());
  Hive.registerAdapter(CameraDataAdapter());
  Hive.registerAdapter(CameraAdapter());

  // open box in hive for session
  await Hive.openBox<Session>('session');
  await Hive.openBox<UserData>('user_data');
  await Hive.openBox<TeachersData>('teachers_data');
  await Hive.openBox<UserUtil>('util');
  await Hive.openBox<CameraData>('cam');

  return runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: CustomSplash(
      imagePath: 'images/devio.png',
      backGroundColor: Colors.white,
      animationEffect: 'fade-in',
      logoSize: 1000,
      home: MyApp(),
      duration: 5000,
      type: CustomSplashType.StaticDuration,
    ),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _userLoggedIn;

  @override
  void initState() {
    // open UserUtil box
    final utilBox = Hive.box<UserUtil>('util');

    // get saved userUtil from hive db
    UserUtil userUtil = utilBox.get(0, defaultValue: UserUtil());

    // get userLoggedIn status
    _userLoggedIn = userUtil.userLoggedIn;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => StreamData()),
        ChangeNotifierProvider(create: (_) => CameraStreams()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: _userLoggedIn ? MainNav.id : LoginScreen.id,
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
