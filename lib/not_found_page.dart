import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:peli/ui/components/btn_ui.dart';
import 'package:provider/provider.dart';

class NotFoundPage extends StatefulWidget {
  NotFoundPage({Key? key}) : super(key: key);

  @override
  _NotFoundPageState createState() => _NotFoundPageState();
}

class _NotFoundPageState extends State<NotFoundPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text("Not Found"),
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Sorry, We couldn't found your page"),
              SizedBox(height: 8.0),
              BtnUI(
                height: 60,
                text: "retry",
                ontap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ConnectivityChangeNotifier extends ChangeNotifier {
  ConnectivityChangeNotifier() {
    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      resultHandler(result);
    });
  }
  ConnectivityResult _connectivityResult = ConnectivityResult.none;
  String _svgUrl = 'assets/svg/e_imzo.svg';
  String _pageText =
      'Currently connected to no network. Please connect to a wifi network!';

  ConnectivityResult get connectivity => _connectivityResult;
  String get svgUrl => _svgUrl;
  String get pageText => _pageText;

  void resultHandler(ConnectivityResult result) {
    _connectivityResult = result;
    if (result == ConnectivityResult.none) {
      _svgUrl = 'assets/svg/e_imzo.svg';
      _pageText =
      'Currently connected to no network. Please connect to a wifi network!';
    } else if (result == ConnectivityResult.mobile) {
      _svgUrl = 'assets/svg/e_imzo.svg';
      _pageText =
      'Currently connected to a celluar network. Please connect to a wifi network!';
    } else if (result == ConnectivityResult.wifi) {
      _svgUrl = 'assets/svg/e_imzo.svg';
      _pageText = 'Connected to a wifi network!';
    }
    notifyListeners();
  }

  void initialLoad() async {
    ConnectivityResult connectivityResult =
    await (Connectivity().checkConnectivity());
    resultHandler(connectivityResult);
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key, this.title}) : super(key: key);
  final String? title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            brightness: Brightness.light),
        body: Center(
          child: Consumer<ConnectivityChangeNotifier>(builder:
              (BuildContext context,
              ConnectivityChangeNotifier connectivityChangeNotifier,
              Widget? child) {
            return Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Flexible(
                    child: SvgPicture.asset(connectivityChangeNotifier.svgUrl,
                        fit: BoxFit.contain)),
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(30.0, 20, 30, 100),
                    child: Text(
                      connectivityChangeNotifier.pageText,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                if (connectivityChangeNotifier.connectivity !=
                    ConnectivityResult.wifi)
                  Flexible(
                    child: RaisedButton(
                      child: Text('Open Settings'),
                      onPressed: () {}
                    ),
                  )
              ],
            );
          }),
        ));
  }
}

