import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:student_app/model/student_model.dart';
import 'package:student_app/view/splash_screen.dart';
import 'contoller/contrller.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  if (!Hive.isAdapterRegistered(StudentModelAdapter().typeId)) {
    Hive.registerAdapter(StudentModelAdapter());
  }
  await Hive.openBox<StudentModel>('student_database');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Student App',
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      initialBinding: BindingsBuilder(() {
        Get.lazyPut<ScreenController>(() => ScreenController());
      }),
    );
  }
}
