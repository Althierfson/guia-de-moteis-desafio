import 'package:guia_moteis_desafio/modules/moteis/infra/models/motel_model.dart';

abstract class MoteisRemoteDatasource {
  Future<List<MotelModel>> fetchMoteis(int page);
}