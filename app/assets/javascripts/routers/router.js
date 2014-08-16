HoneyDo.Routers.router = Backbone.Router.extend({

  routes: {
    "" : "boardsIndex",
    "boards/new" : "createBoard",
    "boards/:id" : "showBoard",
    "boards/:id/edit" : "editBoard",
    "boards/:id/lists" : "listsIndex",
    "boards/:id/lists/new" : "createList"
  },

  boardsIndex: function() {
    HoneyDo.Collections.boards.fetch();

    var boardsIndexView = new HoneyDo.Views.BoardsIndex({
      collection: HoneyDo.Collections.boards
    });

    this._swapView(boardsIndexView);
  },

  createBoard: function() {
    var boardNewView = new HoneyDo.Views.BoardNew();
    this._swapView(boardsNewView);
  },

  showBoard: function(id) {
    var board = HoneyDo.Collections.boards.getOrFetch(id);

    var boardShowView = new HoneyDo.Views.BoardShow({
      model: board
    });

    this._swapView(boardShowView);
  },

  editBoard: function(id) {
    var board = HoneyDo.Collections.boards.getOrFetch(id);

    var boardEditView = new HoneyDo.Views.BoardEdit({
      model: board
    });

    this._swapView(boardEditView);
  },

  _swapView: function(newView) {
    this._currentView && this._currentView.remove();
    this._currentView = newView;
    $("#main").html(newView.render().$el);
  }

});
