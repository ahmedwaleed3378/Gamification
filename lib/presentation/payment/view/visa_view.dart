import 'package:flutter/material.dart';
import 'package:gamification/app/di.dart';
import 'package:gamification/presentation/common/state_rendrer/state_renderer_impl.dart';
import 'package:gamification/presentation/payment/viewmodel/payment_methods_viewmodel.dart';
import 'package:webview_flutter/webview_flutter.dart';


class VisaView extends StatefulWidget {
  const VisaView({Key? key, required this.id}) : super(key: key);
  final int id;
  @override
  State<VisaView> createState() => _VisaViewState();
}

class _VisaViewState extends State<VisaView> {
  final PaymentMethodsViewModel _paymentViewModel = instance<PaymentMethodsViewModel>();
   final WebViewController  _webViewController = WebViewController()..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..setBackgroundColor(const Color(0x00000000))
    ..setNavigationDelegate(
      NavigationDelegate(
        onProgress: (int progress) {
          // Update loading bar.
        },
        onPageStarted: (String url) {},
        onPageFinished: (String url) {},
        onWebResourceError: (WebResourceError error) {},
        onNavigationRequest: (NavigationRequest request) {
          if (request.url.startsWith('https://www.youtube.com/')) {
            return NavigationDecision.prevent;
          }
          return NavigationDecision.navigate;
        },
      ),
    )
    ..loadRequest(Uri.parse('https://flutter.dev'));
  _bind() {
    _paymentViewModel.start();

  }

  @override
  void initState() {
    _bind();
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<FlowState>(
      stream: _paymentViewModel.outputState,
      builder: (context, snapshot) {
        return snapshot.data?.getScreenWidget(context, _getContentWidget(), () {
          _paymentViewModel.start();
        }) ??
            _getContentWidget();
      },
    );
  }

  Widget _getContentWidget() {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: WebViewWidget(
          controller: _webViewController,
        )
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
