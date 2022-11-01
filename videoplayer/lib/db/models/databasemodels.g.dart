// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'databasemodels.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class VideoplayerModelAdapter extends TypeAdapter<VideoplayerModel> {
  @override
  final int typeId = 1;

  @override
  VideoplayerModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return VideoplayerModel(
      videoPath: fields[0] as String,
      videoName: fields[1] as String,
      folderPath: fields[2] as String,
      thumbnail: fields[3] as String,
      isFav: fields[4] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, VideoplayerModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.videoPath)
      ..writeByte(1)
      ..write(obj.videoName)
      ..writeByte(2)
      ..write(obj.folderPath)
      ..writeByte(3)
      ..write(obj.thumbnail)
      ..writeByte(4)
      ..write(obj.isFav);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is VideoplayerModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class FavVideoModelAdapter extends TypeAdapter<FavVideoModel> {
  @override
  final int typeId = 2;

  @override
  FavVideoModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FavVideoModel(
      favVideoPath: fields[0] as String,
    );
  }

  @override
  void write(BinaryWriter writer, FavVideoModel obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.favVideoPath);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FavVideoModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class PlaylistNameModelAdapter extends TypeAdapter<PlaylistNameModel> {
  @override
  final int typeId = 3;

  @override
  PlaylistNameModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PlaylistNameModel(
      addPlaylist: fields[0] as String,
    );
  }

  @override
  void write(BinaryWriter writer, PlaylistNameModel obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.addPlaylist);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PlaylistNameModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class PlaylistVideoModelAdapter extends TypeAdapter<PlaylistVideoModel> {
  @override
  final int typeId = 4;

  @override
  PlaylistVideoModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PlaylistVideoModel(
      playlistvideoPath: fields[0] as String,
      playlistfolderName: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, PlaylistVideoModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.playlistvideoPath)
      ..writeByte(1)
      ..write(obj.playlistfolderName);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PlaylistVideoModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class RecentListModelAdapter extends TypeAdapter<RecentListModel> {
  @override
  final int typeId = 5;

  @override
  RecentListModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return RecentListModel(
      recentPath: fields[0] as String,
    );
  }

  @override
  void write(BinaryWriter writer, RecentListModel obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.recentPath);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RecentListModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ImageStoreModelAdapter extends TypeAdapter<ImageStoreModel> {
  @override
  final int typeId = 6;

  @override
  ImageStoreModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ImageStoreModel(
      imagestore: fields[0] as String,
    );
  }

  @override
  void write(BinaryWriter writer, ImageStoreModel obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.imagestore);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImageStoreModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
