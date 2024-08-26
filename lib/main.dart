import 'package:flutter/material.dart';
import 'package:flutter_todo/app/app.dart';
import 'package:flutter_todo/bootstrap.dart';
import 'package:flutter_todo/di/di.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await setupDependencyInjection();
  await getIt.allReady();

  await bootstrap(MyApp.new);
}
