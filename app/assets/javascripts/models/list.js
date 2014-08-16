HoneyDo.Models.List = Backbone.Model.extend({
  urlRoot: "/api/lists",

  cards: function() {
    this._cards = this._cards || new HoneyDo.Collections.Cards([], { obj: this });
    return this._cards;
  },

  parse: function(response) {
    if (response.cards) {
      this.cards().set(response.cards, { parse: true });
    }

    return response;
  }
});
