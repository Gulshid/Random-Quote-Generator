import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'dart:math';

import 'package:quote_genrator/src/ui/view/quote_screen.dart';
import 'package:quote_genrator/src/ui/viewmodel/viewmodel.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final designSize = _getDesignSize(constraints.maxWidth);

        return ScreenUtilInit(
          designSize: designSize,
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (context, child) {
            return MultiProvider(
              providers: [
                ChangeNotifierProvider(create: (_) => Viewmodel()),
              ],
              child: MaterialApp(
                debugShowCheckedModeBanner: false,
                title: 'Random Quote Generator',
                theme: ThemeData(
                  brightness: Brightness.light,
                  appBarTheme: const AppBarTheme(color: Colors.teal),
                  primarySwatch: Colors.blue,
                  textTheme: Typography.englishLike2018.apply(
                    fontSizeFactor: 1.sp,
                  ),
                ),
                initialRoute: 'quote_screen',
                routes: {'quote_screen': (context) => const QuoteScreen()},
              ),
            );
          },
        );
      },
    );
  }

  Size _getDesignSize(double width) {
    if (width < 600) {
      return const Size(390, 844);
    } else if (width < 1200) {
      return const Size(834, 1194);
    } else {
      return const Size(1440, 1024);
    }
  }
}
