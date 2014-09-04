import Ember from 'ember';

export default Ember.Route.extend({
    model: function(params) {
        return this.store.find('quizz_event', params.quizz_event_id);
    }
});
