import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart';
import 'package:web3dart/web3dart.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FirstBlockChainApp(),
    );
  }
}

class FirstBlockChainApp extends StatefulWidget {
  const FirstBlockChainApp({Key? key}) : super(key: key);
  @override
  _FirstBlockChainAppState createState() => _FirstBlockChainAppState();
}

class _FirstBlockChainAppState extends State<FirstBlockChainApp> {
  late Client httpClient;
  late Web3Client ethClient;
  bool data = false;

  final myAddress = "0x4cb9210aEC4aDd1BDFbda9dCdE92807b6Cb470c3";
  late String myData;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    httpClient = Client();
    ethClient = Web3Client(
        "https://rinkeby.infura.io/v3/5de35b6fc7f84e12b22468815b4bf1e1,httpClient",
        httpClient);
    getBalance(myAddress);
  }

  Future<DeployedContract> loadContract() async {
    String abi = await rootBundle.loadString("assets/abi.json");
    final contAddress = "0xDe76Cf7626d59C2fff121Cabaf0bC8E9b0D2Bf06";

    final contract = DeployedContract(ContractAbi.fromJson(abi, "Contract"),
        EthereumAddress.fromHex(contAddress));

    return contract;
  }

  Future<List<dynamic>> query(String functionName, List<dynamic> args) async {
    final contract = await loadContract();
    final ethFunction = contract.function(functionName);
    final result = await ethClient.call(
        contract: contract, function: ethFunction, params: args);
    return result;
  }

  Future<void> getBalance(String myAddress) async {
    EthereumAddress ethAddress = EthereumAddress.fromHex(myAddress);
    List<dynamic> result = await query("getBalance", []);
    myData = result.toString();
    data = true;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("First Blockchain App"),
      ),
      backgroundColor: Colors.grey[900],
      body: Center(
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(90.0),
              child: Container(
                child: loadData(),
                width: 400,
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white.withOpacity(0.3),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                FloatingActionButton(
                  onPressed: () {},
                  hoverColor: Colors.blue,
                  hoverElevation: 10,
                  backgroundColor: Colors.black,
                  child: Icon(Icons.refresh_rounded),
                ),
                FloatingActionButton(
                  onPressed: () {},
                  hoverColor: Colors.green,
                  hoverElevation: 10,
                  backgroundColor: Colors.black,
                  child: Icon(Icons.call_made_outlined),
                ),
                FloatingActionButton(
                  hoverColor: Colors.red,
                  onPressed: () {},
                  hoverElevation: 10,
                  backgroundColor: Colors.black,
                  child: Icon(Icons.call_received_outlined),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget loadData() {
    if (data == false)
      return CircularProgressIndicator();
    else
      return Text(
        "\$1",
          style: TextStyle(
            fontSize: 50,
            color: Colors.black,
          ),
      );
  }
}
