import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:quote_genrator/src/ui/view/quote_screen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Detect device type and assign design size once
        final designSize = _getDesignSize(constraints.maxWidth);

        return ScreenUtilInit(
          designSize: designSize,
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (_, __) {
            return MultiProvider(
              providers: [
                // ChangeNotifierProvider(create: (_) => profile_provider()),
              ],
              child: MaterialApp(
                debugShowCheckedModeBanner: false,
                title: 'Random Quote Generator ',
                theme: ThemeData(
                  brightness: Brightness.light,
                  appBarTheme: const AppBarTheme(color: Colors.teal),
                  primarySwatch: Colors.blue,
                  textTheme: Typography.englishLike2018.apply(
                    fontSizeFactor: 1.sp, // Auto scale text everywhere
                  ),
                ),
                initialRoute: '/',
                routes: {'/': (context) => QuoteScreen()},
              ),
            );
          },
        );
      },
    );
  }
}

// Set design size once here (affects whole project)
Size _getDesignSize(double width) {
  if (width < 600) {
    // Mobile
    return const Size(390, 844);
  } else if (width < 1200) {
    // Tablet
    return const Size(834, 1194);
  } else {
    // Web / Desktop
    return const Size(1440, 1024);
  }
}
