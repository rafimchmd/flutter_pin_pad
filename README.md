## Example
```dart
class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        color: Colors.pink.shade400,
        child: FlutterPINPad(
          descriptionText: "Masukan PIN Kamu untuk verifikasi",
          deleteAction: () {},
          successAction: (pin) {

          },
          biometricEnabled: true,
          biometricAction: () {
            print("here");
          },
          errorTextVisible: true,
          errorText: "error",
          dotColor: Colors.grey.shade400,
          dotFillColor: Colors.white,
          textStyle: const TextStyle(color: Colors.white),
          iconColor: Colors.white,
        ),
      ),
    );
  }
}
```
