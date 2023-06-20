"use strict";

let x = {
  a: 2,
};

let proxy = new Proxy(x, {
  get(x, prop) {
    if (prop == "a") {
      return 1;
    } else return x[prop];
  },
});

console.log(proxy.a);
