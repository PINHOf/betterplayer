import 'package:better_player/better_player.dart';
import 'package:better_player/src/configuration/better_player_translations.dart';
import 'package:better_player/src/controls/better_player_controls_configuration.dart';
import 'package:better_player/src/subtitles/better_player_subtitles_configuration.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'better_player_event.dart';

class BetterPlayerConfiguration {
  /// Play the video as soon as it's displayed
  final bool autoPlay;

  /// Start video at a certain position
  final Duration startAt;

  /// Whether or not the video should loop
  final bool looping;

  /// Default value is true
  final bool autoDispose;

  /// Weather or not to show the controls when initializing the widget.
  final bool showControlsOnInitialize;

  /// When the video playback runs  into an error, you can build a custom
  /// error message.
  final Widget Function(BuildContext context, String errorMessage) errorBuilder;

  /// The Aspect Ratio of the Video. Important to get the correct size of the
  /// video!
  ///
  /// Will fallback to fitting within the space allowed.
  final double aspectRatio;

  /// The placeholder is displayed underneath the Video before it is initialized
  /// or played.
  final Widget placeholder;

  /// Should the placeholder be shown until play is pressed
  final bool showPlaceholderUntilPlay;

  /// A widget which is placed between the video and the controls
  final Widget overlay;

  /// Defines if the player will start in fullscreen when play is pressed
  final bool fullScreenByDefault;

  /// Defines if the player will sleep in fullscreen or not
  final bool allowedScreenSleep;

  /// Defines aspect ratio which will be used in fullscreen
  final double fullScreenAspectRatio;

  /// Defines the set of allowed device orientations on entering fullscreen
  final List<DeviceOrientation> deviceOrientationsOnFullScreen;

  /// Defines the system overlays visible after exiting fullscreen
  final List<SystemUiOverlay> systemOverlaysAfterFullScreen;

  /// Defines the set of allowed device orientations after exiting fullscreen
  final List<DeviceOrientation> deviceOrientationsAfterFullScreen;

  /// Defines a custom RoutePageBuilder for the fullscreen
  final BetterPlayerRoutePageBuilder routePageBuilder;

  /// Defines a event listener where video player events will be send
  final Function(BetterPlayerEvent) eventListener;

  ///Defines subtitles configuration
  final BetterPlayerSubtitlesConfiguration subtitlesConfiguration;

  ///Defines controls configuration
  final BetterPlayerControlsConfiguration controlsConfiguration;

  ///Defines fit of the video, allows to fix video stretching, see possible
  ///values here: https://api.flutter.dev/flutter/painting/BoxFit-class.html
  final BoxFit fit;

  ///Defines rotation of the video in degrees. Default value is 0. Can be 0, 90, 180, 270.
  ///Angle will rotate only video box, controls will be in the same place.
  final double rotation;

  ///Defines function which will react on player visibility changed
  final Function(double visibilityFraction) playerVisibilityChangedBehavior;

  ///Defines translations used in player. If null, then default english translations
  ///will be used.
  final List<BetterPlayerTranslations> translations;

  const BetterPlayerConfiguration({
    this.aspectRatio,
    this.autoPlay = false,
    this.startAt,
    this.looping = false,
    this.autoDispose = true,
    this.fullScreenByDefault = false,
    this.placeholder,
    this.showPlaceholderUntilPlay = false,
    this.overlay,
    this.showControlsOnInitialize = true,
    this.errorBuilder,
    this.allowedScreenSleep = true,
    this.fullScreenAspectRatio,
    this.deviceOrientationsOnFullScreen = const [
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ],
    this.systemOverlaysAfterFullScreen = SystemUiOverlay.values,
    this.deviceOrientationsAfterFullScreen = const [
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ],
    this.routePageBuilder,
    this.eventListener,
    this.subtitlesConfiguration = const BetterPlayerSubtitlesConfiguration(),
    this.controlsConfiguration = const BetterPlayerControlsConfiguration(),
    this.fit = BoxFit.fill,
    this.rotation = 0,
    this.playerVisibilityChangedBehavior,
    this.translations,
  });

  BetterPlayerConfiguration copyWith({
    double aspectRatio,
    bool autoPlay,
    Duration startAt,
    bool looping,
    bool autoDispose,
    bool fullScreenByDefault,
    Widget placeholder,
    Widget overlay,
    bool showControlsOnInitialize,
    Widget Function(BuildContext context, String errorMessage) errorBuilder,
    bool allowedScreenSleep,
    double fullScreenAspectRatio,
    List<DeviceOrientation> deviceOrientationsOnFullScreen,
    List<SystemUiOverlay> systemOverlaysAfterFullScreen,
    List<DeviceOrientation> deviceOrientationsAfterFullScreen,
    BetterPlayerRoutePageBuilder routePageBuilder,
    Function(BetterPlayerEvent) eventListener,
    BetterPlayerSubtitlesConfiguration subtitlesConfiguration,
    BetterPlayerControlsConfiguration controlsConfiguration,
    BoxFit fit,
    double rotation,
    Function(double visibilityFraction) playerVisibilityChangedBehavior,
    BetterPlayerTranslations translations,
  }) {
    return BetterPlayerConfiguration(
      aspectRatio: aspectRatio ?? this.aspectRatio,
      autoPlay: autoPlay ?? this.autoPlay,
      startAt: startAt ?? this.startAt,
      looping: looping ?? this.looping,
      autoDispose: autoDispose ?? this.autoDispose,
      fullScreenByDefault: fullScreenByDefault ?? this.fullScreenByDefault,
      placeholder: placeholder ?? this.placeholder,
      overlay: overlay ?? this.overlay,
      showControlsOnInitialize:
          showControlsOnInitialize ?? this.showControlsOnInitialize,
      errorBuilder: errorBuilder ?? this.errorBuilder,
      allowedScreenSleep: allowedScreenSleep ?? this.allowedScreenSleep,
      deviceOrientationsOnFullScreen:
          deviceOrientationsOnFullScreen ?? this.deviceOrientationsOnFullScreen,
      systemOverlaysAfterFullScreen:
          systemOverlaysAfterFullScreen ?? this.systemOverlaysAfterFullScreen,
      deviceOrientationsAfterFullScreen: deviceOrientationsAfterFullScreen ??
          this.deviceOrientationsAfterFullScreen,
      routePageBuilder: routePageBuilder ?? this.routePageBuilder,
      eventListener: eventListener ?? this.eventListener,
      subtitlesConfiguration:
          subtitlesConfiguration ?? this.subtitlesConfiguration,
      controlsConfiguration:
          controlsConfiguration ?? this.controlsConfiguration,
      fit: fit ?? this.fit,
      rotation: rotation ?? this.rotation,
      playerVisibilityChangedBehavior: playerVisibilityChangedBehavior ??
          this.playerVisibilityChangedBehavior,
      translations: translations ?? this.translations,
    );
  }
}
