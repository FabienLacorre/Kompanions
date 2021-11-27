import 'package:flutter/material.dart';
import 'package:kompanions/Widgets/CustomText.dart';

class _KompanionCard extends State<KompanionCard> {
  @override
  Widget build(BuildContext context) {
    return (Container(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Row(
                children: [
                  Flexible(
                    flex: 2,
                    child: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: AssetImage('../../assets/capuche.jpg'),
                            fit: BoxFit.cover),
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 8,
                    child: ListTile(
                      title: Container(
                          margin: EdgeInsets.only(bottom: 8),
                          child: CustomText(content: widget.title)),
                      subtitle: CustomText(content: widget.subtitle, size: 14),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    ));
  }
}

class KompanionCard extends StatefulWidget {
  KompanionCard(
      {Key? key, this.title = "", this.subtitle = "", this.photoSrc = ""})
      : super(key: key);

  final String title;
  final String subtitle;
  final String photoSrc;

  @override
  _KompanionCard createState() => _KompanionCard();
}
