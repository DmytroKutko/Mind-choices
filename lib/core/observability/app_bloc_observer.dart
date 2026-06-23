import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final class AppBlocObserver extends BlocObserver {
  @override
  void onCreate(BlocBase<dynamic> bloc) {
    super.onCreate(bloc);
    _log('${bloc.runtimeType} created');
  }

  @override
  void onClose(BlocBase<dynamic> bloc) {
    _log('${bloc.runtimeType} closed');
    super.onClose(bloc);
  }

  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    _log('${bloc.runtimeType} error: ${error.runtimeType}');
    super.onError(bloc, error, stackTrace);
  }

  void _log(String message) {
    if (kDebugMode) {
      debugPrint('[bloc] $message');
    }
  }
}
