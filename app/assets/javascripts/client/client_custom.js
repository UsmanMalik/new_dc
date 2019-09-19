console.log('hello custom client');

$(document).ready(function() {
    $.ajax({
        type: "GET",
        url: "/client/dashboard/2/check_js",
      });
});


$("#multi-group").select2();


var task_payload;
  
$("#submit_task").click( function()
     {
       // alert('button clicked');
       var title = $('#new_form_title').val();
       var group_ids = $('#multi-group').val();
       var group_ids_text = $('#multi-group').text();
       if (group_ids == null){
          alert("Please select a group(s) or select All users if you want to push this task to all the users.");
          return false;

       }
       // If first is undefined then we can move from there
       var all_users_check = $('#multi-group').val()[0];

       group_ids = group_ids.toString();
       var group_ids_array = group_ids.replace(/^,|,$/g,'').split(',');
       console.log("group ids: " + group_ids + "  group_ids_array: "+ group_ids_array+ "   first: " + all_users_check);

       if(all_users_check == ''){
         // if the task is for all users we add -999 to the group ids so we know its for all the users
         group_ids_array.push(-999);  
       }
       console.log("group ids: " + group_ids_array.length + "  group_ids_array: "+ group_ids_array.filter(Number) + "   first: " + all_users_check);

      //  return false;

       
       if (title.length == 0) {
            alert("Enter form title");
            return;
        }
        console.log("title: " + title + " payload: " + task_payload );

           var token = encodeURIComponent($('meta[name=csrf-token]').attr('content'));
          console.log('token: ' + token);
          $.ajax({
            type: "POST",
            url: '/client/tasks' + "?&authenticity_token=" + token,
            data: {task: {title: title, group_ids: group_ids_array.filter(Number), fields: task_payload}},
            dataType: 'json',
            success: function(msg) {
              location.href = msg.redirect_path;
            },
            error: function(msg){
              //console.log(msg);
              var response = JSON.parse(msg.responseText);
              alert(response.error);
            }
          });
     }
  );


  $(function(){
    fb = new Formbuilder({
      selector: '.fb-main',
      bootstrapData: []
    });

    fb.on('save', function(payload){
      // console.log(payload);
      task_payload = payload;
    })
  });