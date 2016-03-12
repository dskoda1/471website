/*global $, _, Backbone */
var app = app || {};
app.view = app.view || {};
app.router = app.router || {};
app.ajaxURL = "Documents/Head/mywebroot/";
app.breadcrumbsMap = {
  requirements: 'Submission Requirements',
  expectation: 'Grading Policy',
  471: 'Home',
  '471HaskellIndex': 'Haskell'

}

//Define the main view here
app.PageView = Backbone.View.extend({

  el: null,

  initialize: function(options) {

    this.el = options.el;
    this.$el.html("Loading..");

  },
  loadPage: function(url) {
    var template;
    var that = this;
    var req = $.get(url, function(data) {
        //Load the requested page in
        //Need to mutate the data to have line breaks in it
        //Only if the file is not an html file
        if (url.indexOf('.html') == -1) {
          data = that.insertLineBreaks(data);
        }
        template = _.template(data, {});
        this.$el.html(template)
      }.bind(this))
      .fail(function() {
        //Load the 404 page
        $.get('404.html', function(data) {
          $('.breadcrumb').empty();
          template = _.template(data, {});
          that.$el.html(template)
        })
      })
      .always(function(){
        window.scrollTo(0, 0);
      })
  },
  renderBreadCrumbs: function(urlArr) {
    var bc = $('.breadcrumb')
    bc.empty();
    var crumbs = [];
    _.each(urlArr, function(page, i) {

      if (i == urlArr.length - 1 && page.indexOf('.html') > -1) {
        page = page.substr(0, page.length - 5);
      }
      if (app.breadcrumbsMap[page]) {
        page = app.breadcrumbsMap[page];
      }
      page = '<li>' + page + '</li>';
      bc.append(page);

    })
  },
  insertLineBreaks: function(data) {
    //Need to mutate the data to have line breaks in it
    //Only if the file is not an html file
    var page = '';
    _.each(data, function(char) {
      if (char == '\n') {
        char = '<br>';
      }
      page += char;
    })
    return page;
  }

})


app.MainRouter = Backbone.Router.extend({

  routes: {
    ':one': 'one',
    ':one/:two': 'two',
    ':one/:two/:three': 'three',
    ':one/:two/:three/:four': 'four',
    ':one/:two/:three/:four/:five': 'five',

    '': 'default',



  },
  one: function(first) {
    app.View.loadPage(first);
    app.View.renderBreadCrumbs([first]);
  },
  two: function(first, second) {
    app.View.loadPage(first + '/' + second);
    app.View.renderBreadCrumbs([first, second]);
  },
  three: function(first, second, third) {
    app.View.loadPage(first + '/' + second + '/' + third);
    app.View.renderBreadCrumbs([first, second, third]);
  },
  four: function(first, second, third, fourth) {
    app.View.loadPage(first + '/' + second + '/' + third + '/' + fourth);
    app.View.renderBreadCrumbs([first, second, third, fourth]);
  },
  five: function(first, second, third, fourth, fifth) {
    app.View.loadPage(first + '/' + second + '/' + third + '/' + fourth + '/' + fifth);
    app.View.renderBreadCrumbs([first, second, third, fourth, fifth]);
  },
  default: function(pathName) {
    app.View.loadPage('home.html');
    app.View.renderBreadCrumbs();
  },


})

$(function() {


  app.View = new app.PageView({
    el: "#pageContent"
  })
  app.Router = new app.MainRouter();
  Backbone.history.start({});

})
