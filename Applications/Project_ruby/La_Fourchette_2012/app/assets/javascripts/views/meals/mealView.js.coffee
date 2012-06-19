
class App.Views.MealView extends Backbone.View

  className: 'meal'
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
    
    @itemsCollectionView = new App.Views.ItemsCollectionView
      collection: @collectionItems
      
    @itemsCollectionView.render()
    
    $(@el).find('#meal-'+@model.id).append @itemsCollectionView.el