import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isbool = false;
  bool isLightMode = true;
  String selectRadio = "human";
  @override
  Widget build(BuildContext context) {
    var listData = ["male", "female", "human"];
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.amber,
      appBar: AppBar(
        title: Text("dialogue Box"),
        backgroundColor: Colors.amber,
      ),
      body: Column(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ElevatedButton(
            onPressed: () {
              showDialog(
                  context: context,
                  barrierDismissible: false,
                  barrierColor: Colors.yellow.withOpacity(0.3),
                  builder: (context) {
                    return AlertDialog(
                      title: Text("Delete?"),
                      icon: Icon(Icons.delete),
                      backgroundColor: Colors.greenAccent,
                      content: Text("are you sure want to delete"),
                      actions: [
                        TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text("yes")),
                        TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text("No"))
                      ],
                    );
                  });
            },
            child: Text("Alert button"),
          ),
          ElevatedButton(
              onPressed: () {
                showDialog(
                    barrierColor: Colors.greenAccent.withOpacity(0.3),
                    barrierDismissible: false,
                    context: context,
                    builder: (context) {
                      return SimpleDialog(
                        backgroundColor: Colors.lightBlueAccent,
                        title: Text("delete data"),
                        children: [
                          SimpleDialogOption(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text("hindi"),
                          ),
                          SimpleDialogOption(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text("english"),
                          ),
                          SimpleDialogOption(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text("science"),
                          ),
                          SimpleDialogOption(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text("Math"),
                          ),
                        ],
                      );
                    });
              },
              child: Text("simple dialogue")),
          ElevatedButton(
              onPressed: () {
                showDialog(
                    barrierColor: Colors.greenAccent.withOpacity(0.3),
                    barrierDismissible: false,
                    context: context,
                    builder: (context) {
                      return AboutDialog(
                        applicationVersion: "v1.0",
                        applicationIcon: Icon(Icons.ac_unit),
                        applicationName: "classico",
                        applicationLegalese: "this app is about",
                      );
                    });
              },
              child: Text("about dialogue")),
          ElevatedButton(
              onPressed: () {
                showGeneralDialog(
                    barrierLabel: "costum",
                    barrierDismissible: true,
                    context: context,
                    pageBuilder: (_, __, ___) {
                      return Center(
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 12),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.lightBlueAccent),
                          height: 250,
                          child: Material(
                            color: Colors.transparent,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  TextField(),
                                  TextField(),
                                  SizedBox(
                                    height: 30,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      ElevatedButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: Text("add")),
                                      ElevatedButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: Text("subtract"))
                                    ],
                                  )
                                  //TextField(),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    });
              },
              child: Text("costum dialogue")),
          ElevatedButton(
              onPressed: () async {
                var selectDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2000, 9, 8),
                    lastDate: DateTime.now());
                if (selectDate != null) {
                  print(
                      "selectdate: ${selectDate.day} / ${selectDate.month} / ${selectDate.year}");
                }
              },
              child: Text("datepicker")),
          ElevatedButton(
              onPressed: () async {
                var selectTime = await showTimePicker(
                    context: context,
                    initialTime: TimeOfDay(hour: 5, minute: 15));
              },
              child: Text("timepicker")),
          ElevatedButton(
              onPressed: () async {
                var showrange = await showDateRangePicker(
                    context: context,
                    firstDate: DateTime(2000, 4, 30),
                    lastDate: DateTime.now());
                if (showrange != null) {
                  print(
                      "selectdate: ${showrange.start.day}/${showrange.start.month}/${showrange.start.year}= ${showrange.end.day}"
                      "/${showrange.end.month}/${showrange.end.year}");
                }
              },
              child: Text("range picker")),
          ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Row(
                    children: [
                      Icon(
                        Icons.favorite,
                        color: Colors.red,
                      ),
                      Text("    welcome to flutter"),
                    ],
                  ),
                  backgroundColor: Colors.lightBlueAccent.withOpacity(0.8),
                  behavior: SnackBarBehavior.floating,
                  showCloseIcon: true,
                  action: SnackBarAction(
                    onPressed: () {},
                    label: "retry",
                    textColor: Colors.red,
                  ),
                  // width: 10,
                ));
              },
              child: Text("snack bar")),
          ElevatedButton(
              onPressed: () {
                showModalBottomSheet(
                    enableDrag: false,
                    isDismissible: false,
                    context: context,
                    builder: (context) {
                      return Container(
                        height: 400,
                        color: Colors.amber,
                        child: Column(
                          children: [
                            TextField(),
                            TextField(),
                            SizedBox(
                              height: 40,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                ElevatedButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text("okay")),
                                ElevatedButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text("cancel")),
                              ],
                            ),
                          ],
                        ),
                      );
                    });
              },
              child: Text("bottom sheet")),
          Checkbox.adaptive(
              splashRadius: 50,
              activeColor: Colors.green,
              checkColor: Colors.red,
              value: isbool,
              // focusColor: Colors.amber,
              onChanged: (value) {
                isbool = value!;
                setState(() {});
              }),
          CheckboxListTile(
              title: Text("remember me"),
              subtitle: Text("click to enable properties"),
              controlAffinity: ListTileControlAffinity.leading,
              value: isbool,
              onChanged: (value) {
                isbool = value!;
                setState(() {});
              }),
          Expanded(
            flex: 5,
            child: ListView.builder(
                itemCount: listData.length,
                itemBuilder: (context, index) {
                  return RadioListTile(
                      title: Text("${listData[index]}"),
                      value: listData[index],
                      groupValue: selectRadio,
                      onChanged: (value) {
                        selectRadio = value!;
                        setState(() {});
                      });
                }),
          ),
          SwitchListTile(
              title: Text("Theme mode"),
              activeColor: Colors.amber,
              inactiveThumbColor: Colors.black,
              thumbIcon: MaterialStateProperty.resolveWith((states) {
                if (states.contains(MaterialState.selected)) {
                  return Icon(Icons.sunny);
                }
                return Icon(Icons.nightlight);
              }),
              value: isLightMode,
              onChanged: (value) {
                isLightMode = value!;
                setState(() {});
              })
        ],
      ),
    );
  }
}
