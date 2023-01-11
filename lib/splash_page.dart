import 'package:truth_teller/home_page.dart';

import 'lib_exp.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    doAfterBuild(callback: () => context.push(const HomePage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
