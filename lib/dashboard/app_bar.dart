import 'package:flutter/material.dart';
import 'package:wash_x/my_strings.dart';
import 'package:wash_x/constants.dart';

class MyAppBar extends StatefulWidget implements PreferredSizeWidget {
  final bool showElevation;

  MyAppBar(this.showElevation);

  @override
  State<StatefulWidget> createState() => new _MyAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(100.0);
}

class _MyAppBarState extends State<MyAppBar> {
  var _selectedCity = 0;
  var _selectedUser = 0;
  var _selectedSubUser = 0;
  MediaQueryData mediaQueryData;

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    Widget leading = new Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        new Container(
          height: 50.0,
          width: 50.0,
          decoration: new BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.grey[700],
          ),
        ),
        new SizedBox(
          width: 20.0,
        ),
        new Text(
          Strings.washPanel.toUpperCase(),
          style: const TextStyle(fontSize: FontSize.medium),
        )
      ],
    );

    Widget smallButtons = new Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        _getSmallButton(
          Strings.loremIpsum,
          () => _handleMorePress(),
          icon: Icons.more_horiz,
        ),
        _getSmallButton(
          Strings.loremIpsum,
          () => _handleProfilePress(),
          icon: Icons.person,
        ),
        _getSmallButton(
          Strings.loremIpsum,
          () => _handleFilterPress(),
          img: 'filter_filled.png',
        )
      ],
    );

//    Widget dropDowns = new Row(
//      crossAxisAlignment: CrossAxisAlignment.center,
//      children: <Widget>[
//        _getDropWidget(
//            _selectedUser == 0 ? drivers : partners, users[_selectedUser], _selectedSubUser,
//            onSelected: (int index) => setState(() => _selectedSubUser = index),
//            users: users,
//            userIndex: _selectedUser,
//            onUserSelected: (int index) => setState(() {
//                  _selectedSubUser = 0;
//                  _selectedUser = index;
//                })),
//        _getDropWidget(cities, 'Cities', _selectedCity,
//            onSelected: (int index) => setState(() => _selectedCity = index))
//      ],
//    );

    Widget trailing = new Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[smallButtons],
    );

    Widget appBar = new Container(
      padding: new EdgeInsets.only(
          top: mediaQueryData.padding.top + 3.0, right: 10.0, left: 10.0, bottom: 3.0),
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[leading, trailing],
      ),
    );

    return new Semantics(
      container: true,
      explicitChildNodes: true,
      child: new Material(
        color: Colors.white,
        elevation: widget.showElevation? 3.0: 0.0,
        child: appBar,
      ),
    );
  }

  void _handleMorePress() {
    print('More pressed');
  }

  void _handleProfilePress() {
    print('Profile pressed');
  }

  void _handleFilterPress() {
    print('Filter pressed');
  }

  Widget _getSmallButton(String toolTip, void Function() function, {IconData icon, String img}) {
    return new IconButton(
      iconSize: 45.0,
      icon: new Card(
        elevation: 2.0,
        margin: const EdgeInsets.all(0.0),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(100.0)),
        ),
        child: new Padding(
          padding: new EdgeInsets.all(img == null ? 5.0 : 10.0),
          child: img == null
              ? Icon(
                  icon,
                  size: 35.0,
                  color: Colors.black,
                )
              : new Image.asset(
                  'assets/images/$img',
                  color: Colors.black,
                  width: 22.0,
                  height: 22.0,
                ),
        ),
      ),
      onPressed: function,
      tooltip: toolTip,
    );
  }

  Widget _getDropWidget(List<String> items, String name, int index,
      {@required PopupMenuItemSelected<int> onSelected,
      List<String> users,
      int userIndex,
      PopupMenuItemSelected<int> onUserSelected}) {
    List<CheckedPopupMenuItem<int>> menuItems = List(items.length);
    for (var i = 0; i < items.length; ++i) {
      menuItems[i] = new CheckedPopupMenuItem(
        checked: i == index,
        value: i,
        child: new Text(items[i]),
      );
    }

    List<CheckedPopupMenuItem<int>> nameItems;
    if (users != null) {
      nameItems = List(users.length);
      for (var i = 0; i < users.length; ++i) {
        nameItems[i] = new CheckedPopupMenuItem(
          checked: i == userIndex,
          value: i,
          child: new Text(users[i]),
        );
      }
    }

    return new Card(
      elevation: 2.0,
      margin: const EdgeInsets.symmetric(horizontal: 7.0),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(100.0)),
      ),
      child: new Container(
        width: mediaQueryData.size.width / 5.0,
        padding: const EdgeInsets.only(left: 15.0),
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            users != null
                ? new Container(
                    child: new PopupMenuButton<int>(
                        child: new Row(
                          children: <Widget>[
                            new Text(
                              users[userIndex],
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            new SizedBox(
                              width: 5.0,
                            ),
                            new Icon(Icons.keyboard_arrow_down)
                          ],
                        ),
                        onSelected: onUserSelected,
                        itemBuilder: (BuildContext context) => nameItems),
                  )
                : new Text(
                    name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
            new SizedBox(
              width: 15.0,
            ),
            new Expanded(
                child: new Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                new Expanded(
                  child: new Text(
                    items[index],
                    maxLines: 1,
                    textAlign: TextAlign.end,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                new SizedBox(
                  width: 5.0,
                ),
                new PopupMenuButton<int>(
                    icon: const Icon(
                      Icons.arrow_drop_down_circle,
                      color: Colors.black,
                    ),
                    padding: EdgeInsets.zero,
                    onSelected: onSelected,
                    itemBuilder: (BuildContext context) => menuItems)
              ],
            ))
          ],
        ),
      ),
    );
  }
}

var cities = ['Montreal', 'Quebec City', 'Laval', 'Longueuil'];
var drivers = ['All', 'Janeth, Anthony ', 'William Samuel', 'Felix Logan'];
var partners = [
  'Partner 1',
  'Partner 3',
  'Partner 3',
];
var users = ['Drivers', 'Partners'];
