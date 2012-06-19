
class App.Views.ItemsCollectionMealView extends Backbone.View

  id: 'items'
  current_product_type_id:0
  
  initialize: (options) ->
    
    @id_meal = options.id_meal if @options
    
    @collection.on('add', @addItem, @);
    @collection.on('reset', @render, @);
  
  
  addItem: (itemModel) ->
    itemMealView = new App.Views.ItemMealView
      model: itemModel
      
    name = itemModel.get('product_type').name
    id = itemModel.get('product_type').id
    
    
          
    if @current_product_type_id isnt id
       @$el.append "<h4>#{name}</h4><ul id='meal_#{@id_meal}_pt_#{id}' class='item_for_meal_#{@id_meal}'></ul>"
       @current_product_type_id = id
      
    @$el.find('#meal_'+ @id_meal + '_pt_'+ id ).append itemMealView.render().el
    
  render: ->
    @collection.forEach(@addItem, @)
    @