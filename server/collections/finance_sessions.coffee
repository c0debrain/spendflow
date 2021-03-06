FinanceSessions.allow allowViewOwn
FinanceSessions.deny denyIfInvalidProfile

Meteor.publish 'spendflowSessions', (profileId = -1) ->
  financeSessions = FinanceSessions.find {
    owner: @userId
    profileId: profileId
  }
  financeSessions

Meteor.publish 'spendflowSession', (sessionId, profileId = -1) ->
  financeSession = FinanceSessions.find {
    owner: @userId
    profileId: profileId
    _id: sessionId
  }
  financeSession
