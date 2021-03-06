@getPayableAmount = (expense = {}, income = {}) ->
  if expense.amountRemaining and income.amountRemaining
    # Logic is simple here: we want the smallest number. This should work
    # even if they are the same. e.g. if 500 in income and 1000 in expense,
    # it will choose 500. The other way around and it will still choose
    # 500 (and not overallocate the income)
    Math.min expense.amountRemaining, income.amountRemaining

###
  Gets Payments where:

  - The Payment is an Envelope Payment (was created automatically by the system)
  - The income is transferred
  - The envelope isn't already paid
###
@getPayableEnvelopePayments = (envelopeId) ->
  # Do some validation so we don't accidentally mark enveloeps we don't want to mark as paid as paid
  if (envelopeId isnt undefined and _.isString(envelopeId))
    return Payments.find({
      "systemMeta.fromRecordId": envelopeId
      paid: { $ne: true }
      _incomeTransferred: true
    }).fetch();
  {}
