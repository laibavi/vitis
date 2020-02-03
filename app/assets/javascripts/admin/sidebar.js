$(document).ready(function(){

    $('.treeview').on('click', function(){
        $(this).parent().find('.treeview.active').removeClass('active');
        $(this).addClass('active');
    });
    function sidebarSlidedown(target){
        target.find('.treeview-menu').slideDown('slow');
        target.find('.fa-angle-left').animate({rotaion : "-90"},
            {
                duration: "slow",
                step: function(now){
                    $(this).css('transform','rotate('+now+'deg)')
                }
            }
        )
    }
    function sidebarSlideUp(target){
        target.find('.treeview-menu').slideUp('slow');
        target.find('.fa-angle-left').animate({rotaion : "0"},
            {
                duration: "slow",
                step: function(now){
                    $(this).css('transform','rotate('+now+'deg)')
                }
            }
        )
    }

    $('.treeview > a').on('click', function(){
        var li_treeview = $(this).parent();
        var readyTreeviewOpen = li_treeview.parent().find('.treeview.menu-open');
        if(!li_treeview.is(readyTreeviewOpen)){
            readyTreeviewOpen.removeClass('menu-open');
            sidebarSlideUp(readyTreeviewOpen);
        }
        li_treeview.toggleClass('menu-open');
        if(li_treeview.hasClass('menu-open')){
            sidebarSlidedown(li_treeview);
        }
        else{
            sidebarSlideUp(li_treeview);
        }
    })
})
