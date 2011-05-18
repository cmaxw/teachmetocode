$("#episode_title").blur(function(){
  slug = $("#episode_slug").val();
  if(slug == "") {
    $("#episode_slug").val(string_to_slug($(this).val()));
  }
});
