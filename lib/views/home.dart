import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mgr_flutter_anim_cache_pagin_list/bloc/home_bloc.dart';
import 'package:mgr_flutter_anim_cache_pagin_list/models/photo.dart';
import 'package:mgr_flutter_anim_cache_pagin_list/services/photoService.dart';
import 'package:mgr_flutter_anim_cache_pagin_list/views/photo_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //final List<Photo> _photos = [];
  //final ScrollController _scrollController = ScrollController();
  //var scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => HomeBloc(
              RepositoryProvider.of<PhotoService>(context),
            )..add(LoadApiEvent()),
        child: Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              var controller = PrimaryScrollController.of(context);
              controller!.animateTo(0,
                  duration: Duration(seconds: 2), curve: Curves.ease);
            },
            child: Icon(Icons.arrow_upward),
          ),
          appBar: AppBar(
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                //Icon(Icons.photo_album),
                //SizedBox(width: 10),
                Text('List of photos')
              ],
            ),
          ),
          body: BlocBuilder<HomeBloc, HomeState>(
            builder: ((context, state) {
              if (state is HomeLoadingState) {
                return Center(
                  child: Scaffold(), //CircularProgressIndicator(),
                );
              }
              if (state is HomeLoadedState) {
                //_photos.addAll(state.photos);
                //print('photos: ' + '${_photos}');
                context.read<HomeBloc>().isFetching = false;

                return Scaffold(
                  body: Container(
                    color: const Color.fromARGB(255, 242, 242, 247),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: SingleChildScrollView(
                        controller: PrimaryScrollController.of(context),
                        //controller: scrollController,
                        child: Container(
                          color: const Color.fromARGB(255, 255, 255, 255),
                          height: MediaQuery.of(context).size.height,
                          width: MediaQuery.of(context).size.width,
                          child: ListView.builder(
                            //shrinkWrap: true,
                            //cacheExtent: 1000,
                            key: PageStorageKey<String>(
                                "PreserveScrollPositionHomeScreen"),
                            itemCount: state.photos.length,
                            itemBuilder: ((context, index) {
                              if (index < state.photos.length - 1) {
                                return Column(
                                  children: [
                                    PhotoCell(
                                        albumId: state.photos[index].albumId,
                                        id: state.photos[index].id,
                                        title: state.photos[index].title,
                                        url: state.photos[index].url,
                                        thumbnailUrl:
                                            state.photos[index].thumbnailUrl),
                                    Divider()
                                  ],
                                  key: Key('item_${index}'),
                                );
                              } else {
                                //if (!context.read<HomeBloc>().isFetching) {
                                context.read<HomeBloc>()
                                  ..isFetching = true
                                  ..add(LoadApiEvent());
                                return Center(
                                    child: CircularProgressIndicator());
                              }
                              //return Center(child: CircularProgressIndicator());
                            }),
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              }
              return Container();
            }),
          ),
        ));
  }
}
