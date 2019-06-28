class FieldReflectionData {
  int _classId;

  int _modifiers;

  int _fieldNameId;

  int _fieldTypeId;

  int _fieldAccessorId;

  int _isEnumConstant;

  int _isSynthetic;

  FieldReflectionData(
    this._classId,
    this._modifiers,
    this._fieldNameId,
    this._fieldTypeId,
    this._fieldAccessorId,
    this._isEnumConstant,
    this._isSynthetic,
  );

  List toJson() => {
        0: _classId,
        1: _modifiers,
        2: _fieldNameId,
        3: _fieldTypeId,
        4: _fieldAccessorId,
        5: _isEnumConstant,
        6: _isSynthetic,
      }.values.toList();
}
