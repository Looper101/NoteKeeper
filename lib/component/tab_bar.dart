import 'package:crudoperation/constant/constants.dart';
import 'package:flutter/material.dart';

class TabbarCustom extends StatelessWidget {
  const TabbarCustom({
    Key key,
    @required TabController tabController,
  })  : _tabController = tabController,
        super(key: key);

  final TabController _tabController;

  @override
  Widget build(BuildContext context) {
    return TabBar(
      indicatorSize: TabBarIndicatorSize.label,
      indicatorWeight: 2,
      indicatorColor: Colors.black,
      controller: _tabController,
      labelColor: Colors.black,
      labelStyle: kSelectedLabelTextStyle,
      unselectedLabelColor: Colors.grey[400],
      unselectedLabelStyle: kUnselectedLabelTextStyle,
      tabs: <Widget>[
        Tab(
          child: Text(
            'Notes',
          ),
        ),
        Tab(
          child: Text(
            'Vip',
          ),
        ),
        Tab(
          child: Text(
            'Checked',
          ),
        ),
      ],
    );
  }
}
