HoneyDo.Models.Card = Backbone.Model.extend({
  urlRoot: "/api/cards",

  items: function(){
    this._items = this._items || HoneyDo.Collections.Items([], { obj: this });
    return this._items;
  },

  parse: function(response) {
    if (response.items) {
      this.items().set(response.items, { parse: true });
    }

    return response;
  }
});
