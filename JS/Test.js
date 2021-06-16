'use strict';

let user = {
	_name: "ho",
	get name() {
		return this._name;
	}
};

user = new Proxy(user, {
	get(target, prop, reciever) {
		return target[prop];
	},
});

let admin = {
	_name: "no",
	__proto__: user,
};

console.log(admin.name);