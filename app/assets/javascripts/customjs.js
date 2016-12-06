function deleteAll(controller){
	var checkboxes = document.getElementsByName('checkbox_ids[]');
    var ids = [];
    for(var i=0; i<checkboxes.length; i++)
    {
      if(checkboxes[i].checked == true)
      {
        ids.push(checkboxes[i].value);
      }
    }
    if(ids.length > 0)
    {
      $.ajax({
        type:"DELETE",
        url:"/" + controller + "/destroy_selected",
        dataType:"html",
        data: {ids: ids},
        success:function()
        { 
        },
        error: function (){
          window.alert("Oops! Something wrong!");
        }
            });
    }
    else
      {
        window.alert('You have to select users!');
      }
}


<!--
ista funkcija, napisati je u helperu ili application.js, 
samo joj proslijedimo s kojim kontrolerom radimo i to 
dodamo u url: '/' + kontroler + '/destroy_selected'
podesiti sve putanje u config/routes.rb
postaviti isti id za sve checkboxove
 --> 