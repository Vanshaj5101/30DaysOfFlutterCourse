import 'package:flutter/material.dart';
import 'package:flutter_catalog/models/provider_class.dart';
import 'package:flutter_catalog/pages/cart_page.dart';
import 'package:flutter_catalog/pages/home_page.dart';
import 'package:flutter_catalog/pages/login_page.dart';
import 'package:flutter_catalog/utils/routes.dart';
import 'package:flutter_catalog/widgets/themes.dart';
import 'package:provider/provider.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ProvideClass(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        //home: HomePage(),
        themeMode: ThemeMode.system,
        theme: MyTheme.lightTheme(context),

        darkTheme: MyTheme.darkTheme(context),
        initialRoute: MyRoutes.homeRoute,
        routes: {
          "/": (context) => LoginPage(),
          MyRoutes.homeRoute: (context) => HomePage(),
          MyRoutes.loginRoute: (context) => LoginPage(),
          //MyRoutes.homeDetailsRoute: (context) => HomeDetailsPage(item: item),
          MyRoutes.cartRoute: (context) => CartPage(),
        },
      ),
    );
  }
}
