import 'package:flutter/material.dart';
import 'package:state_managment_test/common/theme.dart';
import 'package:state_managment_test/screens/cart.dart';
import 'package:state_managment_test/screens/catalog.dart';

/// Задание 2. Создать Scope для управления состоянием приложения.
/// Scope должен содержать в себе [InheritedWidget], как мы делаем это на всех проектах.
///
/// Задание 3. Заменить [CartModel] на [CartBloc].

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'State management demo',
      theme: appTheme,
      initialRoute: MyCatalog.routeName,
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case MyCatalog.routeName:
            return MaterialPageRoute(builder: (context) => const MyCatalog());
          case MyCart.routeName:
            return MaterialPageRoute(builder: (context) => const MyCart());
          default:
            return null;
        }
      },
    );
  }
}
