HoneyDo.Collections.Cards = Backbone.Collection.extend({
  url: "api/cards",
  model: HoneyDo.Models.Card,
  parse: function(response) {
      return response.cards;
  },

  getOrFetch: function(id) {
    var card = this.get(id);
    var cardsCollection = this;

    if (card) {
        card.fetch();
    } else {
      card = new HoneyDo.Models.card({
        id: id
      });
      card.fetch({
        success: function() {
          cardsCollection.add(card);
        }
      });
    }
    return card;
  }
});

HoneyDo.Collections.cards = new HoneyDo.Collections.Cards();
