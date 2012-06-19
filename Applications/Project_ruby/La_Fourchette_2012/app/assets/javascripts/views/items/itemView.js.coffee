
class App.Views.ItemView extends Backbone.View

  className: 'elements'
  
  template: JST["templates/items/item"]
  
  initialize: ->
    
    @template = @options.template if @options.template?
      
  render: -> 
      $(@el).html @template @model.toJSON()
      @
      