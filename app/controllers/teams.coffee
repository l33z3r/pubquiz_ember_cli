`import Ember from 'ember'`

TeamsController = Ember.ArrayController.extend
  needs: ["current-user", 'quiz-event/landing']

  current_quiz_event: null
  created_team_name: null

  quizEventName: Ember.computed ->
    @get('current_quiz_event').get('name')
  .property('current_quiz_event')

  actions:
    team_selected: (team) ->
      @joinTeam(team)

    create_team: ->
      created_team_name = @get('created_team_name')

      if created_team_name.length is 0
        alert("Please enter a team name")
        return

      teamDetails =
        name: created_team_name
        quiz_event: @get('current_quiz_event')

      newTeam = @store.createRecord('team', teamDetails)

      newTeam.save().then =>
        @joinTeam(newTeam)

  joinTeam: (team) ->
    console.log("Joining team #{team.get('name')}")

    #create membership ajax goes here
    etmDetails =
      team: team
      user: @get('controllers.current-user.model')

    myEventTeamMember = @store.createRecord('event_team_member', etmDetails)
    myEventTeamMember.save()

    @get('controllers.quiz-event/landing').set('currentTeam', team)

    @transitionToRoute('quiz_event.landing', @get('current_quiz_event'))

`export default TeamsController`
