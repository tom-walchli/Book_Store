// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.


//$('#prodSubmit').on('click', addProduct);


function addProduct(e){
	// ajax stuff....
	data = {
		name 		: $('#prodName').val(),
		description	: $('#prodDesc').val(),
		price 		: $('#prodPrice').val()
	}
	request = $.post('/new', data);
	request.done(responseHandler);
	request.error(errorHandler)
}

function errorHandler(){

}

function responseHandler(data)
{

	alert(data);
	newProd =  "<li><a href='/show_one/"+{data.id}+"'>"+data.name+"</a>\ 
					Price: " + data.price + "Reviews: " + data.reviews.count + "av. rating: " + data.avg_rating + "data.description}\ 
				</li>";

	$('#prodList').prepend(newProd);

}