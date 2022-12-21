import 'package:curd/view_screen/popUp.dart';
import 'package:flutter/material.dart';

class CurdScreen extends StatefulWidget {
  const CurdScreen({Key? key}) : super(key: key);

  @override
  State<CurdScreen> createState() => _CurdScreenState();
}

class _CurdScreenState extends State<CurdScreen> {
  final popUpObj = new commonPopup();
  bool _isVisible = false;
  List<String> player_name = [];
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 10),
        child: Column(
          children: [
            Visibility(
              visible: _isVisible,
              child: Padding(
                padding: EdgeInsets.only(left: 30, right: 30),
                child: displayNameList(context),
              ),
            ),
            Spacer(),
            Container(
              height: 180,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(40),
                    topLeft: Radius.circular(40)),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                    child: Center(
                      child: Form(
                        key: _formKey,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            player_name_section(),
                            SizedBox(
                              width: 20,
                            ),
                            addPlayerButton() //--------------------add icon option
                          ],
                        ),
                      ),
                    ),
                  ),
                  messageSection() //--------------------let's play button
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  displayNameList(BuildContext context) {
    return Container(
      height: 250,
      child: ListView.builder(
          itemCount: player_name.length,
          itemBuilder: (context, index) {
            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4.0),
                color: Colors.orange,
              ),
              margin: EdgeInsets.all(2),
              padding: EdgeInsets.only(left: 20, right: 20),
              height: 40,
              child: Row(
                children: [
                  Text((index + 1).toString()),
                  Text(
                    "  ${player_name[index]}",
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  Spacer(),
                  Container(
                    //width: MediaQuery.of(context).size.width/2,
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          player_name.removeAt(index);
                        });
                      },
                      child: Container(
                        child: Icon(
                          Icons.delete,
                          color: Colors.grey.shade600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }

  Widget player_name_section() {
    return Container(
      width: MediaQuery.of(context).size.width / 1.4,
      height: 60,
      child: TextFormField(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        keyboardType: TextInputType.visiblePassword,
        controller: _nameController,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(15, 5, 0, 15),
          border: InputBorder.none,
          hintText: 'Add Player Name',
          hintStyle: TextStyle(
              fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold),
          filled: true,
          fillColor: Colors.white,
          errorStyle: TextStyle(color: Colors.red),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide:
                BorderSide(width: 1, color: Theme.of(context).hintColor),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
            borderSide: BorderSide(
              width: 0.1,
              color: Theme.of(context).hintColor,
            ),
          ),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please Enter Name of Player';
          }
          // Check if the entered email has the right format
          return null;
        },
      ),
    );
  }

  Widget addPlayerButton() {
    return Container(
      child: InkWell(
        onTap: () {
          if (_formKey.currentState!.validate()) {
            setState(() {
              _isVisible = true;
            });
            player_name.add(_nameController.text);
            _nameController.clear();
            displayNameList(context);
          }
        },
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: Colors.white,
              border: Border.all(width: 2)),
          child: Icon(
            Icons.add_circle,
            color: Colors.black,
          ),
        ),
      ),
    );
  }

  Widget messageSection() {
    // print("index  lets play : "+player_name.length.toString());
    // var errorCheck=player_name.length.toString();
    return Container(
      child: ElevatedButton(
          onPressed: () {
            if (player_name.length >= 2) {
              /*ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                    backgroundColor: Colors.green,
                    content: Text(
                      "You are enable for playing games",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.white),
                    )),
              );*/
              popUpObj.successAlert(context);
            } else {
              /* ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                    backgroundColor: Colors.red,
                    content: Text(
                      "You are Not enable for playing games",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.white),
                    )),
              );*/
              popUpObj.errorAlert(context);
            }
          },
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.orange),
          ),
          child: Text("LET`S PLAY")),
    );
  }
}
