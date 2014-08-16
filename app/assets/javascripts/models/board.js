HoneyDo.Models.Board = Backbone.Model.extend({
	urlRoot: "api/boards",

  lists: function() {
    this._lists = this._lists || new HoneyDo.Collections.Lists([], { obj: this });
    return this._lists;
  },

  parse: function(response) {
    if (response.lists) {
      this.lists().set(response.lists, { parse: true });
    }

    return response;
  }
};
