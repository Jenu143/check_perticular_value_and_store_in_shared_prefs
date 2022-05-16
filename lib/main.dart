import 'package:check_value_show/constant/strings.dart';
import 'package:check_value_show/screens/home.dart';
import 'package:check_value_show/provider/get_api_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
    WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences.getInstance().then(
    (v) {
      preferences = v;
      runApp(const MyApp());
    },
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<GetProvider>(create: (context) => GetProvider()),
      ],
      builder: (context, child) {
        return const MaterialApp(
          home: HomeScreen(),
        );
      },
    );
  }
}
