
class App.Views.ItemsCollectionView extends Backbone.View

  id: 'items'
  
  template: JST["templates/items"]
  
  addOne: (itemModel) ->
    itemView = new App.Views.ItemView
      model: itemModel
    @$el.append itemView.render().el
  
  addAll: ->
    @collection.foreach(@addOne, @)
  
  render: ->
    @addAll
    @
    
    
  
  
      



