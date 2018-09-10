import 'package:flutter/material.dart';
import 'package:wash_x/my_strings.dart';

class PanelContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
      decoration: new BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.horizontal(left: Radius.circular(15.0))),
      child: new Column(
        children: <Widget>[
          new Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              new Text(
                'LIVE',
                style: const TextStyle(color: Colors.blueAccent, fontSize: 18.0),
              ),
              new Row(
                children: <Widget>[
                  _getSmallButton(
                    Strings.loremIpsum,
                    () => _handleMorePress(),
                    icon: Icons.more_horiz,
                  ),
                  _getSmallButton(
                    Strings.loremIpsum,
                    () => _handleFilterPress(),
                    img: 'filter_filled.png',
                  )
                ],
              )
            ],
          ),
          new SizedBox(height: 5.0,),
          new Expanded(
              child: new ListView.builder(
                  itemCount: 30,
                  itemBuilder: (context, index) {
                    return new Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        new RichText(
                            text: new TextSpan(
                                text: '2 bags have been picked from ',
                                style: DefaultTextStyle.of(context).style.copyWith(fontSize: 15.0),
                                children: <TextSpan>[
                              new TextSpan(
                                  text: 'Leona Kober',
                                  style: DefaultTextStyle.of(context)
                                      .style
                                      .copyWith(color: Colors.blueAccent, fontSize: 15.0)),
                              new TextSpan(
                                  text: ' by ',
                                  style:
                                      DefaultTextStyle.of(context).style.copyWith(fontSize: 15.0)),
                              new TextSpan(
                                  text: 'Mendy Marcus ',
                                  style: DefaultTextStyle.of(context)
                                      .style
                                      .copyWith(color: Colors.blueAccent, fontSize: 15.0)),
                            ])),
                        new Container(
                          alignment: Alignment.centerRight,
                          child: new Text(
                            '8/12/2018 - 12:38',
                            style: const TextStyle(fontSize: 15.0),
                          ),
                        ),
                        new SizedBox(
                          height: 20.0,
                        ),
                      ],
                    );
                  }))
        ],
      ),
    );
  }

  void _handleMorePress() {
    print('More pressed');
  }

  void _handleFilterPress() {
    print('Filter pressed');
  }

  Widget _getSmallButton(String toolTip, void Function() function, {IconData icon, String img}) {
    return new IconButton(
      iconSize: 35.0,
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
                  size: 25.0,
                  color: Colors.black,
                )
              : new Image.asset(
                  'assets/images/$img',
                  color: Colors.black,
                ),
        ),
      ),
      onPressed: function,
      tooltip: toolTip,
    );
  }
}
