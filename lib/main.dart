import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:movie_app/view/home_screen.dart';
import 'package:movie_app/view_model/movie_view_model.dart';
import 'package:movie_app/view_model/tv_show_view_model.dart';
import 'package:provider/provider.dart';
import 'constants/colors.dart';

void main() async {
  // device remains in portrait mode
  WidgetsFlutterBinding.ensureInitialized();
  await FlutterConfig.loadEnvVariables();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: TvShowViewModel(),
        ),
        ChangeNotifierProvider.value(
          value: MovieViewModel(),
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
