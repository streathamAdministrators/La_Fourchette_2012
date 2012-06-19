
class App.Views.ItemsCollectionView extends Backbone.View

  id: 'items'
  current_product_type_id: 0
  
  initialize: ->
    @collection.on('add', @addItem, @);
    @collection.on('reset', @render, @);
  
  
  addItem: (itemModel) ->
    itemView = new App.Views.ItemView
      model: itemModel
      
    id = itemModel.get('product_type').id
    
          
    if @current_product_type_id isnt id
       name = itemModel.get('product_type').name
       @$el.append "<div id='product_type-#{id}' class='product_types'><div id='title-#{id}'>#{name}</div></div>"
       @current_product_type_id = id
      
    @$el.find('#product_type-'+id).append itemView.render().el
    
  render: ->
    @collection.forEach(@addItem, @)
    @
  
  
      



