# TODO: Implement envelopeIdsInUse
@getActiveEnvelopes = (userId, parentContext, envelopeIdsInUse) ->
  if not userId then userId = getCurrentUserId(parentContext)

  data = Envelopes.find({
    owner: userId
    $or: [
      { active: true }
      _id: { $in: envelopeIdsInUse }
    ]
  }).fetch()

  # TODO: Make envelopeIdsInUse work

  data
