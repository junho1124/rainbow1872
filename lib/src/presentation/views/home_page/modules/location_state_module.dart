import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';
import 'package:rainbow1872/src/presentation/view_model/home_view_model.dart';

class LocationStateModule extends StatelessWidget {
  const LocationStateModule({
    required this.viewModel,
    Key? key,
  }) : super(key: key);

  final HomeViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 50,
          width: context.width * 0.5,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Color(0xA4A871FD), Colors.lightBlueAccent],
                stops: [0.2, 0.6])
          ),
          child: Center(
              child: Text(
                viewModel.branch.branch,
                style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              )),
        ),
        Container(
          height: 50,
          width: context.width * 0.5,
          child: Center(
              child: Text(viewModel.storeState,
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w500))),
        ),
      ],
    );
  }
}
