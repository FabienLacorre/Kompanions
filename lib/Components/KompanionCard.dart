import 'package:flutter/material.dart';
import 'package:kompanions/Widgets/CustomText.dart';

class _KompanionCard extends State<KompanionCard> {
  @override
  Widget build(BuildContext context) {
    return (Container(
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              title: Container(
                  margin: EdgeInsets.only(bottom: 8),
                  child: CustomText(content: widget.title)),
              subtitle: CustomText(content: widget.subtitle, size: 14),
            ),
            Image.asset(widget.photoSrc),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                TextButton(
                  child: CustomText(content: 'Détail', size: 14),
                  onPressed: () {/* ... */},
                ),
                const SizedBox(width: 8),
              ],
            ),
          ],
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
