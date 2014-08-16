HoneyDo.Collections.Boards = Backbone.Collection.extend({
	url: "api/boards",
	model: HoneyDo.Models.Board,
	parse: function(response) {
      return response.boards;
	},

	getOrFetch: function(id) {
		var board = this.get(id);
		var boardsCollection = this;

		if (board) {
	      board.fetch();
		} else {
			board = new HoneyDo.Models.Board({
				id: id
			});
			board.fetch({
				success: function() {
					boardsCollection.add(board);
				}
			});
		}
		return board;
	}
});

HoneyDo.Collections.boards = new HoneyDo.Collections.Boards();
