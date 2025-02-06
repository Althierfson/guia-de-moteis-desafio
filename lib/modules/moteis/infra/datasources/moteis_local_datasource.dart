import 'package:guia_moteis_desafio/modules/moteis/infra/models/motel_model.dart';

abstract class MoteisLocalDatasource {
  Future<List<MotelModel>> fetchMoteis();
  Future<void> saveMoteis(List<MotelModel> moteis);
}
