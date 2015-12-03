

jQuery ->
  $("[data-behavior='delete']").on "click", (e) ->
    e.preventDefault()

    swal {
      title: 'Are you sure you want to delete this recipe?'
      text: 'You will not be able to recover it!'
      type: 'warning'
      showCancelButton: true
      confirmButtonColor: '#DD6B55'
      confirmButtonText: 'Yes, delete it!'
      cancelButtonText: 'Oops, no!'
      closeOnConfirm: false
      closeOnCancel: false
    }, (confirmed) =>
      if confirmed
        $.ajax(
          url: $(this).attr("href")
          dataType: "JSON"
          method: "DELETE"
          success: =>
            swal 'Deleted!', 'Your Recipe has been deleted.', 'success'
            setTimeout (-> location.href = "/recipes"), 1000
            
        )
      else
        swal 'Cancelled', 'Your Recipe is safe :)', 'error'
      return


