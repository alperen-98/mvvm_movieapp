import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:movie_app/providers/movie_provider.dart';
import 'package:movie_app/providers/tv_show_provider.dart';
import 'package:movie_app/screens/home_screen.dart';
import 'package:provider/provider.dart';
import 'constants/colors.dart';

void main() {
  // device remains in portrait mode
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => MovieProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => TvShowProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Movie App',
        theme: ThemeData(
          scaffoldBackgroundColor: kScaffoldBackgroundColor,
          primarySwatch: Colors.red,
          progressIndicatorTheme: const ProgressIndicatorThemeData(
            linearTrackColor: kLowOpacityLinearTrackColor,
          ),
        ),
        home: HomeScreen(),
      ),
    );
  }
}
