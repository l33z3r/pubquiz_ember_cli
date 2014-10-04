MockjaxInitializer =
  name: 'mockjax'

  # container, app is passed to initialize - add if you need them (you probably do)
  initialize: () ->
    # app.register 'route', 'foo', 'service:foo'

    #/api/quiz_events
    #
    #
    #

#    mockedQuizEvents = []
#
#    mockedQuizEvents.push
#      id: "q1"
#      name: "Quiz 1"
#      startTime: new Date()
#
#    mockedQuizEvents.push
#      id: "q2"
#      name: "Quiz 2"
#      startTime: new Date()
#
#    mockedQuizEvents.push
#      id: "q3"
#      name: "Quiz 3"
#      startTime: new Date()
#
#    $.mockjax
#      url: /\/api\/quiz_events$/,
#      response: ->
#        @responseText = JSON.stringify({"quiz_events" : mockedQuizEvents})


    #/api/quiz_event/:quiz_event_id
    #
    #
    #

#    $.mockjax
#      url: /\/api\/quiz_events\/(.*)$/,
#      urlParams: ['quiz_event_id']
#      response: (settings) ->
#        mockedQuizEvent =
#          id: "q#{settings.urlParams.quiz_event_id}"
#          name: "Quiz #{settings.urlParams.quiz_event_id}"
#          startTime: new Date()
#
#        @responseText = JSON.stringify({"quiz_event" : mockedQuizEvent})



    #/api/teams?quiz_event_id=q2
    #
    #
    #
    #
#    mockedTeams = []
#
#    mockedTeams.push
#      id: "t1"
#      name: "Team 1"
#
#    mockedTeams.push
#      id: "t2"
#      name: "Team 2"
#
#    mockedTeams.push
#      id: "t3"
#      name: "Team 3"
#
#    $.mockjax
#      url: /\/api\/teams$/,
#      response: ->
#        @responseText = JSON.stringify({"teams" : mockedTeams})

`export default MockjaxInitializer`
