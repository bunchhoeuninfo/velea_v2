import 'package:equatable/equatable.dart';
import 'package:velea_v2/entities/song_maker_step.dart';
import 'package:velea_v2/models/song.dart';

class SongSelected extends Equatable {
  final String id;
  final SongMakerStep songMakerStep;
  final Song song;
  const SongSelected({
    required this.id,
    required this.song,
    required this.songMakerStep,
  });
  
  @override
  // TODO: implement props
  List<Object?> get props => [id, songMakerStep, song];
  
  SongSelected copyWith({
    String? id,
    SongMakerStep? songMakerStep,
    Song? song,
  }) {
    return SongSelected(id: id ?? this.id, song: song ?? this.song, songMakerStep: songMakerStep ?? this.songMakerStep);
  }
}