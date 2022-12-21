import 'package:flutter/material.dart';

class commonPopup {
  errorAlert(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _containerWidth = _width - 40;

    return showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            insetPadding:
                EdgeInsets.only(left: 20, right: 20, top: 30, bottom: 30),
            backgroundColor: Colors.red,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0))),
            child: Container(
              width: _containerWidth,
              // height: 250,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 30, left: 20, right: 20, bottom: 30),
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    Text(
                      "Sorry! can't proceed, please add at least 2 player's name",
                      textAlign: TextAlign.center,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: MaterialButton(
                                onPressed: () async {
                                  Navigator.of(context).pop();
                                },
                                minWidth: _containerWidth / 2.7,
                                height: 40,
                                color: const Color(0xFFE73E34),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                child: const Text(
                                  'ok',
                                )),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }

  successAlert(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _containerWidth = _width - 40;

    return showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            insetPadding:
                EdgeInsets.only(left: 20, right: 20, top: 30, bottom: 30),
            backgroundColor: Colors.red,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0))),
            child: Container(
              width: _containerWidth,
              // height: 250,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 30, left: 20, right: 20, bottom: 30),
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    Text(
                      'You have Successfully sent Player Details',
                      textAlign: TextAlign.center,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: MaterialButton(
                                onPressed: () async {
                                  Navigator.of(context).pop();
                                },
                                minWidth: _containerWidth / 2.7,
                                height: 40,
                                color: const Color(0xFFE73E34),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                child: const Text(
                                  'ok',
                                )),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }
}
