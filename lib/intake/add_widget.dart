import 'package:flutter/material.dart';
import 'package:wash_x/my_strings.dart';

class AddIntake extends StatefulWidget {
  @override
  _AddIntakeState createState() => _AddIntakeState();
}

class _AddIntakeState extends State<AddIntake> {
  @override
  Widget build(BuildContext context) {
    return new Container(
      alignment: Alignment.bottomCenter,
      child: Container(
        width: MediaQuery.of(context).size.shortestSide,
        margin: const EdgeInsets.symmetric(horizontal: 20.0),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
        ),
        padding: const EdgeInsets.only(left: 25.0, right: 20.0, top: 10.0),
        child: new Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            new Container(
              width: 60.0,
              height: 10.0,
              decoration: new BoxDecoration(
                  color: Colors.grey.withOpacity(0.4),
                  borderRadius: new BorderRadius.circular(50.0)),
            ),
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                new Text(
                  'INTAKE',
                  textAlign: TextAlign.left,
                  style: const TextStyle(color: Colors.blueAccent, fontWeight: FontWeight.w500),
                ),
                new FlatButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: new Text(Strings.close.toUpperCase()))
              ],
            ),
            new SizedBox(
              height: 10.0,
            ),
            new Container(
              height: (MediaQuery.of(context).size.shortestSide / 1.5),
              margin: const EdgeInsets.symmetric(horizontal: 30.0),
              child: new LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints viewpointConstraints) {
                return new SingleChildScrollView(
                  child: new Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      new Text(
                        'ITEM DETAILS',
                        textAlign: TextAlign.left,
                        style:
                            const TextStyle(color: Colors.blueAccent, fontWeight: FontWeight.w500),
                      ),
                      new SizedBox(
                        height: 15.0,
                      ),
                      new Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          new Expanded(
                            child: new TextFormField(
                              decoration: const InputDecoration(
                                border: const UnderlineInputBorder(
                                    borderSide: const BorderSide(color: Colors.grey)),
                                labelText: 'Type',
                              ),
                            ),
                          ),
                          new SizedBox(
                            width: 30.0,
                          ),
                          new Expanded(
                            child: new TextFormField(
                              decoration: const InputDecoration(
                                border: const UnderlineInputBorder(
                                    borderSide: const BorderSide(color: Colors.grey)),
                                labelText: 'Brand',
                              ),
                            ),
                          ),
                        ],
                      ),
                      new SizedBox(
                        height: 30.0,
                      ),
                      new Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          new Expanded(
                            child: new TextFormField(
                              decoration: const InputDecoration(
                                border: const UnderlineInputBorder(
                                    borderSide: const BorderSide(color: Colors.grey)),
                                labelText: 'Colors',
                              ),
                            ),
                          ),
                          new SizedBox(
                            width: 30.0,
                          ),
                          new Expanded(
                            child: new TextFormField(
                              decoration: const InputDecoration(
                                border: const UnderlineInputBorder(
                                    borderSide: const BorderSide(color: Colors.grey)),
                                labelText: 'Description',
                              ),
                            ),
                          ),
                        ],
                      ),
                      new SizedBox(
                        height: 30.0,
                      ),
                      new Text(
                        'TAGS',
                        textAlign: TextAlign.left,
                        style:
                            const TextStyle(color: Colors.blueAccent, fontWeight: FontWeight.w500),
                      ),
                      new SizedBox(
                        height: 25.0,
                      ),
                      new Container(
                        height: 50.0,
                        child: new ListView(
                          scrollDirection: Axis.horizontal,
                          children: <Widget>[
                            new Tag('LABELS'),
                            new Tag('CATEGORY'),
                            new Tag('ACCOUNT')
                          ],
                        ),
                      ),
                      new SizedBox(
                        height: 50.0,
                      ),
                      new Text(
                        'CARE',
                        textAlign: TextAlign.left,
                        style:
                            const TextStyle(color: Colors.blueAccent, fontWeight: FontWeight.w500),
                      ),
                      new SizedBox(
                        height: 50.0,
                      ),
                      new Text(
                        'IMAGES',
                        textAlign: TextAlign.left,
                        style:
                            const TextStyle(color: Colors.blueAccent, fontWeight: FontWeight.w500),
                      ),
                      new SizedBox(
                        height: 30.0,
                      ),
                      new Container(
                        height: 180.0,
                        child: new ListView(
                          scrollDirection: Axis.horizontal,
                          children: <Widget>[
                            new ImagePicker(),
                            new ImagePicker(),
                            new ImagePicker(),
                          ],
                        ),
                      ),
                      new SizedBox(
                        height: 50.0,
                      ),
                      new Text(
                        'ADD TO WASH',
                        textAlign: TextAlign.left,
                        style:
                            const TextStyle(color: Colors.blueAccent, fontWeight: FontWeight.w500),
                      ),
                      new SizedBox(
                        height: 30.0,
                      ),
                      new WashWidget(),
                      new SizedBox(
                        height: 30.0,
                      ),
                      new FlatButton(
                          onPressed: _addWash,
                          child: const Text(
                            'Add a wash',
                            style: const TextStyle(
                                color: Colors.blueAccent,
                                fontSize: 18.0,
                                decoration: TextDecoration.underline),
                          )),
                      new Container(
                        width: double.infinity,
                        alignment: Alignment.bottomRight,
                        child: new RaisedButton(
                            color: Colors.white,
                            onPressed: _submit,
                            shape: new RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(100.0)),
                            child: new Padding(
                              padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
                              child: const Text(
                                'DONE',
                                style: const TextStyle(
                                  color: Colors.blueAccent,
                                  fontSize: 18.0,
                                ),
                              ),
                            )),
                      ),
                      new SizedBox(
                        height: 20.0,
                      ),
                    ],
                  ),
                );
              }),
            )
          ],
        ),
      ),
    );
  }

  void _addWash() {}

  void _submit() {
    Navigator.pop(context);
  }
}

class Tag extends StatelessWidget {
  final String text;

  Tag(this.text);

  @override
  Widget build(BuildContext context) {
    return new Container(
      margin: const EdgeInsets.only(right: 20.0),
      child: new RaisedButton(
        onPressed: onPressed,
        color: Colors.white,
        shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(100.0)),
        child: new Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          child: new Text(
            text,
            style: const TextStyle(color: Colors.blueAccent, fontSize: 18.0),
          ),
        ),
      ),
    );
  }

  void onPressed() {}
}

class ImagePicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      width: 180.0,
      margin: const EdgeInsets.only(right: 20.0),
      child: new RaisedButton(
        onPressed: onPressed,
        color: Colors.white,
        shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(10.0)),
        child: new Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          child: new Text(
            'IMAGE',
            style: const TextStyle(color: Colors.grey, fontSize: 18.0),
          ),
        ),
      ),
    );
  }

  void onPressed() {}
}

class WashWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: new Card(
        shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(10.0)),
        child: new Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          child: new Row(
            children: <Widget>[
              new Icon(
                Icons.delete,
                size: 90.0,
                color: Colors.grey,
              ),
              new SizedBox(
                width: 20.0,
              ),
              new Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new Text(
                    'One Bag Wash',
                    style: const TextStyle(fontSize: 20.0),
                  ),
                  new SizedBox(
                    height: 10.0,
                  ),
                  new Text(
                    'Price is determined later',
                    style: const TextStyle(fontSize: 18.0),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
