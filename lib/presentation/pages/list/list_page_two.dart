// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// import '../../../app/di.dart';
// import '../../../bloc/list/list_bloc.dart';
// import '../../../bloc/list/list_event.dart';
// import '../../../bloc/list/list_state.dart';
// import '../../../domain/models/list_model.dart';
// import '../../../resource/routes_manager.dart';
// import '../../common_component/common_image_assets.dart';
//
// class ListPageTwo extends StatelessWidget {
//   final ListBloc _bloc = instance<ListBloc>();
//
//   ListPageTwo({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           BlocProvider(
//             create: (context) => _bloc..add(const GetListPoplar(page: 1)),
//             child: BlocConsumer<ListBloc, ListState>(
//               listener: (context, state) {},
//               builder: (context, state) {
//                 if (state is ListInitial) {
//                   return Container();
//                 } else if (state is ListLoading) {
//                   return fullscreenLoader();
//                 } else if (state is ListLoadedPopular) {
//                   return Column(
//                     children: [
//                       listOfData(state.list),
//                     ],
//                   );
//                 } else if (state is ListEmpty) {
//                   return noDataFound();
//                 } else {
//                   return Container();
//                 }
//               },
//             ),
//           )
//         ],
//       ),
//     );
//   }
//
//   Widget fullscreenLoader() {
//     return const Center(
//       child: CircularProgressIndicator(
//         color: Colors.blue,
//       ),
//     );
//   }
//
//   Widget listOfData(List<TopData> listNearBy) {
//     return ListView.builder(
//       shrinkWrap: true,
//       itemBuilder: (context, index) {
//         return Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Row(
//             children: [
//               CommonImageAsset(
//                 image: "",
//                 height: 170,
//                 width: 150,
//               ),
//               Text(listNearBy[index].name!),
//             ],
//           ),
//         );
//       },
//       itemCount: listNearBy.length,
//     );
//   }
//
//   Widget noDataFound() {
//     return const Center(
//       child: Text("No Data Found"),
//     );
//   }
// }
