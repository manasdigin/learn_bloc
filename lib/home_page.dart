import 'package:bloc_learn_sm/blocs/bloc/image_bloc.dart';
import 'package:bloc_learn_sm/repo/repositories.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: blocBody(),
    );
  }

  Widget blocBody() {
    return BlocProvider(
      create: (context) => ImageBloc(ImageRepository())..add(LoadImage()),
      child: BlocBuilder<ImageBloc, ImageState>(builder: (context, state) {
        if (state is ImageLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is ImageLoaded) {
          return ListView.builder(
            itemCount: state.images.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: CircleAvatar(
                  backgroundImage:
                      NetworkImage(state.images[index].thumbnailUrl),
                ),
                title: Text(state.images[index].title),
              );
            },
          );
        }
        return const Center(child: Text('Error'));
      }),
    );
  }
}
