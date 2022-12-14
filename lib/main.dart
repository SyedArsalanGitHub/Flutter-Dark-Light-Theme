import 'package:flutter/material.dart';
import 'package:flutter_grocery_app/provider/dark_theme_provider.dart';
import 'package:flutter_grocery_app/screens/home_screen.dart';
import 'package:flutter_grocery_app/const/theme_data.dart';
import 'package:provider/provider.dart';
void main() {
  runApp( MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  DarkThemeProvider themeChangeProvider = DarkThemeProvider();

  void getCurrentAppTheme() async{
    themeChangeProvider.setDarkTheme = await themeChangeProvider.darkThemePrefs.getTheme();

  }

  @override
  void initState(){
    getCurrentAppTheme();
    super.initState();
  }


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (_){
              return themeChangeProvider;
            })
      ],
      child: Consumer<DarkThemeProvider>(builder: (context, themeProvider, child){

      return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme:  Styles.themeData(themeProvider.getDarkTheme, context),
        home: HomeScreen(),
      );
      })
    );
  }
}
