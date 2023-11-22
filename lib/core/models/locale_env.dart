import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class LocaleEnv {
  const LocaleEnv({
    required this.supported,
    required this.fallback,
    this.loader = const RootBundleAssetLoader(),
    required this.path,
  });

  final List<Locale> supported;
  final Locale fallback;
  final AssetLoader loader;
  final String path;

  LocaleEnv copyWith({
    List<Locale>? supported,
    Locale? fallback,
    AssetLoader? loader,
    String? path,
  }) {
    return LocaleEnv(
      supported: supported ?? this.supported,
      fallback: fallback ?? this.fallback,
      loader: loader ?? this.loader,
      path: path ?? this.path,
    );
  }
}
