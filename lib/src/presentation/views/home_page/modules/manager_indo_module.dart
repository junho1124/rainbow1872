import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../config/themes/app_theme.dart';
import '../../../../data/models/branch.dart';
import '../../../../data/models/manager.dart';
import '../../../../domain/entities/manager_state.dart';

class ManagerInfoModule extends StatelessWidget {
  const ManagerInfoModule({
    required this.manager,
    required this.branch,
    required this.managerState,
    Key? key,
  }) : super(key: key);

  final Manager manager;
  final Branch branch;
  final ManagerState managerState;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width,
      height: 62,
      decoration: BoxDecoration(
          color: AppTheme.mainAppColor,
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10))
      ),
      child: Row(
        children: [
          Flexible(
            flex: 1,
            child: Row(
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 12),
                  height: 50,
                  width: 50,
                  child: CircleAvatar(
                    backgroundColor: Colors.grey,
                    backgroundImage: manager.profileImg != "" ? NetworkImage(manager.profileImg!) : null,
                    child: manager.profileImg == "" ? Image.asset("assets/default_profile.png") : null,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 8),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(manager.name, style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold)),
                        Text(" 프로", style: TextStyle(color: Colors.white, fontSize: 8))
                      ],
                    ),
                    SizedBox(height: 4),
                    Text("${branch.branch}점", style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold))
                  ],
                )
              ],
            ),
          ),
          Flexible(child: Center(
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10)
              ),
              width: context.width * 0.27,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: EdgeInsets.all(2),
                    height: 10,
                    width: 10,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: managerState.stateColor,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: Text(managerState.state, style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: AppTheme.mainTextColor),),
                  ),
                ],
              ),
            ),
          ))
        ],
      ),
    );
  }
}
