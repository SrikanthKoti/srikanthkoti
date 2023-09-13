import 'package:flutter/material.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:srikanthkoti/app/app.locator.dart';
import 'package:srikanthkoti/services/shared_preference_service.dart';
import 'package:srikanthkoti/services/shared_preference_service.dart';
import 'package:stacked/stacked.dart';

class ThemeService {
  final ThemeData _lightTheme = FlexThemeData.light(
    // scheme: FlexScheme.deepPurple,
    scheme: FlexScheme.materialBaseline,
    surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
    blendLevel: 7,
    subThemesData: const FlexSubThemesData(
      blendOnLevel: 10,
      blendOnColors: false,
      useTextTheme: true,
      useM2StyleDividerInM3: true,
      useInputDecoratorThemeInDialogs: true,
    ),
    visualDensity: FlexColorScheme.comfortablePlatformDensity,
    useMaterial3: true,
    swapLegacyOnMaterial3: true,
    fontFamily: GoogleFonts.ibmPlexMono().fontFamily,
  );
  final ThemeData _darkTheme = FlexThemeData.dark(
    // scheme: FlexScheme.deepPurple,
    scheme: FlexScheme.materialBaseline,
    surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
    blendLevel: 13,
    subThemesData: const FlexSubThemesData(
      blendOnLevel: 20,
      useTextTheme: true,
      useM2StyleDividerInM3: true,
      useInputDecoratorThemeInDialogs: true,
    ),
    visualDensity: FlexColorScheme.comfortablePlatformDensity,
    useMaterial3: true,
    swapLegacyOnMaterial3: true,
    fontFamily: GoogleFonts.ibmPlexMono().fontFamily,
  );

  final _storageService = locator<SharedPreferencesService>();

  final ValueNotifier<ThemeMode> _themeModeNotifier =
      ValueNotifier<ThemeMode>(ThemeMode.dark);

  ThemeData get lightTheme => _lightTheme;

  ThemeData getTheme() {
    if (_themeModeNotifier.value.toString() == 'ThemeMode.dark') {
      return _darkTheme;
    }
    return _lightTheme;
  }

  void toggleThemeMode() {
    if (_themeModeNotifier.value.toString() == 'ThemeMode.dark') {
      print('in if');
      _themeModeNotifier.value = ThemeMode.light;
      _storageService.saveToDisk('THEME_MODE', ThemeMode.light.toString());
      return;
    }
    print('out if');
    _themeModeNotifier.value = ThemeMode.dark;
    _storageService.saveToDisk('THEME_MODE', ThemeMode.dark.toString());
  }

  ThemeData get darkTheme => _darkTheme;
  // set darkTheme(ThemeData value) {
  //   _darkTheme = value;
  // }

  ValueNotifier<ThemeMode> get themeModeNotifier => _themeModeNotifier;
}
