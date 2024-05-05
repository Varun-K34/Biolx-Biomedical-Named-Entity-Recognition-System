
import 'package:flutter/material.dart';
import '../core/app_export.dart';

/// A collection of pre-defined text styles for customizing text appearance,
/// categorized by different font families and weights.
/// Additionally, this class includes extensions on [TextStyle] to easily apply specific font families to text.

class CustomTextStyles {
  // Display text style
  static get displayMedium40 => theme.textTheme.displayMedium!.copyWith(
        fontSize: 40.fSize,
      );
  static get displayMedium48 => theme.textTheme.displayMedium!.copyWith(
        fontSize: 48.fSize,
      );
  static get displayMediumAlata =>
      theme.textTheme.displayMedium!.alata.copyWith(
        fontSize: 48.fSize,
      );
  static get displayMediumAlata40 =>
      theme.textTheme.displayMedium!.alata.copyWith(
        fontSize: 40.fSize,
      );
  static get displayMediumAlataPrimary =>
      theme.textTheme.displayMedium!.alata.copyWith(
        color: theme.colorScheme.primary,
        fontSize: 48.fSize,
      );
  static get displayMediumEmilysCandy =>
      theme.textTheme.displayMedium!.emilysCandy.copyWith(
        fontSize: 48.fSize,
      );
  static get displayMediumEmilysCandy_1 =>
      theme.textTheme.displayMedium!.emilysCandy;
  static get displayMediumHubballiPrimary =>
      theme.textTheme.displayMedium!.hubballi.copyWith(
        color: theme.colorScheme.primary,
      );
  static get displayMediumPrimary => theme.textTheme.displayMedium!.copyWith(
        color: theme.colorScheme.primary,
        fontSize: 40.fSize,
      );
}

extension on TextStyle {
  TextStyle get alata {
    return copyWith(
      fontFamily: 'Alata',
    );
  }

  TextStyle get hubballi {
    return copyWith(
      fontFamily: 'Hubballi',
    );
  }

  TextStyle get deliusSwashCaps {
    return copyWith(
      fontFamily: 'Delius Swash Caps',
    );
  }

  TextStyle get emilysCandy {
    return copyWith(
      fontFamily: 'Emilys Candy',
    );
  }
}
