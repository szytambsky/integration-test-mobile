import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mgr_flutter_anim_cache_pagin_list/services/photoService.dart';
import 'package:mgr_flutter_anim_cache_pagin_list/views/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'List of photos',
        debugShowCheckedModeBanner: false,
        // theme: ThemeData(
        //   primaryColor: Colors.black,
        //   textTheme: TextTheme(
        //     bodyText2: TextStyle(color: Colors.black),
        //   ),
        // ),
        home: MultiRepositoryProvider(
          providers: [
            RepositoryProvider(create: (context) => PhotoService()),
          ],
          child: HomeScreen(),
        ));
  }
}
