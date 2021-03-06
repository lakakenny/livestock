import 'package:flutter/material.dart';
import 'package:livestock/src/ui/widgets/livestock_segmented_button.dart';
import 'package:livestock/src/ui/widgets/livestock_toggle_button.dart';
import 'package:livestock/src/utilities/enum_converters.dart';
import 'package:livestock_repository/livestock_repository.dart';

class DiagnosisSelectionWidget extends StatelessWidget {
  DiagnosisSelectionWidget({this.onChanged, this.selectedDiagnosis});

  final Map<int, Diagnoses> _diagnosisIndexMap = <int, Diagnoses>{
    0: Diagnoses.arthritis,
    1: Diagnoses.diarrhea,
    2: Diagnoses.lung,
    3: Diagnoses.orf,
  };

  final void Function(Diagnoses diagnosis) onChanged;
  final Diagnoses selectedDiagnosis;

  @override
  Widget build(BuildContext context) {
    return LivestockToggleButton(
      children: _diagnosisIndexMap.values
          .map((v) => LivestockSegmentedButton(
                borderColor: Color.fromRGBO(99, 99, 99, 1),
                backgroundColor: Colors.transparent,
                text: EnumConverters.toDiagnosesDisplayValue(v),
                textColor: Color.fromRGBO(99, 99, 99, 1),
              ))
          .toList(),
      onPressed: (index) => onChanged(_diagnosisIndexMap[index]),
      selectedChildren: _diagnosisIndexMap.values
          .map((v) => LivestockSegmentedButton(
                backgroundColor: Color.fromRGBO(99, 99, 99, 1),
                text: EnumConverters.toDiagnosesDisplayValue(v),
                textColor: Colors.white,
              ))
          .toList(),
      selectedIndex: _findKey(selectedDiagnosis),
    );
  }

  int _findKey(Diagnoses diagnosis) {
    return _diagnosisIndexMap.keys.firstWhere(
        (k) => _diagnosisIndexMap[k] == diagnosis,
        orElse: () => null);
  }
}
