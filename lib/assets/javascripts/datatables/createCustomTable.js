
/* Formatting function for row details - modify as you need */
function format ( d ) {
	console.log("This is what d is" + JSON.stringify(d));

	var viewString =  '<table cellpadding="5" cellspacing="0" border="0">';

	for (var key in d) {

		console.log("key in d: " + key)

		if (d.hasOwnProperty(key)) {
			if (key == "isActive" || key == "user_location" || key == "latitude" || key == "longitude" || key == "kidaluser"  || key == "image_thumb" || key == "submission_id") {
				console.log("key to continue: " + key);
				continue;
			}
			else if(key == 'image'){
				console.log("key to image: " + key);

				if(d[key] !== null){
					var imageString = '<tr>'+'<td> <b>' + key + '</b></td>';
					for(var i =0;i<d[key].length; i++){
						imageString +=   '<td>'+ '<a href= ' + d[key][i] + ' target="_blank"><img src=' + d.image_thumb[i] + ' height=\'100\' width=\'100\' \\></a>'  +'</td>';

					}
					imageString += '</tr>';
					viewString += imageString;
					// viewString += '<tr>' + '<td> <b>' + key + '</b></td>' + '<td>'+ '<a href= ' + d[key] + ' target="_blank"><img src=' + d.image_thumb + ' height=\'100\' width=\'100\' \\></a>'  +'</td>' + '</tr>';
				}
			}
			else{

				viewString += '<tr>' + '<td> <b>' + key + '</b></td>' + '<td>'+d[key]+'</td>' + '</tr>';
				console.log("key to else: " + key + " viewString: " + viewString);

			}

		}
	}

	viewString += '</table>';
	console.log("viewString: " + viewString)
	return viewString;

}

$(document).ready(function() {
	console.log("Gon Data: " + gon.data);
	var table = $('#example').DataTable( {

		"data": gon.data,
		paging: false,
		"columns": [
			{
				"className":  'details-control',
				"orderable":      false,
				"data":           null,
				"defaultContent": ''
			},
			{ "data": "kidaluser" },
			{ "data": "date_created" },
			{ "data": "isActive" },
			{"data": "user_location"},
			{"data": "submission_id"}
		],
		"order": [[1, 'asc']],
		// buttons: [
		// 	{
		// 		extend: 'csv',
		// 		text: 'Copy all data',
		// 		exportOptions: {
		// 			modifier: {
		// 				search: 'none'
		// 			}
		// 		}
		// 	}
		// ]

	} );

	// Add event listener for opening and closing details
	$('#example tbody').on('click', 'td.details-control', function () {
		var tr = $(this).closest('tr');
		var row = table.row( tr );

		if ( row.child.isShown() ) {
			// This row is already open - close it
			row.child.hide();
			tr.removeClass('shown');
		}
		else {
			// Open this row
			//console.log("Row Hello: " + row.data());
			row.child( format(row.data()) ).show();
			tr.addClass('shown');
		}
	} );
} );
