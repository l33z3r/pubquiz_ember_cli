MockjaxInitializer =
  name: 'mockjax'

  # container, app is passed to initialize - add if you need them (you probably do)
  initialize: () ->
    # app.register 'route', 'foo', 'service:foo'

    #/api/quizz_events
    #
    #
    #

    mockedQuizzEvents = []

    mockedQuizzEvents.push
      id: "q1"
      name: "Quizz 1"
      startTime: new Date()

    mockedQuizzEvents.push
      id: "q2"
      name: "Quizz 2"
      startTime: new Date()

    mockedQuizzEvents.push
      id: "q3"
      name: "Quizz 3"
      startTime: new Date()

    $.mockjax
      url: /\/api\/quizz_events$/,
      response: ->
        @responseText = JSON.stringify({"quizz_events" : mockedQuizzEvents})


    #/api/quizz_event/:quizz_event_id
    #
    #
    #

    $.mockjax
      url: /\/api\/quizz_events\/(.*)$/,
      urlParams: ['quizz_event_id']
      response: (settings) ->
        mockedQuizzEvent =
          id: "q#{settings.urlParams.quizz_event_id}"
          name: "Quizz #{settings.urlParams.quizz_event_id}"
          startTime: new Date()

        @responseText = JSON.stringify({"quizz_event" : mockedQuizzEvent})



    #/api/teams?quizz_event_id=q2
    #
    #
    #
    #
    mockedTeams = []

    mockedTeams.push
      id: "t1"
      name: "Team 1"

    mockedTeams.push
      id: "t2"
      name: "Team 2"

    mockedTeams.push
      id: "t3"
      name: "Team 3"

    $.mockjax
      url: /\/api\/teams$/,
      response: ->
        @responseText = JSON.stringify({"teams" : mockedTeams})

`export default MockjaxInitializer`
