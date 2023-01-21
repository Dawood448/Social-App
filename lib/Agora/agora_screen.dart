import 'package:flutter/material.dart';
import 'package:agora_uikit/agora_uikit.dart';
class AgoraScreen extends StatefulWidget {
  const AgoraScreen({Key? key}) : super(key: key);

  @override
  State<AgoraScreen> createState() => _AgoraScreenState();
}
class _AgoraScreenState extends State<AgoraScreen> {
  final AgoraClient client = AgoraClient(
    agoraConnectionData: AgoraConnectionData(
      appId: "847399c4f06d4619872f7e00ebbb9809",
      channelName: "test",
      username: "user",
    ),
  );

  @override
  void initState() {
    super.initState();
    initAgora();
  }

  void initAgora() async {
    await client.initialize();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Agora VideoUIKit'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Stack(
          children: [
            AgoraVideoViewer(
              client: client,
              layoutType: Layout.floating,
              enableHostControls: true, // Add this to enable host controls
            ),
            AgoraVideoButtons(
              client: client,
            ),
          ],
        ),
      ),
    );
  }
}
