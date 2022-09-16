import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:mgr_flutter_anim_cache_pagin_list/models/photo.dart';
import 'package:mgr_flutter_anim_cache_pagin_list/services/photoService.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final PhotoService _photoService;

  int page = 1;
  int limit = 20;
  bool isFetching = false;
  final List<Photo> photos = [];

  HomeBloc(this._photoService) : super(HomeLoadingState()) {
    /// Event coming to our bloc then we emit new state if we have one
    on<LoadApiEvent>((event, emit) async {
      emit(HomeLoadingState());
      print("DEBUG: --------------- FETCHING ---------------");
      //final photosList = await _photoService.getPhotos();
      final photosList =
          await _photoService.getPhotosWithPagination(limit: limit, page: page);
      page++;
      photos.addAll(photosList);
      emit(HomeLoadedState(photos));
    });
  }
}
