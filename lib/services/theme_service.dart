import 'package:flutter/material.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:google_fonts/google_fonts.dart';

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

  static ThemeMode _themeMode = ThemeMode.light;

  ThemeData get lightTheme => _lightTheme;

  ThemeData getTheme() {
    if (_themeMode.toString() == 'ThemeMode.dark') {
      return _darkTheme;
    }
    return _lightTheme;
  }

  void toggleThemeMode() {
    if (_themeMode.toString() == 'ThemeMode.dark') {
      print('in if');
      _themeMode = ThemeMode.light;
      return;
    }
    print('out if');
    _themeMode = ThemeMode.dark;
  }

  ThemeData get darkTheme => _darkTheme;
  // set darkTheme(ThemeData value) {
  //   _darkTheme = value;
  // }

  ThemeMode get themeMode => _themeMode;
  set themeMode(ThemeMode value) {
    _themeMode = value;
  }
}
