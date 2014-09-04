`import Ember from 'ember'`

Router = Ember.Router.extend
  location: PubquizENV.locationType

Router.map ->
  @route 'landing'
  @route 'join_quizz_options'
  @route 'quizz_id_input'

  @resource 'teams', ->
    @route 'new'

  @resource 'quizz_events', ->
    @route 'nearby'
    @resource 'quizz_event', { path: ':quizz_event_id' }, ->
      @resource 'rounds', ->
        @resource 'round', { path: ':round_id' }, ->
          @resource 'questions', ->
            @resource 'question', { path: ':question_id' }, ->
              @resource 'answers'

`export default Router`
