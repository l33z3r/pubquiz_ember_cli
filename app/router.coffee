`import Ember from 'ember'`

Router = Ember.Router.extend
  location: PubquizENV.locationType

Router.map ->
  @route 'landing'
  @route 'join_quiz_options'
  @route 'quiz_id_input'

  @resource 'teams', { path: '/teams_for_event/:quiz_event_id' }

  @resource 'quiz_events', { path: 'quiz_events/:x/:y' }

  @resource 'quiz_event', { path: '/quiz_event/:quiz_event_id' }, ->
    @route 'landing'

    @resource 'quiz_rounds', ->
      @resource 'quiz_round', { path: ':quiz_round_id' }, ->
        @resource 'questions', ->
          @resource 'question', { path: ':question_id' }, ->
            @resource 'answers'

  @route 'application'

`export default Router`
