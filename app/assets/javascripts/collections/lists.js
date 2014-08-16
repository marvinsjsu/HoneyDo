HoneyDo.Collections.Lists = Backbone.Collection.extend({
  url: "api/lists",
  model: HoneyDo.Models.List,
  parse: function(response) {
      return response.lists;
  },

  getOrFetch: function(id) {
    var list = this.get(id);
    var listsCollection = this;

    if (list) {
        list.fetch();
    } else {
      list = new HoneyDo.Models.List({
        id: id
      });
      list.fetch({
        success: function() {
          listsCollection.add(list);
        }
      });
    }
    return list;
  }
});

HoneyDo.Collections.lists = new HoneyDo.Collections.List();
