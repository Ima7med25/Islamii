import 'package:audioplayers/audioplayers.dart';

class AudioService {
  static final AudioService _instance = AudioService._internal();

  factory AudioService() => _instance;

  AudioService._internal();

  AudioPlayer? _player;

  Future<void> init() async {
    _player ??= AudioPlayer();
  }

  Future<void> play(String url) async {
    await init();
    await _player!.play(UrlSource(url));
  }

  Future<void> pause() async {
    await _player?.pause();
  }

  Future<void> resume() async {
    await _player?.resume();
  }

  Future<void> stop() async {
    await _player?.stop();
  }

  Future<void> seek(Duration position) async {
    await _player?.seek(position);
  }

  Future<void> setVolume(double volume) async {
    await _player?.setVolume(volume);
  }

  Future<void> setSpeed(double speed) async {
    await _player?.setPlaybackRate(speed);
  }

  Future<void> dispose() async {
    await _player?.dispose();
    _player = null;
  }

  Future<PlayerState?> getPlayerState() async {
    return _player?.state;
  }

  Stream<PlayerState>? get onPlayerStateChanged =>
      _player?.onPlayerStateChanged;
  Stream<Duration>? get onPositionChanged => _player?.onPositionChanged;
  Stream<Duration>? get onDurationChanged => _player?.onDurationChanged;
}
