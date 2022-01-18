import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:geolocator/geolocator.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:google_map/filter.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      // theme: ThemeData.dark(),
      //darkTheme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  LatLng _initialcameraposition = LatLng(32.2035918034, 74.193826917);
  GoogleMapController? _controller;
  //final Location _location = Location();
  final Set<Marker> markers = new Set();
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(
          padding: const EdgeInsets.all(8.0),
          child: GFToggle(
            enabledThumbColor: Colors.amber,
            disabledThumbColor: Colors.grey,
            onChanged: (val) => {
              if (val == true)
                {
                  Get.changeTheme(ThemeData.dark()),
                },
              if (val == false) {Get.changeTheme(ThemeData.light())}
            },
            value: true,
          ),
        ),
      ),
      endDrawer: Drawer(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(15, 20, 0, 15),
              child: Row(
                children: const [
                  Icon(
                    Icons.filter_alt,
                    size: 30,
                  ),
                  SizedBox(width: 5),
                  Text(
                    'Filters',
                    style: TextStyle(fontSize: 30),
                  )
                ],
              ),
            ),
            Container(
              //  margin: const EdgeInsets.all(15),
              child: Expanded(
                child: ListView(
                  // shrinkWrap: true,
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
                      title: 'Doctor Speciality',
                      contentChild: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Anatomical Pathology'),
                              Checkbox(value: true, onChanged: (v) {}),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Dermatology'),
                              Checkbox(value: true, onChanged: (v) {}),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Cardiology'),
                              Checkbox(value: true, onChanged: (v) {}),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Anesthesiology'),
                              Checkbox(value: true, onChanged: (v) {}),
                            ],
                          ),
                        ],
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
            ),
          ],
        ),
      ),
      body: Container(
        // color: Colors.black,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            Positioned(
              child: GoogleMap(
                //Map widget from google_maps_flutter package
                zoomGesturesEnabled: true, //enable Zoom in, out on map
                initialCameraPosition: CameraPosition(
                  //innital position in map
                  target: _initialcameraposition, //initial position
                  zoom: 15.0, //initial zoom level
                ),
                markers: getmarkers(), //markers to show on map
                mapType: MapType.normal, //map type
                onMapCreated: (controller) {
                  //method called when map is created
                  setState(() {
                    _controller = controller;
                  });
                },
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      custom(),
                      custom(),
                      custom(),
                      custom(),
                      custom(),
                      custom(),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Set<Marker> getmarkers() {
    //markers to place on map
    setState(() {
      markers.add(Marker(
        //add first marker
        markerId: MarkerId(_initialcameraposition.toString()),
        position: _initialcameraposition, //position of marker
        infoWindow: const InfoWindow(
          //popup info
          title: 'Apex Collage',
          snippet: 'Gujranwala',
        ),
        icon: BitmapDescriptor.defaultMarker, //Icon for Marker
      ));

      markers.add(Marker(
        //add second marker
        markerId: MarkerId(_initialcameraposition.toString()),
        position: const LatLng(32.2049, 74.1925), //position of marker
        infoWindow: const InfoWindow(
          //popup info
          title: 'Gift University ',
          snippet: 'Gujranwala',
        ),
        icon: BitmapDescriptor.defaultMarker, //Icon for Marker
      ));

      markers.add(Marker(
        //add thrid marker
        markerId: MarkerId(_initialcameraposition.toString()),
        position: const LatLng(32.2022, 74.1880), //position of marker
        infoWindow: const InfoWindow(
          //popup info
          title: 'BISE Gujranwala',
          snippet: 'Gujranwala',
        ),
        icon: BitmapDescriptor.defaultMarker, //Icon for Marker
      ));

      markers.add(Marker(
        //add fourth marker
        markerId: MarkerId(_initialcameraposition.toString()),
        position: const LatLng(32.2013, 74.2011), //position of marker
        infoWindow: const InfoWindow(
          //popup info
          title: 'Punbaj Collage ',
          snippet: 'Gujranwala',
        ),
        icon: BitmapDescriptor.defaultMarker, //Icon for Marker
      ));
      markers.add(Marker(
        //add fifth marker
        markerId: MarkerId(_initialcameraposition.toString()),
        position: const LatLng(32.2041, 74.1931), //position of marker
        infoWindow: const InfoWindow(
          //popup info
          title: 'Lahore Grammer Scholl',
          snippet: 'Gujranwala',
        ),
        icon: BitmapDescriptor.defaultMarker, //Icon for Marker
      ));

      markers.add(Marker(
        //add sixth marker
        markerId: MarkerId(_initialcameraposition.toString()),
        position: LatLng(32.2040, 74.1935), //position of marker
        infoWindow: const InfoWindow(
          //popup info
          title: 'The City Scholl',
          snippet: 'Gujranwala',
        ),
        icon: BitmapDescriptor.defaultMarker, //Icon for Marker
      ));
    });

    return markers;
  }
}

Widget custom() {
  var likes = 0.0.obs;
  return Container(
    //color: Colors.black,
    child: Stack(
      children: [
        Container(
          height: 310,
          width: 400,
          //decoration: BoxDecoration(),
          child: GlassmorphicFlexContainer(
            borderRadius: 20,
            blur: 30,
            padding: EdgeInsets.all(40),
            alignment: Alignment.bottomCenter,
            border: 2,
            linearGradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.white.withOpacity(0.5),
                Colors.white10.withOpacity(0.5),
              ],
              stops: const [
                0.1,
                1,
              ],
            ),
            borderGradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.white24.withOpacity(0.5),
                Colors.white12.withOpacity(0.5),
              ],
            ),
            child: Container(
              padding: const EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                      //height: 15,
                      ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        '92',
                        //style: TextStyle(color: Colors.white),
                      ),
                      Container(
                        child: Row(
                          children: const [
                            Text(
                              '~3.2km~',
                              style: TextStyle(color: Colors.purple),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Icon(
                              Icons.bookmark,
                              color: Colors.red,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'DR.Umar ',
                    // style: TextStyle(color: Colors.white),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      const Text(
                        'Hart Spaclist | ',
                        //   style: TextStyle(color: Colors.white),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Obx(() => Text(
                            "$likes",
                            style: TextStyle(color: Colors.blue),
                          )),
                      IconButton(
                        onPressed: () {
                          likes = likes + 1 as RxDouble;
                        },
                        icon: const Icon(
                          Icons.thumb_up,
                          color: Colors.blue,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'Gift University',
                    // style: TextStyle(color: Colors.white),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Divider(
                    color: Colors.grey,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Icon(
                        Icons.copy,
                        //   color: Colors.white,
                        size: 30,
                      ),
                      const Icon(
                        Icons.video_call,
                        // color: Colors.white,
                        size: 30,
                      ),
                      const Icon(
                        Icons.call,
                        // color: Colors.white,
                        size: 30,
                      ),
                      Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.green),
                          borderRadius: BorderRadius.circular(
                            20,
                          ),
                        ),
                        child: const Text(
                          '\$ 75',
                          style: TextStyle(color: Colors.green),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        const Positioned(
          left: 70,
          top: 0,
          child: CircleAvatar(
            radius: 35,
            backgroundImage: NetworkImage(
                'https://img.freepik.com/free-vector/doctor-character-background_1270-84.jpg?size=338&ext=jpg'),
          ),
        ),
      ],
    ),
  );
}
