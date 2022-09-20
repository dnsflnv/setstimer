import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/foundation.dart' show kDebugMode;
import 'package:flutter_vibrate/flutter_vibrate.dart';
import 'dart:io' show Platform;

void playSoundAndVibrate() {
  final Iterable<Duration> pauses = [
    const Duration(milliseconds: 500),
    const Duration(milliseconds: 500),
    const Duration(milliseconds: 500),
  ];
  final player = AudioPlayer();
  try {
    player.play(AssetSource('sounds/545913__jose-danielms__alarm.wav'),
        mode: PlayerMode.lowLatency);
    if (Platform.isIOS || Platform.isAndroid) {
      Vibrate.vibrateWithPauses(pauses);
    }
  } catch (e) {
    if (kDebugMode) {
      print(e);
    }
  }
}
