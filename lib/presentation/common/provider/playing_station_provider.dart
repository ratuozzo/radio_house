import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:radio_player/radio_player.dart';

import '../../../model/station/station.dart';

final playingStationProvider =
    ChangeNotifierProvider<PlayingStationPresenter>((ref) {
  return PlayingStationPresenter();
});

class PlayingStationPresenter extends ChangeNotifier {
  Station? station;
  RadioPlayer radioPlayer = RadioPlayer();
  bool isPlaying = false;
  bool loadingPlay = false;

  void setStation(Station station) async {
    if (station != this.station) {
      this.station = station;
      notifyListeners();
      await radioPlayer.setChannel(
        title: station.name,
        url: station.url,
      );
    }
  }

  void setPlayingStation(Station? station) async {
    if (this.station != station) {
      this.station = station;
      notifyListeners();
    }
    if (station == null) {
      isPlaying = false;
      notifyListeners();
      await radioPlayer.stop();
    } else {
      isPlaying = true;
      loadingPlay = true;
      notifyListeners();
      await radioPlayer.setChannel(
        title: station.name,
        url: station.url,
      );
      await radioPlayer.play();
      loadingPlay = false;
      notifyListeners();
    }
  }

  void pause() async {
    await radioPlayer.pause();
    isPlaying = false;
    notifyListeners();
  }

  void play() async {
    loadingPlay = true;
    notifyListeners();
    await radioPlayer.play();
    isPlaying = true;
    loadingPlay = false;
    notifyListeners();
  }
}
