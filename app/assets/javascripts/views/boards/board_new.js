HoneyDo.Views.BoardNew = Backbone.View.extend({
  template: JST["boards/new"],
  render: function() {
    var content = this.template({});

    this.$el.html(content);
    return this;
  },

  events: {
    //"submit form#add-review" : "addReview"
  },

  newBoard: function(event){
    event.preventDefault();
    var view = this;
    var params = $(event.currentTarget).serializeJSON();


  }

});
