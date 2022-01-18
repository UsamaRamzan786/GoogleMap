import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:get/get.dart';
import 'package:google_map/main.dart';

class Filter extends StatefulWidget {
  const Filter({Key? key}) : super(key: key);

  @override
  _FilterState createState() => _FilterState();
}

String? dayDropdown;

class _FilterState extends State<Filter> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.all(5.0),
            child: Row(
              children: const [
                Icon(Icons.filter_alt),
                SizedBox(width: 5),
                Text(
                  'Filters',
                  style: TextStyle(fontSize: 25),
                )
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.all(15),
            child: ListView(
              children: [
                GFAccordion(
                  title: 'Availability',
                  contentChild: Container(
                    margin: EdgeInsets.all(5),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Monday'),
                            Checkbox(
                              value: true,
                              onChanged: (v) {},
                            ),
                          ],
                        ),
                        Divider(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Tuesday'),
                            Checkbox(
                              value: true,
                              onChanged: (v) {},
                            ),
                          ],
                        ),
                        Divider(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Wednesday'),
                            Checkbox(
                              value: true,
                              onChanged: (v) {},
                            ),
                          ],
                        ),
                        Divider(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Thursday'),
                            Checkbox(
                              value: true,
                              onChanged: (v) {},
                            ),
                          ],
                        ),
                        Divider(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Friday'),
                            Checkbox(
                              value: true,
                              onChanged: (v) {},
                            ),
                          ],
                        ),
                        Divider(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Saturday'),
                            Checkbox(
                              value: true,
                              onChanged: (v) {},
                            ),
                          ],
                        ),
                        Divider(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Sunday'),
                            Checkbox(
                              value: true,
                              onChanged: (v) {},
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            GFButton(
                              color: Colors.grey,
                              onPressed: () {
                                Get.off(MyHomePage());
                              },
                              text: 'Morning',
                              textStyle: TextStyle(fontSize: 12),
                            ),
                            GFButton(
                              color: Colors.grey,
                              onPressed: () {},
                              text: 'Afternoon',
                              textStyle: TextStyle(fontSize: 12),
                            ),
                            GFButton(
                              color: Colors.grey,
                              onPressed: () {},
                              text: 'Evening',
                              textStyle: TextStyle(fontSize: 12),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: const [
                            Text(
                              'Until 12',
                              style: TextStyle(fontSize: 12),
                            ),
                            Text(
                              'Until 5pm',
                              style: TextStyle(fontSize: 12),
                            ),
                            Text(
                              '9pm+',
                              style: TextStyle(fontSize: 12),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                GFAccordion(
                  title: 'Fee',
                  contentChild: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('150-350rs'),
                          Checkbox(
                            value: true,
                            onChanged: (v) {},
                          ),
                        ],
                      ),
                      Divider(
                        color: Colors.grey,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('350-750rs'),
                          Checkbox(
                            value: true,
                            onChanged: (v) {},
                          ),
                        ],
                      ),
                      Divider(
                        color: Colors.grey,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('750-1000rs'),
                          Checkbox(
                            value: true,
                            onChanged: (v) {},
                          ),
                        ],
                      ),
                      Divider(
                        color: Colors.grey,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('1000-1500rs'),
                          Checkbox(
                            value: true,
                            onChanged: (v) {},
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                GFAccordion(
                  title: 'Gender',
                  contentChild: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Male'),
                          Checkbox(value: true, onChanged: (v) {})
                        ],
                      ),
                      Divider(
                        color: Colors.grey,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Female'),
                          Checkbox(value: true, onChanged: (v) {})
                        ],
                      ),
                      Divider(
                        color: Colors.grey,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Other'),
                          Checkbox(value: true, onChanged: (v) {})
                        ],
                      ),
                      Divider(
                        color: Colors.grey,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(60, 20, 60, 0),
                  child: GFButton(
                    color: Colors.amber.shade400,
                    onPressed: () {},
                    child: const Text(
                      'Clear Filter',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
