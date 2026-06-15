// dart format width=80

/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: deprecated_member_use,directives_ordering,implicit_dynamic_list_literal,unnecessary_import

import 'package:flutter/widgets.dart';

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/1629506.png
  AssetGenImage get a1629506 =>
      const AssetGenImage('assets/images/1629506.png');

  /// File path: assets/images/3329379.png
  AssetGenImage get a3329379 =>
      const AssetGenImage('assets/images/3329379.png');

  /// File path: assets/images/3899618.png
  AssetGenImage get a3899618Png =>
      const AssetGenImage('assets/images/3899618.png');

  /// File path: assets/images/3899618.svg
  String get a3899618Svg => 'assets/images/3899618.svg';

  /// File path: assets/images/Group 1.png
  AssetGenImage get group1 => const AssetGenImage('assets/images/Group 1.png');

  /// File path: assets/images/arrow.svg
  String get arrow => 'assets/images/arrow.svg';

  /// File path: assets/images/article_writing.svg
  String get articleWriting => 'assets/images/article_writing.svg';

  /// File path: assets/images/circle.png
  AssetGenImage get circle => const AssetGenImage('assets/images/circle.png');

  /// File path: assets/images/home.png
  AssetGenImage get home => const AssetGenImage('assets/images/home.png');

  /// File path: assets/images/icon.png
  AssetGenImage get icon => const AssetGenImage('assets/images/icon.png');

  /// File path: assets/images/logo.png
  AssetGenImage get logo => const AssetGenImage('assets/images/logo.png');

  /// File path: assets/images/podcast.png
  AssetGenImage get podcast => const AssetGenImage('assets/images/podcast.png');

  /// File path: assets/images/re.png
  AssetGenImage get re => const AssetGenImage('assets/images/re.png');

  /// File path: assets/images/register.png
  AssetGenImage get register =>
      const AssetGenImage('assets/images/register.png');

  /// File path: assets/images/right_arrow.png
  AssetGenImage get rightArrowPng =>
      const AssetGenImage('assets/images/right_arrow.png');

  /// File path: assets/images/right_arrow.svg
  String get rightArrowSvg => 'assets/images/right_arrow.svg';

  /// File path: assets/images/search.svg
  String get search => 'assets/images/search.svg';

  /// File path: assets/images/single_place_holder.jpg
  AssetGenImage get singlePlaceHolder =>
      const AssetGenImage('assets/images/single_place_holder.jpg');

  /// File path: assets/images/threeLine.svg
  String get threeLine => 'assets/images/threeLine.svg';

  /// File path: assets/images/user.png
  AssetGenImage get user => const AssetGenImage('assets/images/user.png');

  /// File path: assets/images/welcome.svg
  String get welcome => 'assets/images/welcome.svg';

  /// File path: assets/images/write.png
  AssetGenImage get write => const AssetGenImage('assets/images/write.png');

  /// File path: assets/images/write_article.png
  AssetGenImage get writeArticle =>
      const AssetGenImage('assets/images/write_article.png');

  /// File path: assets/images/write_podcast_icon.png
  AssetGenImage get writePodcastIcon =>
      const AssetGenImage('assets/images/write_podcast_icon.png');

  /// List of all assets
  List<dynamic> get values => [
    a1629506,
    a3329379,
    a3899618Png,
    a3899618Svg,
    group1,
    arrow,
    articleWriting,
    circle,
    home,
    icon,
    logo,
    podcast,
    re,
    register,
    rightArrowPng,
    rightArrowSvg,
    search,
    singlePlaceHolder,
    threeLine,
    user,
    welcome,
    write,
    writeArticle,
    writePodcastIcon,
  ];
}

class Assets {
  const Assets._();

  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
    this.animation,
  });

  final String _assetName;

  final Size? size;
  final Set<String> flavors;
  final AssetGenImageAnimation? animation;

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
    FilterQuality filterQuality = FilterQuality.medium,
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

  ImageProvider provider({AssetBundle? bundle, String? package}) {
    return AssetImage(_assetName, bundle: bundle, package: package);
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

class AssetGenImageAnimation {
  const AssetGenImageAnimation({
    required this.isAnimation,
    required this.duration,
    required this.frames,
  });

  final bool isAnimation;
  final Duration duration;
  final int frames;
}
