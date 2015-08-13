$(document).on('ready', function(){

	$('#acct-edit-btn').on('click', function(e){
		e.preventDefault();
		$.ajax(this.pathname).done(function(sData){
			$('#acct-options').empty().append(sData)
		})
	})

  jQuery(function($){
     $("#phone-number-edit").mask("(999) 999-9999");
  });

  // $('body').on('submit', '#acct-edit-form', function(e){
  // 	e.preventDefault();
  // 	var urlVal = $('#acct-edit-form').attr('action');
  // 	var typeVal = 'PUT';
  // 	var dataVal = $('#acct-edit-form').serialize();

  // 	$.ajax({
  // 		url: urlVal,
  // 		type: typeVal,
  // 		data: dataVal
  // 	}).done(function(sData){
  // 		console.log(sData);
  // 		console.log("yay");
  // 		$('#user-edit').replaceWith(sData)
  // 	}).fail(function(sData){
  // 		console.log(sData);
  // 		console.log("nay");
  // 	});
  // })

})