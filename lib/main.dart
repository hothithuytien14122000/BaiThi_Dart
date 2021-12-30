import 'package:flutter/material.dart';

import 'Pages/Home_Page.dart';

void main() => runApp(MaterialApp(
      initialRoute: '/MainPage',
      routes: {
        '/MainPage': (context) => HomePage(),
      },
    ));
