import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'mi_chat_text_model.dart';
export 'mi_chat_text_model.dart';

class MiChatTextWidget extends StatefulWidget {
  const MiChatTextWidget({super.key});

  @override
  State<MiChatTextWidget> createState() => _MiChatTextWidgetState();
}

class _MiChatTextWidgetState extends State<MiChatTextWidget> {
  late MiChatTextModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MiChatTextModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      'Mi Chat',
      style: FlutterFlowTheme.of(context).displaySmall.override(
            fontFamily: 'Inter',
            color: Colors.white,
          ),
    );
  }
}
