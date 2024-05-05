import 'package:Biolx/core/utils/size_utils.dart';
import 'package:Biolx/theme/theme_helper.dart';
import 'package:flutter/material.dart';


class AppDecoration {
  // Gradient decorations
  static BoxDecoration get gradientIndigoToIndigoC => BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment(0.5, 0),
          end: Alignment(0.5, 1),
          colors: [
            appTheme.indigo400,
            appTheme.indigo400.withOpacity(0.57),
            appTheme.indigo4000c,
          ],
        ),
      );
  static BoxDecoration get gradientOnPrimaryToOnError => BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment(0.5, 0),
          end: Alignment(0.5, 1),
          colors: [
            theme.colorScheme.onPrimary,
            theme.colorScheme.onError,
            theme.colorScheme.onError,
          ],
        ),
      );
  static BoxDecoration get gradientOnPrimaryToOnError1 => BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment(0.5, 0),
          end: Alignment(0.5, 1),
          colors: [
            theme.colorScheme.onPrimary.withOpacity(1),
            theme.colorScheme.onError,
            theme.colorScheme.onError,
          ],
        ),
      );
  static BoxDecoration get gradientOnPrimaryToOnPrimaryContainer =>
      BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment(0.5, 0),
          end: Alignment(0.5, 1),
          colors: [
            theme.colorScheme.onPrimary.withOpacity(1),
            theme.colorScheme.onError,
            theme.colorScheme.onPrimaryContainer,
          ],
        ),
      );
  static BoxDecoration get gradientPrimaryContainerToOnErrorContainer =>
      BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment(0.5, 1),
          end: Alignment(0.5, 0.15),
          colors: [
            theme.colorScheme.primaryContainer,
            theme.colorScheme.onErrorContainer,
          ],
        ),
      );

  // Outline decorations
  static BoxDecoration get outlinePrimary => BoxDecoration(
        color: theme.colorScheme.secondaryContainer,
        border: Border.all(
          color: theme.colorScheme.primary,
          width: 1.h,
          strokeAlign: strokeAlignOutside,
        ),
      );
}

class BorderRadiusStyle {
  // Circle borders
  static BorderRadius get circleBorder100 => BorderRadius.circular(
        100.h,
      );
  static BorderRadius get circleBorder105 => BorderRadius.circular(
        105.h,
      );
  static BorderRadius get circleBorder120 => BorderRadius.circular(
        120.h,
      );
  static BorderRadius get circleBorder140 => BorderRadius.circular(
        140.h,
      );
  static BorderRadius get circleBorder45 => BorderRadius.circular(
        45.h,
      );
  static BorderRadius get circleBorder95 => BorderRadius.circular(
        95.h,
      );

  // Rounded borders
  static BorderRadius get roundedBorder20 => BorderRadius.circular(
        20.h,
      );
  static BorderRadius get roundedBorder30 => BorderRadius.circular(
        30.h,
      );
  static BorderRadius get roundedBorder33 => BorderRadius.circular(
        33.h,
      );
  static BorderRadius get roundedBorder38 => BorderRadius.circular(
        38.h,
      );
}

// Comment/Uncomment the below code based on your Flutter SDK version.

// For Flutter SDK Version 3.7.2 or greater.

double get strokeAlignInside => BorderSide.strokeAlignInside;

double get strokeAlignCenter => BorderSide.strokeAlignCenter;

double get strokeAlignOutside => BorderSide.strokeAlignOutside;

// For Flutter SDK Version 3.7.1 or less.

// StrokeAlign get strokeAlignInside => StrokeAlign.inside;
//
// StrokeAlign get strokeAlignCenter => StrokeAlign.center;
//
// StrokeAlign get strokeAlignOutside => StrokeAlign.outside;
