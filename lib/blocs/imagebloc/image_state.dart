part of 'image_bloc.dart';

sealed class ImageState extends Equatable {
  const ImageState();

  @override
  List<Object> get props => [];
}

final class ImageInitial extends ImageState {}

final class ImageLoading extends ImageState {
  @override
  List<Object> get props => [];
}

final class ImageLoaded extends ImageState {
  final List<Albums> images;
  const ImageLoaded(this.images);

  @override
  List<Object> get props => [images];
}

final class ImageError extends ImageState {
  final String error;
  const ImageError(this.error);
  @override
  List<Object> get props => [error];
}
