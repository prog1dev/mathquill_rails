@FormulaFormatter = class
  run: ->
    MQ = MathQuill.getInterface(2);
    $('.with_formula').each (index, elem) ->
      formula_start_pos = elem.text.trim().indexOf('$');
      formula_end_pos   = elem.text.trim().indexOf('$', formula_start_pos + 1);

      if formula_start_pos == -1 || formula_end_pos == -1
        return 'kek' # skip if no math formula pattern was found

      left_part  = elem.text.trim().substring(0, formula_start_pos);
      formula    = elem.text.trim().substring(formula_start_pos + 1, formula_end_pos);
      right_part = elem.text.trim().substring(formula_end_pos + 1, elem.text.trim().length);

      mathFieldSpan = $('<span>' + formula + '</span>');
      mathField = MQ.MathField(mathFieldSpan[0]);
      elem.text = left_part;
      mathFieldSpan.appendTo(elem);
      $('<span>' + right_part + '</span>').appendTo(elem);
