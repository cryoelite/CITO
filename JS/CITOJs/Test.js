(function () {
  `use strict`;
  const button_name = "btn remove js-device-remove";
  const confirm_button_name =
    "shadow-button trans-02s trans-color js-confirm bt-confirm green";
  //let buttons = document.getElementsByClassName(button_name);
  buttons={length: 3};
  for (let i = 0; i < buttons.length; ++i) {
    //buttons[i].click();
    setTimeout(function () {
      //let confirm_buttons =
        //document.getElementsByClassName(confirm_button_name);
      //confirm_button[0].click();
      console.log(`${i} done`);
    }, 2);
    setTimeout(() => {}, 5);
  }
  return 0;
})()

