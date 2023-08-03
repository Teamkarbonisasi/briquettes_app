import 'package:flutter/material.dart';

class AccordionCustom extends StatefulWidget {
  final String title;
  final String text;
  final Widget? image;

  const AccordionCustom({
    super.key,
    required this.title,
    required this.text,
    this.image,
  });

  @override
  State<AccordionCustom> createState() => _AccordionCustomState();
}

class _AccordionCustomState extends State<AccordionCustom> {
  bool _expand = false;

  void changeExpand() {
    setState(() {
      _expand = !_expand;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 1,
                    child: Text(
                      widget.title,
                      style: const TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w700,
                        overflow: TextOverflow.ellipsis,
                      ),
                      maxLines: 3,
                    ),
                  ),
                  IconButton(
                    onPressed: changeExpand,
                    icon: Icon(
                      _expand ? Icons.expand_less : Icons.expand_more,
                      size: 36.0,
                    ),
                  ),
                ],
              ),
              Container(
                child: _expand
                    ? Container(
                        margin: const EdgeInsets.symmetric(vertical: 10.0),
                        child: Text(
                          widget.text,
                          style: const TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      )
                    : null,
              ),
            ],
          ),
        ),
        const Divider(
          color: Colors.black,
        ),
      ],
    );
  }
}
