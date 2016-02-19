/*global $, _, Backbone */
var app = app || {};
app.view = app.view || {};
app.router = app.router || {};
app.ajaxURL = "Documents/Head/mywebroot/";


//Define the main view here
app.PageView = Backbone.View.extend({
    
    el: null,
    
    initialize: function(options){
        
        this.el = options.el;
        this.$el.html("Hello world");
        
    },
    
    loadPage: function(url){
        var template;
        console.log("getting template")
        $.get(url, function(data){
            console.log(data);
            template = _.template(data, {});
            this.$el.html(template)
        }.bind(this), 'html')
        
        
    }
    
})


app.MainRouter = Backbone.Router.extend({
  
  routes: {
      ':one': 'one',
      ':one/:two': 'two',
      '': 'default',
      
      
      
  },
  one: function(first){
      console.log('Calling loadPage')
    app.View.loadPage(first + '.html');  
  }, 
  two: function(first, second){
    console.log('Calling loadPage')
    app.View.loadPage(first + '/' + second + '.html');   
  },
  default: function(pathName){
      
      alert("default");
  }
    
    
})

$(function(){
    
   
    app.View = new app.PageView({
        el: "#pageContent"
    })
    app.Router = new app.MainRouter();
    Backbone.history.start({
        });
    
})