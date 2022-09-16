import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/foundation.dart' show kDebugMode;

void playSound() {
  final player = AudioPlayer();
  try {
    player.play(AssetSource('sounds/444672__tissman__cool-tone.wav'),
        mode: PlayerMode.lowLatency);
  } catch (e) {
    if (kDebugMode) {
      print(e);
    }
  }
}
