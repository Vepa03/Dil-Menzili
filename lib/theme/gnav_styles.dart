// lib/theme/gnav_theme.dart
import 'package:flutter/material.dart';

@immutable
class GNavTheme extends ThemeExtension<GNavTheme> {
  final Color backgroundColor;
  final Color rippleColor;
  final Color hoverColor;
  final Color activeColor;
  final Color inactiveColor;
  final Color tabBackgroundColor;

  const GNavTheme({
    required this.backgroundColor,
    required this.rippleColor,
    required this.hoverColor,
    required this.activeColor,
    required this.inactiveColor,
    required this.tabBackgroundColor,
  });

  @override
  GNavTheme copyWith({
    Color? backgroundColor,
    Color? rippleColor,
    Color? hoverColor,
    Color? activeColor,
    Color? inactiveColor,
    Color? tabBackgroundColor,
  }) {
    return GNavTheme(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      rippleColor: rippleColor ?? this.rippleColor,
      hoverColor: hoverColor ?? this.hoverColor,
      activeColor: activeColor ?? this.activeColor,
      inactiveColor: inactiveColor ?? this.inactiveColor,
      tabBackgroundColor: tabBackgroundColor ?? this.tabBackgroundColor,
    );
  }

  @override
  GNavTheme lerp(ThemeExtension<GNavTheme>? other, double t) {
    if (other is! GNavTheme) return this;
    return GNavTheme(
      backgroundColor: Color.lerp(backgroundColor, other.backgroundColor, t)!,
      rippleColor: Color.lerp(rippleColor, other.rippleColor, t)!,
      hoverColor: Color.lerp(hoverColor, other.hoverColor, t)!,
      activeColor: Color.lerp(activeColor, other.activeColor, t)!,
      inactiveColor: Color.lerp(inactiveColor, other.inactiveColor, t)!,
      tabBackgroundColor: Color.lerp(tabBackgroundColor, other.tabBackgroundColor, t)!,
    );
  }

  static const GNavTheme light = GNavTheme(
    backgroundColor: Colors.white,
    rippleColor: Color(0xFFE0E0E0),
    hoverColor: Color(0xFFF5F5F5),
    activeColor: Colors.black,
    inactiveColor: Colors.black,
    tabBackgroundColor: Color(0xFFF5F5F5),
  );

  static const GNavTheme dark = GNavTheme(
    backgroundColor: Color(0xFF121212),
    rippleColor: Color(0xFF333333),
    hoverColor: Color(0xFF1F1F1F),
    activeColor: Colors.white,
    inactiveColor: Colors.white,
    tabBackgroundColor: Color(0xFF1F1F1F),
  );
}
