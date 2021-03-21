import 'dart:async';
import 'dart:convert';
import 'package:flutter_tmdb/network/Network.dart';
import 'package:flutter_tmdb/post/bloc/bloc.dart';
import 'package:flutter_tmdb/post/model/PostModel.dart';
import 'package:rxdart/rxdart.dart';
import 'package:bloc/bloc.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  final Network network = Network("");

  PostBloc() : super(PostInitial());

  @override
  Stream<Transition<PostEvent, PostState>> transformEvents(
    Stream<PostEvent> events,
    TransitionFunction<PostEvent, PostState> transitionFn,
  ) {
    return super.transformEvents(
      events.debounceTime(const Duration(milliseconds: 500)),
      transitionFn,
    );
  }

  @override
  Stream<PostState> mapEventToState(PostEvent event) async* {
    final currentState = state;
    if (event is PostFetched && !_hasReachedMax(currentState)) {
      try {
        if (currentState is PostInitial) {
          final posts = await _fetchPosts(0, 20);
          yield PostSuccess(posts: posts, hasReachedMax: false);
          return;
        }
        if (currentState is PostSuccess) {
          final posts = await _fetchPosts(currentState.posts.length, 20);
          yield posts.isEmpty
              ? currentState.copyWith(hasReachedMax: true)
              : PostSuccess(
                  posts: currentState.posts + posts,
                  hasReachedMax: false,
                );
        }
      } catch (error) {
        print("Error $error");
        yield PostFailure();
      }
    }
  }

  bool _hasReachedMax(PostState state) =>
      state is PostSuccess && state.hasReachedMax;


   _fetchPosts(int startIndex, int limit) async {
    var response = await network.getData(
        "https://jsonplaceholder.typicode.com/posts?_start=$startIndex&_limit=$limit");
    if (response.statusCode == 200) {
      final data = response.data as List;
      return data.map((rawPost) {
        return PostModel(
          id: rawPost['id'],
          title: rawPost['title'],
          body: rawPost['body'],
        );
      }).toList();
    } else {
      throw Exception('error fetching posts');
    }
  }
}
