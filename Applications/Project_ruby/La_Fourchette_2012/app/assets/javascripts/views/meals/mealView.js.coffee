
class App.Views.MealView extends Backbone.View

  className: 'meals'
  current_product_type_id: 0
  lazy: false
  
  template: JST["templates/meals/meal"]
  
  initialize: ->
    
    @lazy = @options.lazy if @options.lazy?
    @template = @options.template if @options.template?
      
      
  render: -> 
      $(@el).html @template @model.toJSON()
      
      if @lazy isnt true
        @renderItems(@model.get('items'));
      @
  
  renderItems: (collection)->
    @collectionItems = new App.Collections.Items()
    
    @collectionItems.reset(collection)
    
    @itemsCollectionMealView = new App.Views.ItemsCollectionMealView
      collection: @collectionItems
      id_meal: @model.get('id')
      
    @itemsCollectionMealView.render()
    
    $(@el).append @itemsCollectionMealView.el