$(document).ready(function() {
  //preload some hidden images
  var img_array = ["loginbox_bg.png", "loginbox_input_bg.jpg", "close_btn.png"];
  
  $.each(img_array, function(i) {
    $("<img>").attr('src', 'images/'+img_array[i]).attr('src');
  });
  
  
  //if flash exist hide it after a delay
  if($('.flash').length) {
    setTimeout(function() {
      $('.flash').animate({ 'height' : '0', 'opacity' : '0.2' }, 300, function() {
        $(this).remove();
      });
    }, 2000);
  }
  
  
  //toggle login box
  var login_link = $('#login');
  var login_box = $('#loginbox');
  
  login_link.toggle(function() {
    login_box.fadeIn(80).find('input:first').focus();
  }, function() {
    login_box.fadeOut(80);
  });
  
  
  //bind click to loginbox close button
  login_box.children('a').click(function() {
    login_link.trigger('click');
    return false;
  });
  
  
  //all text and password fields: add focus class on focus, and remove on blur, select value
  $('input[type="text"], input[type="password"]').focus(function() {
    var el = $(this);
    
    el.select().addClass('focus');
    setTimeout(function() { el.select(); }, 100); //safari hack, select text after a short delay
  }).blur(function() {
    $(this).removeClass('focus');
  });
  
  
  //show link and lines of code on hovering a thumb
  $('#index li').hover(function() {
    $(this).children('div').children('p').fadeIn(120);
  }, function() {
    $(this).children('div').children('p').fadeOut(120);
  });
  
  
  //add focus to the parent div and search box itself
  $('#sidebar input').focus(function() {
    $(this).parent().parent().addClass('focus');
  }).blur(function() {
    $(this).parent().parent().removeClass('focus');
  });
  
  
  //get the max height for code box and set it
  var code_el = $('#code pre');
  var code_pos = code_el.offset();
  var win_height = $(window).height();
  var code_height = win_height - code_pos.top - 60;
  
  if(code_height >= 250) {
    code_el.height(code_height);
  } else {
    code_height = 250;
  }
  
  
  //positioning the code box absolute and expand/contract it if requested
  var contract_btn = $('#contract');
  var submit_btn = $('#submit');
  
  code_el.css({
    'position' : 'absolute',
    'top' : code_pos.top+'px',
    'left' : code_pos.left+'px'
  });
  
  $('#expand').click(function() {
    code_el.animate({
      'top' : '175px',
      'height' : (win_height-225)+'px',
      'width' : '920px'
    }, 220, function() {
      contract_btn.fadeIn('slow');
    });
    
    submit_btn.fadeOut(220);
    
    return false;
  });

  contract_btn.click(function() {
    $(this).fadeOut(220);
    
    code_el.animate({
      'top' : code_pos.top+'px',
      'height' : code_height+'px',
      'width' : '670px'
    }, 220);
    
    submit_btn.fadeIn(220);

    return false;
  }).css({
    'top' : '160px',
    'left' : (code_pos.left+940)+'px'
  });
  
  
  //resize/realign the code box and contract button if the browser is resized
  $(window).resize(function() {
    code_el.css('left', (($(window).width()-960)/2)+'px');
    contract_btn.css('left', (($(window).width()+920)/2)+'px')
  });
  
  
  //swap text with password fields, because you can't do .attr('type', 'password')
  function swapPasswordField(field) {
    $('#'+field+'_clear').focus(function() {
      $(this).hide();

      $('#'+field).show().focus().blur(function() {
        var fel = $(this);
        
        if(fel.val() == '') {
          fel.hide();
          $('#'+field+'_clear').show().removeClass('focus');
        }
      });

      setTimeout(function() { $('#'+field).select(); }, 100);
    });
  }
  
  swapPasswordField('password');
  swapPasswordField('password_confirmation');
  
  
  //focus the first visible input box
  $('#register input:first, #submit input:first').focus();
  
  
  //oh man, I suck at regex. workaround (note to self: buy a regex book)
  var textarea_text = 'Source Code'
  
  $('#submit_form').submit(function() {
    var textarea = $(this).find('textarea');
    
    if(textarea.val() == textarea_text) {
      textarea.val('');
      return false;
    }
    
    //remove all blank loi's
    $(this).find('ol li').each(function() {
      if($(this).children('input').val() == '') {
        $(this).remove();
      }
    });
  });
  
  
  //validation
  if($('#register_form, #submit_form').length) {
    $('#register_form, #submit_form').validationEngine();
  }
  
  
  //handle focus of the submit textarea
  $('#submit textarea').focus(function() {
    var textarea = $(this);

    if(textarea.val() == textarea_text) textarea.val('');
  }).blur(function() {
    var textarea = $(this);
    
    if(textarea.val().length == 0) {
      textarea.val(textarea_text).removeClass('set');
    } else if (textarea.val() !== textarea_text) {
      textarea.addClass('set');
    } else {
      textarea.removeClass('set');
    }
  });
  
  
  //handle categories in submit page
  $('#submit .sitecats li a').toggle(function() {
    $('#' + $(this).addClass('selected').attr('id') + '_checkbox').attr('checked', 'checked');
  }, function() {
    $('#' + $(this).removeClass('selected').attr('id') + '_checkbox').attr('checked', '');
  });
  
  
  //set same height for left and right form in submit
  var form_left = $('#submit .form_left');
  var form_right = $('#submit .form_right');
  
  function adjustFormHeight() {
    if(form_left.height() > form_right.height()) {
      form_right.css('min-height', form_left.height()+'px');
    } else {
      form_left.css('min-height', form_right.height()+'px');
    }
  }
  
  adjustFormHeight();
  
  
  //handle links of interest list
  var loi_list = $('#submit .form_right ol');
  var loi_template = loi_list.html();
  
  loi_list.children('li').remove();
  
  $('#add_loi').click(function() {
    loi_list.append(loi_template);
    
    loi_list.children('li:last').children('input').focus().parent().children('a').click(function() { //close btn for single loi
      $(this).parent().remove();
      return false;
    });
    
    adjustFormHeight();
    
    return false;
  });
  

  //watch close button on why register box
  $('#closewr').click(function() {
    $(this).parent().parent().slideUp(350);
    return false;
  });
  
  
  //subscribe link animation for blog
  $('#subscribe a').hover(function() {
    $(this).stop().animate({'left' : '-20px'}, 300);
  }, function() {
    $(this).stop().animate({'left' : '0'}, 300);
  });
  
  
  //ajaxifiy post category form
  $('#new_post_category').submit(function() {
    var new_post_form = $(this);
    var new_cat_input = $('#post_category_name');
    var new_cat_name = new_cat_input.val();
    
    if(new_cat_name) {
      $.ajax({
        type    : 'POST',
        url     : new_post_form.attr('action'),
        data    : new_post_form.serialize(),
        success : function() {
          var categories_list = $('#post_categories_input ol');

          categories_list.append('<li>'+categories_list.children('li:last').html()+'</li>');

          var new_li = categories_list.children('li:last');
          var new_label = new_li.children('label');
          var new_num = parseInt(new_li.children('label').attr('for').substr(18)) + 1;
          var new_id = 'post_category_ids_'+new_num;

          new_label.attr('for', new_id).children('input[type="checkbox"]').attr('id', new_id).val(new_num);
          new_label.html(new_label.html().substr(0, new_label.html().indexOf('"> ')+3) + ' ' + new_cat_name);
          
          new_cat_input.val('');
        }
      });
    }
    
    return false;
  });
});