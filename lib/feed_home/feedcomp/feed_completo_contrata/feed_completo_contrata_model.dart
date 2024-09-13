import '/backend/backend.dart';
import '/feed_home/feedcomp/card_feed_big/card_feed_big_widget.dart';
import '/feed_home/feedcomp/card_feed_smallist/card_feed_smallist_widget.dart';
import '/feed_home/feedcomp/header_title_feed/header_title_feed_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/me_contrata/componentes/mecontrata_feed/mecontrata_feed_widget.dart';
import 'feed_completo_contrata_widget.dart' show FeedCompletoContrataWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class FeedCompletoContrataModel
    extends FlutterFlowModel<FeedCompletoContrataWidget> {
  ///  Local state fields for this component.

  DocumentReference? refVagas;

  ///  State fields for stateful widgets in this component.

  // Model for headerTitleFeed component.
  late HeaderTitleFeedModel headerTitleFeedModel;
  // Model for cardFeedBig component.
  late CardFeedBigModel cardFeedBigModel;

  @override
  void initState(BuildContext context) {
    headerTitleFeedModel = createModel(context, () => HeaderTitleFeedModel());
    cardFeedBigModel = createModel(context, () => CardFeedBigModel());
  }

  @override
  void dispose() {
    headerTitleFeedModel.dispose();
    cardFeedBigModel.dispose();
  }
}
