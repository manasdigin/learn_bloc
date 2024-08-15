import 'package:bloc/bloc.dart';
import 'package:bloc_learn_sm/model/user_model.dart';
import 'package:bloc_learn_sm/repo/repositories.dart';
import 'package:equatable/equatable.dart';

part 'image_event.dart';
part 'image_state.dart';

class ImageBloc extends Bloc<ImageEvent, ImageState> {
  final ImageRepository repository;
  ImageBloc(this.repository) : super(ImageInitial()) {
    on<LoadImage>((event, emit) async {
      emit(ImageLoading());
      try {
        final images = await repository.getImages();
        emit(ImageLoaded(images));
      } catch (e) {
        emit(ImageError(e.toString()));
      }
    });
  }
}
