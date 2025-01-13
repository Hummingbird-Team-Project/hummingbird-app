import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

enum PlaybackState {
  playing,
  stopped,
  paused,
}

class BackgroundPlayController {
  final AudioPlayer _audioPlayer = AudioPlayer();
  final ValueNotifier<Map<Key, PlaybackState>> playbackStateMap =
      ValueNotifier({});

  final ValueNotifier<double> volumeNotifier = ValueNotifier(1.0);

  ValueNotifier<PlaybackState> playbackState =
      ValueNotifier<PlaybackState>(PlaybackState.stopped);

  final ValueNotifier<String> currentAssetNotifier =
      ValueNotifier<String>('재생 중인 오디오 없음');
  String? _currentAsset;
  bool isPlaying = false;

  Future<void> playPause(String asset) async {
    if (_currentAsset != asset) {
      await _audioPlayer.stop();
      await _audioPlayer.setAsset(asset);
      _currentAsset = asset;
      isPlaying = false;
    }

    if (isPlaying) {
      await _audioPlayer.pause();
      isPlaying = false;
    } else {
      await _audioPlayer.play();
      isPlaying = true;
    }
  }

  Future<void> playBackgroundLoopAudio(String assetPath) async {
    try {
      currentAssetNotifier.value = assetPath;
      if (_currentAsset != assetPath) {
        await _audioPlayer.stop();
        await _audioPlayer.setAsset(assetPath);
        await _audioPlayer.setLoopMode(LoopMode.all);
        _currentAsset = assetPath;
      }
      await _audioPlayer.play();
      playbackState.value = PlaybackState.playing;
    } catch (e) {
      debugPrint('Error playing audio: $e');
    }
  }

  Future<void> stopBackgroundAudio() async {
    try {
      await _audioPlayer.stop();
      await _audioPlayer.seek(Duration.zero);
      playbackState.value = PlaybackState.stopped;
    } catch (e) {
      debugPrint('Error stopping audio: $e');
    }
  }

  Future<void> resumeBackgroundAudio() async {
    try {
      await _audioPlayer.play();
      playbackState.value = PlaybackState.playing;
    } catch (e) {
      debugPrint('Error resuming audio: $e');
    }
  }

  Future<void> pauseBackgroundAudio() async {
    try {
      await _audioPlayer.pause();
      playbackState.value = PlaybackState.paused;
    } catch (e) {
      debugPrint('Error pausing audio: $e');
    }
  }

  String? getCurrentAsset() => _currentAsset;

  Stream<Duration> getPositionStream() => _audioPlayer.positionStream;

  Future<void> seekTo(Duration position) async {
    await _audioPlayer.seek(position);
  }

//재생시간 표시
  Stream<Duration> positionStream() {
    return _audioPlayer.positionStream;
  }

//setVolume
  Future<void> setVolume(double volume) async {
    await _audioPlayer.setVolume(volume);
    volumeNotifier.value = volume;
  }

  void dispose() {
    playbackState.dispose();
    currentAssetNotifier.dispose();
    _audioPlayer.dispose();
  }
}
