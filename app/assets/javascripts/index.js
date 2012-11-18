//= require bootstrap
$(function(){
    $(".available tr").hover(function(){
        this.className = 'available-hover';
    },function(){
        this.className = 'alert alert-success';
    })
    $(".occupied tr").hover(function(){
        this.className = 'occupied-hover';
    },function(){
        this.className = 'alert alert-error';
    })

    $('a').focus(function () {
        this.blur();
    });
})