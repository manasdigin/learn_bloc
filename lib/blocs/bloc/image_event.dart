part of 'image_bloc.dart';

sealed class ImageEvent extends Equatable {
  const ImageEvent();
}

class LoadImage extends ImageEvent {
  @override
  List<Object> get props => [];
}
