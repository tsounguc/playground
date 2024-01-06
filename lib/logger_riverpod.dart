import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoggerRiverpod extends ProviderObserver {
  @override
  void didUpdateProvider(
      ProviderBase<Object?> provider, Object? previousValue, Object? newValue, ProviderContainer container) {
    // TODO: implement didUpdateProvider
    debugPrint('DidUpdateProvider: $provider, $previousValue, $newValue, $container');
  }

  @override
  void didAddProvider(ProviderBase<Object?> provider, Object? value, ProviderContainer container) {
    // TODO: implement didAddProvider
    debugPrint('DidAddProvider: $provider, $value, $container');
  }

  @override
  void didDisposeProvider(ProviderBase<Object?> provider, ProviderContainer container) {
    // TODO: implement didDisposeProvider
    debugPrint('DidDisposeProvider: $provider, $container');
  }
}
