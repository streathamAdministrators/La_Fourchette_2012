/**
 * @author damienh
 */
(function() {
  window.App.Models.itemModel = Backbone.Model.extend({
    url: function() {
      var base, _ref;
      base = 'documents';
      if (this.isNew()) {
        return base;
      } else {
        return base + ((_ref = base.charAt(base.length - 1) === '/') != null ? _ref : {
          '': '/'
        }) + this.id;
      }
    }
  });
}).call(this);