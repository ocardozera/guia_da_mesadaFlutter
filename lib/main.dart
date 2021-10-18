import 'package:flutter/material.dart';
import 'package:path/path.dart';

import 'app/injection.dart';
import 'app/my_app.dart';

void main() async {
  setupInjection();
  runApp(MyApp());
}
