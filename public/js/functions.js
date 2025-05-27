function show_notification(p_color, p_message) {
    $.notify({
      icon: "nc-icon nc-bell-55",
      message: p_message
    }, {
      type: p_color,
      timer: 8000,
      placement: {
        from: 'top',
        align: 'right'
      }
    });
}