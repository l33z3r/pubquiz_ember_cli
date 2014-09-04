import Ember from 'ember';

export default Ember.Route.extend({
    model: function(params) {
        return this.store.find('team', { quizz_event_id: params.quizz_event_id })
    }
});
