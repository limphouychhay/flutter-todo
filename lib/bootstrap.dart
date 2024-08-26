import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

class AppBlocObserver extends BlocObserver {
  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);
    log('onChange(${bloc.runtimeType}, $change)');
  }

  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    log('onError(${bloc.runtimeType}, $error, $stackTrace)');
    super.onError(bloc, error, stackTrace);
  }
}

Future<void> bootstrap(FutureOr<Widget> Function() builder) async {
  FlutterError.onError = (errorDetails) {
    if (errorDetails.exceptionAsString().contains('A RenderFlex overflowed')) {
      log(errorDetails.exceptionAsString(), stackTrace: errorDetails.stack);
      return;
    }
  };

  PlatformDispatcher.instance.onError = (error, stack) {
    return true;
  };

  Bloc.observer = AppBlocObserver();
  runApp(await builder());
}
