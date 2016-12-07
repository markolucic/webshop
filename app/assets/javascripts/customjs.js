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

var clicked = true;
function checkAll() {

    	var checkboxes = document.getElementsByName('checkbox_ids[]');
		if(clicked != true)
		{	for(var i=0; i< checkboxes.length; i++)
			{
				checkboxes[i].checked = false;
			}
			clicked = true;
		}
		else
		{
			for(var i=0; i< checkboxes.length; i++)
			{
				checkboxes[i].checked = true;
			}
			clicked = false;
		}
			
}
	