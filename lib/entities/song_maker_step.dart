const String _imagePath = 'lib/assets/images/coffee_maker_state';

enum SongMakerStep {
  album(
    stepName: 'Album',
    stepNumber: 0,
    actionName: 'Choose Album',
    assetName: '${_imagePath}_ready.jpg',
  ),
  addSong(
    stepName: 'Add Song',
    stepNumber: 1,
    actionName: 'Add Song',
    assetName: '${_imagePath}_ready.jpg',
  ),
  readySong(
    stepName: 'ReadySong',
    stepNumber: 2,
    actionName: 'ReadySong',
    assetName: '${_imagePath}_ready.jpg',
  );

  const SongMakerStep({
    required this.stepName,
    required this.stepNumber,
    required this.actionName,
    required this.assetName,
  });

  final String stepName;
  final int stepNumber;
  final String actionName;
  final String assetName;
}