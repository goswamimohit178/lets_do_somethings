// import 'package:collabact/Api%20Response/bussiness_page_response/bussiness_sigment_response.dart';
// import 'package:collabact/Bloc/bussiness_page/bussiness_sigmnet_bloc/bussiness_sigment_events.dart';
// import 'package:collabact/Bloc/bussiness_page/bussiness_sigmnet_bloc/bussiness_sigmnet_states.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import '../../../Api Services/bussiness_view_api/bussiness_sigment_api.dart';
//
// class BussinessSigmentBloc extends Bloc<BussinessSigmentEvent, BussinessSigmnetState> {
//   //final BussinessSigmnetRepository _bussinessSigmnetRepository;
//
//   BussinessSigmentBloc(this._bussinessSigmnetRepository) : super(BussinessSigmnetLoadingState()) {
//     on<LoadSigmentEvent>((event, emit) async {
//       emit(BussinessSigmnetLoadingState());
//       try {
//         final sigmentList = await _bussinessSigmnetRepository.getBussinessSigment();
//    //   emit(BussinessSigmnetLoadedState(sigmentList));
//       } catch (e) {
//         emit(BussinessSigmnetErrorState(e.toString()));
//       }
//     });
//   }
// }
