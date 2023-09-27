import 'package:lets_do_somethings/Logicmodels/cubits/post_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostCubit extends Cubit<PostState> {
  PostCubit() : super(PostLoadingState());
}
