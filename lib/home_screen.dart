import 'package:flutter/material.dart';
import 'package:ip_info_app/api_handler.dart';
import 'package:ip_info_app/api_result_model.dart';
import 'package:ip_info_app/display_ip_data.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _controller = TextEditingController();
  ApiResultModel? _model = ApiResultModel();
  bool showLoader = false;

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void getData({String ipAddress = ''}) async {
    await Future.delayed(Duration.zero);
    if (mounted) {
      setState(() {
        showLoader = true;
      });
    }
    var res = await ApiHandler.apiCall(ipAddress: ipAddress);
    if (res.isSuccess) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(ipAddress.isEmpty ? "Showing your IP info" : "Showing IP info of $ipAddress")));
      if (mounted) {
        setState(() {
          _model = res.data;
        });
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(res.message ?? "Something went wrong!!!")));
    }
    if (mounted) {
      setState(() {
        showLoader = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: const Color(0xffBBE1C3),
        // appBar: AppBar(
        //   title: const Text("IP Info"),
        // ),
        body: SafeArea(
          child: Stack(
            children: [
              Center(
                child: Container(
                  width: width * (width > 550 ? 0.6 : 0.8),
                  padding: const EdgeInsets.all(16.0),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        const Text(
                          "IP Info",
                          style: TextStyle(
                              fontSize: 25,
                              color: Colors.blueGrey,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                        if (_model != null) DisplayIpData(model: _model!),
                        Center(
                          child: ElevatedButton(
                              onPressed: getData,
                              child: const Text("Get your IP info")),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                keyboardType: TextInputType.number,
                                decoration: const InputDecoration(
                                  label: Text("Enter IP Address"),
                                  hintText: "Eg: 0.0.0.0",
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(5.0)),
                                      borderSide: BorderSide(width: 1)),
                                ),
                                controller: _controller,
                                onFieldSubmitted: (value) {
                                  getData(ipAddress: value);
                                },
                              ),
                            ),
                            IconButton(
                              color: Theme.of(context).primaryColor,
                              onPressed: () {
                                getData(ipAddress: _controller.text);
                              },
                              icon: const Icon(Icons.navigate_next_rounded),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
              if (showLoader)
                Container(
                  height: MediaQuery.of(context).size.height,
                    color: Colors.grey.withOpacity(0.5),
                    child: Center(
                        child: LoadingAnimationWidget.fourRotatingDots(
                            color: Theme.of(context).primaryColor,
                            size: 50)))
            ],
          ),
        ));
  }
}
