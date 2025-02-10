/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';
import 'package:lottie/lottie.dart' as _lottie;

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/Logo.png
  AssetGenImage get logo => const AssetGenImage('assets/icons/Logo.png');

  /// File path: assets/icons/appbarlogo.png
  AssetGenImage get appbarlogo =>
      const AssetGenImage('assets/icons/appbarlogo.png');

  /// File path: assets/icons/googlelogo.png
  AssetGenImage get googlelogo =>
      const AssetGenImage('assets/icons/googlelogo.png');

  /// List of all assets
  List<AssetGenImage> get values => [logo, appbarlogo, googlelogo];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/being-creative.png
  AssetGenImage get beingCreative =>
      const AssetGenImage('assets/images/being-creative.png');

  /// File path: assets/images/being-creative1.png
  AssetGenImage get beingCreative1 =>
      const AssetGenImage('assets/images/being-creative1.png');

  /// File path: assets/images/being-creative2.png
  AssetGenImage get beingCreative2 =>
      const AssetGenImage('assets/images/being-creative2.png');

  /// File path: assets/images/change-setting.png
  AssetGenImage get changeSetting =>
      const AssetGenImage('assets/images/change-setting.png');

  /// File path: assets/images/hot-trending.png
  AssetGenImage get hotTrending =>
      const AssetGenImage('assets/images/hot-trending.png');

  /// List of all assets
  List<AssetGenImage> get values => [
        beingCreative,
        beingCreative1,
        beingCreative2,
        changeSetting,
        hotTrending
      ];
}

class $AssetsLottieGen {
  const $AssetsLottieGen();

  /// File path: assets/lottie/face_success_icon.json
  LottieGenImage get faceSuccessIcon =>
      const LottieGenImage('assets/lottie/face_success_icon.json');

  /// File path: assets/lottie/face_wrong_icon.json
  LottieGenImage get faceWrongIcon =>
      const LottieGenImage('assets/lottie/face_wrong_icon.json');

  /// File path: assets/lottie/falil.json
  LottieGenImage get falil => const LottieGenImage('assets/lottie/falil.json');

  /// File path: assets/lottie/success.json
  LottieGenImage get success =>
      const LottieGenImage('assets/lottie/success.json');

  /// List of all assets
  List<LottieGenImage> get values =>
      [faceSuccessIcon, faceWrongIcon, falil, success];
}

class Assets {
  Assets._();

  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
  static const $AssetsLottieGen lottie = $AssetsLottieGen();
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
  });

  final String _assetName;

  final Size? size;
  final Set<String> flavors;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = true,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

class LottieGenImage {
  const LottieGenImage(
    this._assetName, {
    this.flavors = const {},
  });

  final String _assetName;
  final Set<String> flavors;

  _lottie.LottieBuilder lottie({
    Animation<double>? controller,
    bool? animate,
    _lottie.FrameRate? frameRate,
    bool? repeat,
    bool? reverse,
    _lottie.LottieDelegates? delegates,
    _lottie.LottieOptions? options,
    void Function(_lottie.LottieComposition)? onLoaded,
    _lottie.LottieImageProviderFactory? imageProviderFactory,
    Key? key,
    AssetBundle? bundle,
    Widget Function(
      BuildContext,
      Widget,
      _lottie.LottieComposition?,
    )? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    double? width,
    double? height,
    BoxFit? fit,
    AlignmentGeometry? alignment,
    String? package,
    bool? addRepaintBoundary,
    FilterQuality? filterQuality,
    void Function(String)? onWarning,
  }) {
    return _lottie.Lottie.asset(
      _assetName,
      controller: controller,
      animate: animate,
      frameRate: frameRate,
      repeat: repeat,
      reverse: reverse,
      delegates: delegates,
      options: options,
      onLoaded: onLoaded,
      imageProviderFactory: imageProviderFactory,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      package: package,
      addRepaintBoundary: addRepaintBoundary,
      filterQuality: filterQuality,
      onWarning: onWarning,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
