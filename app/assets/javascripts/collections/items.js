HoneyDo.Collections.Items = Backbone.Collection.extend({
  url: "api/items",
  model: HoneyDo.Models.Item,
  parse: function(response) {
      return response.items;
  },

  getOrFetch: function(id) {
    var item = this.get(id);
    var itemsCollection = this;

    if (item) {
        item.fetch();
    } else {
      item = new HoneyDo.Models.Item({
        id: id
      });
      item.fetch({
        success: function() {
          itemsCollection.add(item);
        }
      });
    }
    return item;
  }
});

HoneyDo.Collections.items = new HoneyDo.Collections.Items();
