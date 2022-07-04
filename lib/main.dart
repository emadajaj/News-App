import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'Layout/home_page.dart';
import 'cubit/cubit.dart';
import 'cubit/status_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    WidgetsFlutterBinding.ensureInitialized();
    return BlocProvider(
      create : (BuildContext context) => AppCubit(),
      child: BlocConsumer<AppCubit,CubitState>(
          listener: (context,state){
          },
          builder: (context,state){
            return MaterialApp(
              title : 'News',
              theme: ThemeData(
                  colorScheme: ColorScheme.fromSwatch().copyWith(

                    primary: Colors.redAccent,

                  ),
                  scaffoldBackgroundColor: Colors.white,
                  appBarTheme: const AppBarTheme(
                      elevation: 0.0,
                      backgroundColor: Colors.redAccent,
                      titleTextStyle:TextStyle(
                          fontSize: 20,fontWeight: FontWeight.bold , fontStyle: FontStyle.italic ,color: Colors.black87
                      ),backwardsCompatibility: false,
                      systemOverlayStyle: SystemUiOverlayStyle(
                          statusBarColor: Colors.redAccent,
                          statusBarBrightness: Brightness.light,
                          statusBarIconBrightness: Brightness.dark
                      )
                  ),
                  bottomNavigationBarTheme:const BottomNavigationBarThemeData(
                    backgroundColor: Colors.white,
                    unselectedItemColor: Colors.grey,
                    type: BottomNavigationBarType.fixed,
                    selectedItemColor: Colors.redAccent,
                    elevation: 0.0,
                    //showSelectedLabels: false,
                  )
              ),
              themeMode:AppCubit.get(context).isDark ? ThemeMode.dark : ThemeMode.light,
              darkTheme:ThemeData(
                  colorScheme: ColorScheme.fromSwatch().copyWith(
                    primary: Colors.blue,

                  ),
                  scaffoldBackgroundColor: Colors.blueGrey,
                  appBarTheme: const AppBarTheme(
                      elevation: 0.0,
                      backgroundColor: Colors.redAccent,
                      titleTextStyle:TextStyle(
                          fontSize: 20,fontWeight: FontWeight.bold , fontStyle: FontStyle.italic ,color: Colors.white
                      ),backwardsCompatibility: false,
                      systemOverlayStyle: SystemUiOverlayStyle(
                          statusBarColor: Colors.redAccent,
                          statusBarBrightness: Brightness.dark,
                          statusBarIconBrightness: Brightness.light
                      )
                  ),
                  bottomNavigationBarTheme:const BottomNavigationBarThemeData(
                    backgroundColor: Colors.blueGrey,
                    unselectedItemColor: Colors.grey,
                    type: BottomNavigationBarType.fixed,
                    selectedItemColor: Colors.redAccent,
                    elevation: 0.0,
                    //showSelectedLabels: false,
                  )
              ),
              home:HomePage(),// This trailing comma makes auto-formatting nicer for build methods.
            );
          }

      ),
    );
  }
}

