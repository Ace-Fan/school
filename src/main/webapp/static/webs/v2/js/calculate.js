//直接去尾,num是小数点的位数
//如:formatnumber(13.45678,2)
//返回13.45(直接去掉小数点后面的数量)
function formatnumber(value, num) {
	var a, b, c, i;
	a = value.toString();
	b = a.indexOf('.');
	c = a.length;
	if (num == 0) {
		if (b != -1)
			a = a.substring(0, b);
	} else {
		if (b == -1) {
			a = a + ".";
			for (i = 1; i <= num; i++)
				a = a + "0";
		} else {
			a = a.substring(0, b + num + 1);
			for (i = c; i <= b + num; i++)
				a = a + "0";
		}
	}
	return a;
}

// 四舍五入
function roundnumber(value,num) {
	var a_str = formatnumber(value, num);
	var a_int = parseFloat(a_str);
	if (value.toString().length > a_str.length) {
		var b_str = value.toString().substring(a_str.length, a_str.length + 1);
		var b_int = parseFloat(b_str);
		if (b_int < 5) {
			return a_str;
		} else {
			var bonus_str, bonus_int;
			if (num == 0) {
				bonus_int = 1;
			} else {
				bonus_str = "0."
				for ( var i = 1; i < num; i++)
					bonus_str += "0";
				bonus_str += "1";
				bonus_int = parseFloat(bonus_str);
			}
			a_str = formatnumber(a_int + bonus_int, num)
		}
	}
	return a_str;
}

// 浮点数的加法
function floatPlus(arg1, arg2) {
	var r1, r2, m, c;
	try {
		r1 = arg1.toString().split(".")[1].length;
	} catch (e) {
		r1 = 0;
	}
	try {
		r2 = arg2.toString().split(".")[1].length;
	} catch (e) {
		r2 = 0;
	}
	c = Math.abs(r1 - r2);
	m = Math.pow(10, Math.max(r1, r2));
	if (c > 0) {
		var cm = Math.pow(10, c);
		if (r1 > r2) {
			arg1 = Number(arg1.toString().replace(".", ""));
			arg2 = Number(arg2.toString().replace(".", "")) * cm;
		} else {
			arg1 = Number(arg1.toString().replace(".", "")) * cm;
			arg2 = Number(arg2.toString().replace(".", ""));
		}
	} else {
		arg1 = Number(arg1.toString().replace(".", ""));
		arg2 = Number(arg2.toString().replace(".", ""));
	}
	return (arg1 + arg2) / m;
}

// 浮点数的减法
function floatSub(arg1, arg2) {
	var r1, r2, m, n;
	try {
		r1 = arg1.toString().split(".")[1].length;
	} catch (e) {
		r1 = 0;
	}
	try {
		r2 = arg2.toString().split(".")[1].length;
	} catch (e) {
		r2 = 0;
	}
	m = Math.pow(10, Math.max(r1, r2)); // last modify by deeka //动态控制精度长度
	n = (r1 >= r2) ? r1 : r2;
	return ((arg1 * m - arg2 * m) / m).toFixed(n);
}

// 浮点数的乘法
function floatMul(arg1, arg2) {
	var m = 0, s1 = arg1.toString(), s2 = arg2.toString();
	try {
		m += s1.split(".")[1].length;
	} catch (e) {
	}
	try {
		m += s2.split(".")[1].length;
	} catch (e) {
	}
	return Number(s1.replace(".", "")) * Number(s2.replace(".", ""))
			/ Math.pow(10, m);
}

// 浮点数的除法
function floatDiv(arg1, arg2) {
	var t1 = 0, t2 = 0, r1, r2;
	try {
		t1 = arg1.toString().split(".")[1].length;
	} catch (e) {
	}
	try {
		t2 = arg2.toString().split(".")[1].length;
	} catch (e) {
	}
	with (Math) {
		r1 = Number(arg1.toString().replace(".", ""));
		r2 = Number(arg2.toString().replace(".", ""));
		return (r1 / r2) * pow(10, t2 - t1);
	}
}

// 计算总价
function cal_money(itemnum,whtstd,dotnum) {
	var itemwht=roundnumber(0.000000000,dotnum);
	itemwht =roundnumber(floatMul(parseInt(itemnum), parseFloat(whtstd)),dotnum);
	return itemwht;
}

function add_reserve_dot2(a,b,dotnum) {
	var itemwht=roundnumber(0.000000000,a);
	itemwht =roundnumber(floatPlus(parseFloat(a), parseFloat(b)),dotnum);
	return itemwht;
}

/**
 * cal_tablesum:计算表格列的总和 参数值：inputfield(列的对象), num(小数点位数) 返回值：
 */
function cal_tablesum(inputfield, decnum) {
	var tablesum = 0.0000;
	var num = 0.0000;
	if (typeof (inputfield.length) != "undefined") {
		for (inti = 0; inti < inputfield.length; inti++) {
			num = inputfield[inti].value;
			if (num == "") {
				num = "0.0000";
			}
			if (!isNaN(num)) {
				tablesum = tablesum + parseFloat(num);
			}
		}
	} else {
		num = inputfield.value;
		if (num == "") {
			num = "0.0000";
		}
		if (!isNaN(num)) {
			tablesum = tablesum + parseFloat(num);
		}
	}
	return formatnumber(tablesum, decnum);
}
