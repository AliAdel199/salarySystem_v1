import 'package:desktop_window/desktop_window.dart';
import 'package:flutter/material.dart';
import '/db/db_helper.dart';

import 'package:flutter_localizations/flutter_localizations.dart';
import '/pages/home_page/sideBarDesctop.dart';
// import 'package:salarys_v_1/widget/db/test.dart';
import 'pages/create_month_salary.dart';
import 'pages/home_page/mainSide.dart';

import 'package:window_manager/window_manager.dart';

Future testWindowFunctions() async {
  await DesktopWindow.setWindowSize(const Size(1165.0, 750.0));

  await DesktopWindow.setMinWindowSize(const Size(1165.0, 750.0));
}

void main() async {


 
  WidgetsFlutterBinding.ensureInitialized();
  // Must add this line.
    DatabaseManager databaseManager =DatabaseManager();
  await databaseManager.connectToDatabase();

  List<Map<String, dynamic>> data = await databaseManager.fetchData('SELECT * FROM sections');
data.forEach((element) {print(element['secName']);});
  
  // print(data);


  await windowManager.ensureInitialized();

// print(directory);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        localizationsDelegates: const [
          GlobalCupertinoLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('ar', 'AE') // OR Locale('ar', 'AE') OR Other RTL locales
        ],
        locale: const Locale('ar', 'AE'),
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const CreateMonthSalary());
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final margin = const EdgeInsets.only(bottom: 10.0, right: 10.0, left: 10.0);

  final backColor = Colors.lightGreen;
  @override
  Widget build(BuildContext context) {
    return const SafeArea(
        child: Row(
      textDirection: TextDirection.ltr,
      children: [MainSideDesctop(), SideBarDesctop()],
    ));
  }
}
